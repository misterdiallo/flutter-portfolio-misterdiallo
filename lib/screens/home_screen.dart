import 'package:flutter/material.dart';
import 'package:misterdiallo_portfolio/constants/constants.dart';
import 'package:misterdiallo_portfolio/data/data.dart';
import 'package:misterdiallo_portfolio/screens/qr_flutter_apge.dart';
import 'package:misterdiallo_portfolio/screens/widgets/info_card_widget.dart';
import 'package:misterdiallo_portfolio/screens/widgets/project_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: Row(
      //     children: const [
      //       Icon(
      //         Icons.circle_sharp,
      //         size: 12,
      //         color: Colors.black,
      //       ),
      //       SizedBox(
      //         width: 10,
      //       ),
      //       Text(
      //         "Untitled UI",
      //         style: TextStyle(color: Colors.black),
      //       )
      //     ],
      //   ),
      //   // foregroundColor: Colors.black,
      //   backgroundColor: Colors.white,
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    kGradient1,
                    kGradient2,
                  ],
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(imagePath),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                name,
                style: kTitleText,
              ),
            ),
            Center(
              child: Text(
                "@$username",
                style: kSubTitleTextLight.copyWith(
                    fontWeight: FontWeight.normal, fontSize: 15.0),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                aboutMeShort,
                textAlign: TextAlign.center,
                style: kSubTitleText,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () async {
                    //Code to launch resume
                    final Uri url = Uri.parse(resumeLink);
                    await launchUrl(url);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.file_present_rounded,
                        size: 16,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Resume",
                        style: kSubTitleText,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black87)),
                  onPressed: () async {
                    //Code to launch whatsapp
                    final Uri urlGithub = Uri.parse(githubLink);
                    await launchUrl(urlGithub);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.account_tree_rounded,
                        size: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Github",
                        style: kSubTitleText.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 1, 37, 90)),
                  ),
                  onPressed: () async {
                    //Code to launch whatsapp
                    final Uri urlMedium = Uri.parse(mediumLink);
                    await launchUrl(urlMedium);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.text_snippet_rounded,
                        size: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Blog",
                        style: kSubTitleText.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: screenSize.width > 1200
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("About Me", style: kSectionTitleText),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(aboutMeSummary),
                                const Divider(),
                                Text(
                                  "Experience",
                                  style: kSectionTitleText,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(aboutWorkExperience),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Column(
                              children: const [
                                InfoCardWidget(),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("About Me", style: kSectionTitleText),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(aboutMeSummary),
                              const Divider(),
                              Text(
                                "Experience",
                                style: kSectionTitleText,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(aboutWorkExperience),
                            ],
                          ),
                          Column(
                            children: const [
                              InfoCardWidget(),
                            ],
                          ),
                        ],
                      ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  " Main Projects",
                  style: kSectionTitleText,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //!
            //!
            //!
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: projectList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProjectWidget(
                      projectData: projectList[index],
                    );
                  },
                ),
              ),
            ),
            //!
            //!
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                copyrightMessage,
                style: kSubTitleTextLight.copyWith(
                    color: const Color.fromARGB(255, 13, 13, 77)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () => showDialog(
          context: context,
          barrierDismissible: true,
          builder: (_) {
            return Center(
              child: SizedBox(
                child: AlertDialog(
                  title: Text(
                    " Add Wechat ",
                    textAlign: TextAlign.center,
                    style: kSectionTitleText,
                  ),
                  content: const SingleChildScrollView(child: QrCodeScreen()),
                  actions: [
                    TextButton(
                      child: Text(
                        "Close",
                        style: kSubTitleText,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        child: Image.network(
            "https://th.bing.com/th/id/R.b69962bf178ad10f2f817ca89c9f1f87?rik=O%2bRAf1LWJLQ1bQ&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fwechat-png-file-history-120.png&ehk=M%2btqzY7WqjyY6n3ARmjmsvDGx6cO1H%2fLCEfWvfX91n8%3d&risl=&pid=ImgRaw&r=0"),
      ),
    );
  }
}
