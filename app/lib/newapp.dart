import 'package:app/services/news_service.dart';
import 'package:flutter/material.dart';

class NewCloud extends StatelessWidget {
  const NewCloud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "New Cloud ",
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () async {
              NewsApi newsApi =  NewsApi();
              var articles = await newsApi.fetchArticles();
              for (var article in articles!) {
                print(article.title);
              }
            },
            child: Container(
              child: const Text("get data "),
            ),
          ),
        ),
      ),
    );
  }
}
