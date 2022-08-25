import 'package:flutter/material.dart';
import 'package:AshuTech/animation/entrancefader.dart';
import 'package:AshuTech/provider/blogs_provider.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:AshuTech/utils/screen_helper.dart';
import 'package:AshuTech/view/pages/sections/blogs/components/blog_card.dart';
import 'package:AshuTech/widgets/logo.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  bool _isLoading = false;

  @override
  void initState() {
    final cardProvider = Provider.of<BlogProvider>(context, listen: false);
    if (cardProvider.getBlogList()!.isEmpty) {
      setState(() {
        _isLoading = true;
      });
    }

    cardProvider.quickUpdateBlogFeed().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<BlogProvider>(context);
    final themeProv = Provider.of<ThemeProvider>(context);

    return Scaffold(
        backgroundColor: themeProv.lightTheme ? Colors.white : Colors.grey[800],
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_sharp,
              color: !themeProv.lightTheme ? Colors.white : Colors.grey[800],
            ),
          ),
          elevation: 0.0,
          backgroundColor:
              themeProv.lightTheme ? Colors.white : Colors.grey[800],
          title: MediaQuery.of(context).size.width < 780
              ? EntranceFader(
                  duration: const Duration(milliseconds: 250),
                  offset: const Offset(0, -10),
                  delay: const Duration(seconds: 3),
                  child:
                      themeProv.lightTheme ? const LightLogo() : const Logo(),
                )
              : EntranceFader(
                  offset: const Offset(0, -10),
                  duration: const Duration(milliseconds: 250),
                  delay: const Duration(milliseconds: 100),
                  child: themeProv.lightTheme
                      ? MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const LightLogo())
                      : MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Logo()),
                ),
          actions: [
            EntranceFader(
              offset: const Offset(0, -10),
              delay: const Duration(milliseconds: 100),
              duration: const Duration(milliseconds: 250),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                height: 60.0,
                child: MaterialButton(
                  hoverColor: kPrimaryColor,
                  onPressed: () => launchUrlString(mediumrl),
                  child: Text(
                    "Read More".toUpperCase(),
                    style: TextStyle(
                      color: themeProv.lightTheme ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: _isLoading
            ? const Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              )
            : ScreenHelper(
                desktop: LayoutBuilder(
                  builder: (context, constraints) => GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: constraints.biggest.aspectRatio * 3 / 8,
                      // crossAxisSpacing: 5.0,
                      // mainAxisSpacing: 5.0,
                    ),
                    itemCount: cardProvider.getBlogList()!.length,
                    itemBuilder: (context, i) {
                      return BLogCard(
                        item: cardProvider.getBlogList()![i],
                      );
                    },
                  ),
                ),
                mobile: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cardProvider.getBlogList()!.length,
                  itemBuilder: (context, index) {
                    return BLogCard(
                      item: cardProvider.getBlogList()![index],
                    );
                  },
                ),
                tablet: LayoutBuilder(
                  builder: (context, constraints) => GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: constraints.biggest.aspectRatio *
                          1 /
                          constraints.biggest.aspectRatio /
                          1.4,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    itemCount: cardProvider.getBlogList()!.length,
                    itemBuilder: (context, i) {
                      return BLogCard(
                        item: cardProvider.getBlogList()![i],
                      );
                    },
                  ),
                ),
              ));
  }
}
