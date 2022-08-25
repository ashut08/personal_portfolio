import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:AshuTech/models/medium_blog_model.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:AshuTech/utils/sizeconfig.dart';
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
  double elevation = 4.0;
  double scale = 1.0;
  Offset translate = const Offset(0, 0);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    var height = SizeConfig.screenHeight;
    var width = SizeConfig.screenWidth;
    return InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: widget.item!.link == null
            ? () {}
            : () => launchUrlString(
                  widget.item!.link,
                ),
        onHover: (value) {
          if (value) {
            setState(() {
              isHover = true;
              elevation = 1.3;
              scale = 1.1;
              translate = const Offset(2, 2);
            });
          } else {
            setState(() {
              isHover = false;
              elevation = 1;
              scale = 1;
              translate = const Offset(0, 0);
            });
          }
        },
        child: Transform.translate(
            offset: translate,
            child: Transform.scale(
              scale: scale,
              child: Container(
                decoration: BoxDecoration(
                  color: themeProvider.lightTheme
                      ? Colors.white
                      : Colors.grey[800],
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
                margin: isHover
                    ? const EdgeInsets.all(20)
                    : const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                // height: height! * 0.3,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      widget.item!.thumbnail,
                      width: width,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Wrap(
                      runSpacing: 5.0,
                      spacing: 5.0,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(3)),
                            child: Text(
                              widget.item!.categories[0],
                              style: TextStyle(
                                  color: themeProvider.lightTheme
                                      ? Colors.black
                                      : Colors.white),
                            )),
                        Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(3)),
                            child: Text(
                              widget.item!.categories[1],
                              style: TextStyle(
                                  color: themeProvider.lightTheme
                                      ? Colors.black
                                      : Colors.white),
                            )),
                        Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(3)),
                            child: Text(
                              widget.item!.categories[2],
                              style: TextStyle(
                                  color: themeProvider.lightTheme
                                      ? Colors.black
                                      : Colors.white),
                            )),
                      ],
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
                          fontSize: 16,
                          color: themeProvider.lightTheme
                              ? Colors.black
                              : Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            )));
  }
}
