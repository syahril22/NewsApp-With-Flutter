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
          backgroundColor: Colors.red,
        ),
        body: ListView(
          children: [
            Image.network(article.urlToImage ??
                "https://climate.onep.go.th/wp-content/uploads/2020/01/default-image.jpgU"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(article.content ?? "tidak ada content"),
            ),
          ],
        ));
  }
}
