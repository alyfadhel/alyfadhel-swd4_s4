import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:swd4_s4/core/shared/widgets/news_widgets/build_article.dart';

class BuildArticleItem extends StatelessWidget {
  final List<dynamic>article;
  final bool isLoading;
  const BuildArticleItem({super.key, required this.article, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: article.isNotEmpty,
      builder:
          (context) => ListView.separated(
        itemBuilder:
            (context, index) => BuildArticle(
          model: article[index],
        ),
        separatorBuilder:
            (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Divider(height: 1.0, color: Colors.grey),
        ),
        itemCount: article.length,
      ),
      fallback: (context) => isLoading ? Container() : Center(child: CircularProgressIndicator()),
    );
  }
}
