// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:safisampletest/_utils/constants/app_colors.dart';
import 'package:safisampletest/articles/models/article.dart';

class ArticleDetailScreen extends StatelessWidget {
  final Article article;
  const ArticleDetailScreen(this.article, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
        backgroundColor: AppColors.black,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          if (article.mediumImage != null)
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Image.network(
                article.mediumImage!,
                fit: BoxFit.fill,
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(height: 4),
                Text(
                  article.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  article.abstractText,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(article.updated),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
