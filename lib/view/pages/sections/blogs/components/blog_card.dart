import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/models/medium_blog_model.dart';
import 'package:personal_portfolio/utils/constant.dart';
import 'package:personal_portfolio/utils/sizeconfig.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogCard {
  static Widget buildBlogCard(Items item, BuildContext context) {
    SizeConfig().init(context);
    var height = SizeConfig.screenHeight;
    var width = SizeConfig.screenWidth;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 4,
            offset: Offset(0, 4),
            color: Colors.grey,
          ),
        ],
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      // height: height! * 0.3,
      width: width,
      child: MaterialButton(
        onPressed: () {
          launchUrl(
            Uri.parse(item.link),
          );
        },
        child: Column(
          children: [
            Image.network(
              item.thumbnail,
              width: width,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text("Published Date : "),
                Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Text(
                      item.pubDate.substring(0, 10),
                      style: const TextStyle(color: Colors.white),
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              item.title,
              //  overflow: TextOverflow.ellipsis,
              style: GoogleFonts.montserrat(
                  fontSize: 18,
                  //  color: themeProvider.lightTheme ? Colors.black : Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
