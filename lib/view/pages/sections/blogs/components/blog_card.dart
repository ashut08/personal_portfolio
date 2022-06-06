import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/models/medium_blog_model.dart';
import 'package:personal_portfolio/provider/theme_provider.dart';
import 'package:personal_portfolio/utils/constant.dart';
import 'package:personal_portfolio/utils/sizeconfig.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BLogCard extends StatefulWidget {
  BLogCard({Key? key, this.item}) : super(key: key);
  Items? item;
  @override
  State<BLogCard> createState() => _BLogCardState();
}

class _BLogCardState extends State<BLogCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    var height = SizeConfig.screenHeight;
    var width = SizeConfig.screenWidth;
    return Container(
      decoration: BoxDecoration(
        color: themeProvider.lightTheme ? Colors.white : Colors.grey[800],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          !isHover
              ? const BoxShadow(
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: Offset(0, 4),
                  color: Colors.grey)
              : BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 4,
                  offset: const Offset(0, 4),
                  color: kPrimaryColor.withOpacity(0.5),
                ),
        ],
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      // height: height! * 0.3,
      width: width,
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: widget.item!.link == null
            ? () {}
            : () => launchUrlString(
                  widget.item!.link,
                ),
        onHover: (isHovering) {
          if (isHovering) {
            setState(() {
              isHover = true;
            });
          } else {
            setState(() {
              isHover = false;
            });
          }
        },
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.loose,
          children: [
            isHover
                ? Container(
                    decoration: BoxDecoration(
                        color: themeProvider.lightTheme
                            ? Colors.white
                            : Colors.grey[800],
                        shape: BoxShape.circle),
                    child: Image.asset(
                      "assets/readmore.jpg",
                      fit: BoxFit.cover,
                    ))
                : Column(
                    children: [
                      Image.network(
                        widget.item!.thumbnail,
                        width: width,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Published Date : ",
                            style: TextStyle(
                                color: themeProvider.lightTheme
                                    ? Colors.black
                                    : Colors.white),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            child: Text(
                              widget.item!.pubDate.substring(0, 10),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.item!.title,
                        //  overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: themeProvider.lightTheme
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
