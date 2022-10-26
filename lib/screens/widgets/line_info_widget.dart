// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:misterdiallo_portfolio/constants/constants.dart';
import 'package:misterdiallo_portfolio/models/element_info_model.dart';
import 'package:url_launcher/url_launcher.dart';

class LineInfoWidget extends StatelessWidget {
  ElementInfo element;
  LineInfoWidget({
    Key? key,
    required this.element,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          element.title,
          style: kSubTitleText,
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () async {
            if (element.link_to.toString().isNotEmpty) {
              final Uri url = Uri.parse(element.link_to.toString());
              await launchUrl(url);
            }
          },
          child: Row(
            children: [
              element.icon_left != null
                  ? Icon(
                      element.icon_left,
                      size: 16,
                    )
                  : const SizedBox(),
              const SizedBox(
                width: 5,
              ),
              element.text.length < 10
                  ? Text(
                      element.text,
                      style: kSubTitleTextLight.copyWith(
                          fontWeight: FontWeight.w500, fontSize: 14.0),
                    )
                  : Flexible(
                      child: Text(
                      element.text,
                      softWrap: true,
                      maxLines: 2,
                      style: kSubTitleTextLight.copyWith(
                          fontWeight: FontWeight.w500, fontSize: 14.0),
                    )),
              const SizedBox(
                width: 5,
              ),
              element.icon_right != null
                  ? Icon(
                      element.icon_right,
                      size: 16,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
