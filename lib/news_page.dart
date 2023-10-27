import 'package:flutter/material.dart';
import 'package:news_app/article.dart';
import 'package:news_app/detail_news_Page.dart';
import 'package:news_app/service.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late List<Article> listArticle;
  bool isLoading = false;

  Future getListArticle() async {
    setState(() {
      isLoading = true;
    });

    listArticle = await Service.fetchArticles();
    print("Datanya : $listArticle ");

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getListArticle();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Page'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : listArticle.isEmpty
              ? const Text("Listnya kosong")
              : ListView.builder(
                  itemCount: listArticle.length,
                  itemBuilder: (context, index) {
                    final article = listArticle[index];
                    return GestureDetector(
                      onTap: () {
                        final route = MaterialPageRoute(
                            builder: (context) =>
                                DetailNewsPage(article: article));
                        Navigator.push(context, route);
                      },
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 5,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              child: Image.network(
                                article.urlToImage ??
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTar_ouGael5ODlrC1kbFbKLpEPSJtTQqdaIg&usqp=CAU",
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                article.title ?? "Title kosong",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      article.author ?? 'Tidak ada author',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    article.publishedAt.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
    );
  }
}
