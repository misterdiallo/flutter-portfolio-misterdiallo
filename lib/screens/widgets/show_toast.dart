import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast({
  String msg = "",
  Color bgColor = const Color.fromARGB(255, 177, 116, 11),
  Color txtColor = Colors.white,
  fontsize = 16.0,
  bool webShowClose = false,
  // dynamic webBgColor = "linear-gradient(to right, #00b09b, #96c93d)",
  dynamic webBgColor =
      "linear-gradient(90deg, rgba(255,162,0,1) 0%, rgba(233,132,7,1) 53%, rgba(166,0,255,1) 100%)",
  dynamic webPosition = "right",
}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 3,
    backgroundColor: bgColor,
    textColor: txtColor,
    fontSize: fontsize,
    webBgColor: webBgColor,
    webShowClose: webShowClose,
    webPosition: webPosition,
  );
}
