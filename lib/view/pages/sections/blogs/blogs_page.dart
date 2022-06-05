import 'package:flutter/material.dart';
import 'package:personal_portfolio/provider/blogs_provider.dart';
import 'package:personal_portfolio/utils/screen_helper.dart';
import 'package:personal_portfolio/view/pages/sections/blogs/components/blog_card.dart';
import 'package:provider/provider.dart';

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
    if (_isLoading) {
      return const CircularProgressIndicator();
    } else {
      return Scaffold(
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
                    }),
      );
    }
  }
}
