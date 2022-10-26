import 'package:flutter/material.dart';
import 'package:misterdiallo_portfolio/data/data.dart';
import 'package:misterdiallo_portfolio/models/element_info_model.dart';
import 'package:misterdiallo_portfolio/screens/widgets/line_info_widget.dart';

class InfoCardWidget extends StatelessWidget {
  const InfoCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // ! LinkedIn
          LineInfoWidget(
            element: ElementInfo(
              "Location",
              location,
              Icons.location_city_rounded,
              null,
              "",
            ),
          ),
          // ! Instagram
          // ! LinkedIn
          LineInfoWidget(
            element: ElementInfo(
              "LinkedIn",
              "@misterdiallo",
              null,
              Icons.launch,
              linkedinLink,
            ),
          ),
          // ! Instagram
          LineInfoWidget(
            element: ElementInfo(
              "Instagram",
              "@misterdiallo",
              null,
              Icons.launch,
              instagramLink,
            ),
          ),
          // ! Facebook
          LineInfoWidget(
            element: ElementInfo(
              "Facebook",
              "@misterdiallo",
              null,
              Icons.launch,
              facebookLink,
            ),
          ),
          // ! Email
          LineInfoWidget(
            element: ElementInfo(
              "Email",
              contactEmail,
              Icons.email_rounded,
              null,
              "",
            ),
          ),
        ]),
      ),
    );
  }
}
