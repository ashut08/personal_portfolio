import 'package:flutter/material.dart';
import 'package:personal_portfolio/animation/entrancefader.dart';
import 'package:personal_portfolio/provider/blogs_provider.dart';
import 'package:personal_portfolio/provider/theme_provider.dart';
import 'package:personal_portfolio/utils/constant.dart';
import 'package:personal_portfolio/utils/screen_helper.dart';
import 'package:personal_portfolio/view/pages/sections/blogs/components/blog_card.dart';
import 'package:personal_portfolio/widgets/logo.dart';
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
    if (_isLoading) {
      return const CircularProgressIndicator();
    } else {
      return Scaffold(
        appBar: AppBar(
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
                  child:
                      themeProv.lightTheme ? const LightLogo() : const Logo(),
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
                  onPressed: () =>
                      launchUrlString("https://ashuflutterdev.medium.com/"),
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
        body: ScreenHelper.isMobile(context)
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: cardProvider.getBlogList()!.length,
                itemBuilder: (context, index) {
                  return BlogCard.buildBlogCard(
                      cardProvider.getBlogList()![index], context);
                })
            : ScreenHelper.isTablet(context)
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0,
                    ),
                    itemCount: cardProvider.getBlogList()!.length,
                    itemBuilder: (context, i) {
                      return BlogCard.buildBlogCard(
                          cardProvider.getBlogList()![i], context);
                    })
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0,
                    ),
                    itemCount: cardProvider.getBlogList()!.length,
                    itemBuilder: (context, i) {
                      return BlogCard.buildBlogCard(
                          cardProvider.getBlogList()![i], context);
                    },
                  ),
      );
    }
  }
}
