import 'package:AshuTech/models/social_media_model.dart';
import 'package:AshuTech/widgets/social_icons.dart';
import 'package:flutter/material.dart';

// Colors
const Color kPrimaryColor = Color(0xff518DFF);
const Color kSecondryColor = Color(0xffAF2BFC);

// Social Media

//medium blogs url
SizedBox size10 = const SizedBox(
  height: 10,
);
const String mediumBlogUrl =
    "https://api.rss2json.com/v1/api.json?rss_url=https://medium.com/feed/@ashuflutterdev";

final List<SocialMediaModel> ksocialData = [
  SocialMediaModel(
      icon: "assets/newicon/linkedin.svg",
      link: "https://www.linkedin.com/in/ashu8/"),
  SocialMediaModel(
      icon: "assets/newicon/stackoverflow.svg",
      link: "https://stackoverflow.com/users/13400001/ashutosh-singh"),
  SocialMediaModel(
      icon: "assets/newicon/instagram.svg",
      link: "https://www.instagram.com/love_coding_with_ashu/"),
  SocialMediaModel(
      icon: "assets/newicon/media.svg",
      link: "https://medium.com/@ashuflutterdev"),
  SocialMediaModel(
      icon: "assets/newicon/twitter.svg", link: "https://twitter.com/ashu_080"),
  SocialMediaModel(
      icon: "assets/newicon/github.svg", link: "https://github.com/ashut08"),
];
// URL Launcher
// void launchURL(String url) async => await launchUrl(Uri.parse(url))
//     ? await launchUrl(Uri.parse(url))
//     : throw 'Could not launch $url';

// Community

const String ur =
    "https://previews.123rf.com/images/hozard/hozard1809/hozard180900030/108682479-horizontal-headshot-of-young-handsome-european-caucasian-man-pictured-isolated-on-grey-background-we.jpg";
// Tools & Tech
final kTools = [
  "Flutter",
  "Dart",
  'Firebase',
  'Swift UI',
  "Kotlin",
  'Jenkins',
  'Docker',
  "Swift",
  "Git",
];

final kServicesTitles = [
  "Mobile App Development",
  "UI/UX Designing",
  "Rapid Prototyping",
  "Technical Blog Writing",
  "Open Source - GitHub",
];

const String mediumrl = "https://ashuflutterdev.medium.com/";
