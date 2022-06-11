import 'package:flutter/material.dart';
import 'package:personal_portfolio/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class AboutMoile extends StatelessWidget {
  const AboutMoile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          color: Colors.black54,
          child: Container(
            margin: const EdgeInsets.all(4),
            child: Image.network(
                "https://previews.123rf.com/images/hozard/hozard1809/hozard180900030/108682479-horizontal-headshot-of-young-handsome-european-caucasian-man-pictured-isolated-on-grey-background-we.jpg"),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Text(
              "About Me".toUpperCase(),
            ),
            Text(
              "I'm Ashutosh",
              style: TextStyle(
                  color:
                      themeProvider.lightTheme ? Colors.black : Colors.white),
            )
          ],
        ),
      ],
    );
  }
}
