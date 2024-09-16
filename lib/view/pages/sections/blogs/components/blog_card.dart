import 'package:AshuTech/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:AshuTech/models/medium_blog_model.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:AshuTech/utils/sizeconfig.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../widgets/divider.dart';
import '../../../../../widgets/gradient_text.dart';

// ignore: must_be_immutable
class BLogCard extends StatefulWidget {
  BLogCard({super.key, this.item, this.isFocus});
  ArticleModel? item;
  bool? isFocus;
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

    var width = SizeConfig.screenWidth;
    return InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => launchUrlString(
              widget.item!.link ?? "",
            ),
        child: Container(
          margin:
              const EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 10),
          decoration: BoxDecoration(
            color: themeProvider.lightTheme ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(12),
            boxShadow: widget.isFocus == true
                ? [
                    BoxShadow(
                        color: const Color(0xffA436FC).withOpacity(0.45),
                        blurRadius: 11,
                        spreadRadius: 3)
                  ]
                : [],
          ),

          // height: height! * 0.3,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12)),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.item?.image ?? ""),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  runSpacing: 10.0,
                  spacing: 10.0,
                  children: widget.item!.categories!
                      .asMap()
                      .entries
                      .map(
                        (e) => Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                gradient: primaryGradientColor,
                                borderRadius: BorderRadius.circular(3)),
                            child: Text(
                              e.value,
                              style: Theme.of(context).textTheme.bodySmall,
                            )),
                      )
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
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
                          gradient: primaryGradientColor,
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: Text(
                        widget.item!.pubDate!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.item!.title!,
                  //  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ));
  }
}
