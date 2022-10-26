import 'package:flutter/material.dart';
import 'package:misterdiallo_portfolio/models/project_model.dart';

//Update with colors of your choice for dp background gradient
Color kGradient1 = const Color.fromARGB(255, 49, 6, 57);
Color kGradient2 = const Color.fromARGB(255, 244, 164, 4);

String imagePath = "assets/images/profile.jpg";

//String name to modify
String copyrightMessage =
    "${DateTime.now().year} © Mister Diallo - All right reserved.";

//String name to modify
String name = "Alpha Diallo 苏泽";
//String username to modify
String username = "misterdiallo";
//String wechatQr to modify
String wechatQr = "https://u.wechat.com/MOT4pwipuY6WKRHqr8m5J3s";
//String wechatQr to modify
String wechatId = "TheGenius_diallo";

//Link to resume on Google Drive
String resumeLink =
    "https://drive.google.com/file/d/1PMF7-0e6fLwjvrX4dJqLGXURfRInYpzj/view?usp=sharing";

//Link to Github
String githubLink = "https://github.com/misterdiallo";
//Link to Medium
String mediumLink = "https://medium.com/@misterdiallo";
//Link to LinkedIn
String linkedinLink = "https://www.linkedin.com/in/misterdiallo/";
//Link to Facebook
String facebookLink = "https://www.facebook.com/misterdiallo/";
//Link to Instagram
String instagramLink = "https://www.instagram.com/misterdiallo/";
// Contact Whatsapp
String contactWhatsapp = "https://wa.me/8618354919286";
//Contact Email
String contactEmail = "misterdiallo@outlook.com";

String aboutMeShort = '''
Data Scientist, Full-stack developer, and e-commerce entrepreneur.
''';
String aboutWorkExperience = '''
Recently, 
- I worked on flutter projects, developed mobile and web apps using flutter.
- I developed backend projects using java spring and expressJs.
- I worked on Data science projects to build robust analytics and solve business problems.
- I teached computer programming on my spare time.
- I also run my own international trade business between China and Africa.
''';

String aboutMeSummary = '''
I'm a passionate Data Scientist and boring full-stack developer from Guinea 🇬🇳 (currently living in China 🇨🇳)
🔭 I’m currently working on Mobile app with flutter combined with a springboot backend and also Advanced Data Science projects.
🌱 I’m currently(still) learning Data Science, Flutter, Spring framework, and some new stuffs out there.
👯 I’m looking to collaborate on any challenging projects.
🤝 I’m looking for help and more ideas with all my projects on my github (https://github.com/misterdiallo).

💬 We can talk about Flutter, Data Science, Spring Framework, and making money.
📫 How to reach me:  misterdiallo@outlook.com

⚡ Fun fact, I think, I'm funny and boring at the same time. If the state of my mind is on 0 you'll get the funny guy, if it's on 1 you'll face with the boring guy.
''';

String origin = "Conakry, Guinea 🇬🇳";
String location = "Linyi, China 🇨🇳";
String website = "misterdiallo.com";
String portfolio = "misterdiallo";

List<Project> projectList = [
  Project(
      name: "Data Science",
      description: "A Forecasting Time Series Data with Prophet.",
      link:
          "https://github.com/misterdiallo/Data-Science-project-Forecasting-Time-Series-Data-with-Prophet"),
  Project(
      name: "Web App - Javascript",
      description: "App for send SMS from a web interface using javascript.",
      link: "https://github.com/misterdiallo/sendSms"),
  Project(
      name: "Backend - Spring",
      description:
          "A backend application for the graduate group meeting in Linyi University.",
      link: "https://github.com/misterdiallo/graduate-meeting"),
  Project(
      name: "Web App - Javascript",
      description: "A small web messenger App using javascript.",
      link: "https://github.com/misterdiallo/monMessenger"),
  Project(
      name: "Data Science",
      description: "Here are all my Data Science learning notes and works.",
      link: "https://github.com/misterdiallo/Learning-Data-Science"),
  Project(
      name: "Mobile App - Flutter",
      description: "A note app using flutter and firebase. ",
      link: "https://github.com/misterdiallo/my_notes"),
  Project(
      name: "Web App - VueJs",
      description:
          "A small app to upload file in the server using Vue Js, I used it in Flutter web because flutter web was not allowing selecting and uploading files.",
      link: "https://github.com/misterdiallo/vueJsUploadFile")
];
