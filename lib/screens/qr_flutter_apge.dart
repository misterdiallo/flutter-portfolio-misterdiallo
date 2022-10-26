import 'dart:async';
import 'dart:ui' as ui;
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:misterdiallo_portfolio/constants/constants.dart';
import 'package:misterdiallo_portfolio/screens/widgets/rectangle_painter.dart';
import 'package:misterdiallo_portfolio/screens/widgets/show_toast.dart';
import 'package:universal_html/html.dart' as html;
//ignore: avoid_web_libraries_in_flutter

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:misterdiallo_portfolio/data/data.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// This is the screen that you'll see when the app starts
class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  final GlobalKey genKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    String message = wechatQr;
    // _toastInfo(String info) {
    //   Fluttertoast.showToast(msg: info, toastLength: Toast.LENGTH_LONG);
    // }

    final qrFutureBuilder = FutureBuilder<ui.Image>(
      future: _loadOverlayImage(),
      builder: (ctx, snapshot) {
        const size = 180.0;
        if (!snapshot.hasData) {
          return const SizedBox(width: size, height: size);
        }
        return CustomPaint(
            isComplex: true,
            willChange: true,
            size: const Size.square(size),
            foregroundPainter: QrPainter(
              data: message,
              version: QrVersions.auto,
              // eyeStyle: const QrEyeStyle(
              //   eyeShape: QrEyeShape.circle,
              //   color: Colors.black,
              // ),
              // dataModuleStyle: QrDataModuleStyle(
              //   dataModuleShape: QrDataModuleShape.square,
              //   color: kGradient1,
              // ),
              embeddedImage: snapshot.data,
              embeddedImageStyle: QrEmbeddedImageStyle(
                size: const Size.square(30),
              ),
            ),
            painter: RectanglePainter());
      },
    );

    return Material(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Center(
            child: SizedBox(
              width: 190,
              child: RepaintBoundary(
                key: genKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    qrFutureBuilder,
                    const SizedBox(
                      height: 10,
                    ),
                    EasyRichText(
                      "Wechat Id:   $wechatId",
                      textAlign: TextAlign.center,
                      caseSensitive: false,
                      selectable: true,
                      patternList: [
                        EasyRichTextPattern(
                          targetString: wechatId,
                          style: kSubTitleText,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () => takeAndSavePicture(context),
            icon: const Icon(Icons.download),
          ),
        ],
      ),
    );
  }

  Future<ui.Image> _loadOverlayImage() async {
    final completer = Completer<ui.Image>();
    final byteData = await rootBundle.load(imagePath);
    ui.decodeImageFromList(byteData.buffer.asUint8List(), completer.complete);
    return completer.future;
  }

  final WebImageDownloader webImageDownloader = WebImageDownloader();
  Future<void> takeAndSavePicture(context) async {
    RenderRepaintBoundary boundary =
        genKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    if (kIsWeb) {
      await downloadImageFromUInt8List(
          uInt8List: pngBytes, name: "$name-wechat-qr-code");
      Navigator.pop(context);
      showToast(msg: "Qr Code downloaded successfuly.");
    } else {
      final result = await ImageGallerySaver.saveImage(
          byteData.buffer.asUint8List(),
          name: "$name-wechat-qr-code",
          quality: 80);
      if (result != null && result['isSuccess'] == true) {
        Navigator.pop(context);
        showToast(msg: "Qr Code downloaded successfuly.");
      }
    }
  }

  // Download image from uInt8List to user device
  Future<void> downloadImageFromUInt8List({
    required Uint8List uInt8List,
    double imageQuality = 1.0,
    String? name,
  }) async {
    final image = await decodeImageFromList(uInt8List);
    final html.CanvasElement canvas = html.CanvasElement(
      height: image.height,
      width: image.width,
    );
    final ctx = canvas.context2D;
    final List<String> binaryString = [];
    for (final imageCharCode in uInt8List) {
      final charCodeString = String.fromCharCode(imageCharCode);
      binaryString.add(charCodeString);
    }
    final data = binaryString.join();
    final base64 = html.window.btoa(data);
    final img = html.ImageElement();
    img.src = "data:image/png;base64,$base64";
    final html.ElementStream<html.Event> loadStream = img.onLoad;
    loadStream.listen((event) {
      ctx.drawImage(img, 0, 0);
      final dataUrl = canvas.toDataUrl("image/png", imageQuality);
      final html.AnchorElement anchorElement =
          html.AnchorElement(href: dataUrl);
      anchorElement.download = name ?? dataUrl;
      anchorElement.click();
    });
  }
}
