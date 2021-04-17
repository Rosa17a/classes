import 'dart:math';

import 'package:flutter/material.dart';
import 'package:space_flights/api/article_model.dart';

class ArticleWidget extends StatelessWidget {
  final Function () onTap;
  final Article article;

  const ArticleWidget({Key? key, required this.article, required  this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(article.title ?? ""),
      subtitle: Text(article.summary ?? ''),
      leading: Container(
          width: min(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height) *
              0.3,
          height: min(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height) *
              0.3,
          child: article.imageUrl != null
              ? Image.network(article.imageUrl!)
              : Placeholder(
                  color: Colors.cyanAccent,
                )),
      onTap: onTap,
    );
  }
}
