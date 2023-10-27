import 'package:flutter/material.dart';
import 'package:news_app/article.dart';

class DetailNewsPage extends StatelessWidget {
  final Article article;
  const DetailNewsPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail News Page'),
        ),
        body: ListView(
          children: [
            Image.network(article.urlToImage ??
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTar_ouGael5ODlrC1kbFbKLpEPSJtTQqdaIg&usqp=CAU"),
            Text(article.content ?? "tidak ada content"),
          ],
        ));
  }
}
