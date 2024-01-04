import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/acticle.dart';
import 'blog_tile.dart';

class CountryHeadlines extends StatelessWidget {
  const CountryHeadlines({super.key, required this.countryCode});

  final String countryCode;

  @override
  Widget build(BuildContext context) {
    List<Article> news = [];

    Future<void> getCountryHeadlines(String countryCode) async {
      news.clear();

      var response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=$countryCode&apiKey=57e57303e14549bf9f7a36a65f3de434"),
      );
      var jsonData = jsonDecode(response.body);

      if (jsonData['status'] == 'ok') {
        for (var element in jsonData['articles']) {
          if (element['urlToImage'] != null && element['title'] != null) {
            // instead of final Article can be used
            final articleModel = Article(
              name: element['source']['name'] ?? 'name',
              title: element['title'] ?? 'title',
              url: element['url'],
              urlToImage: element['urlToImage'] ?? 'image',
              publishedAt: element['publishedAt'] ?? 'time',
            );
            news.add(articleModel);
          }
        }
      }
    }

    // whenever we request for call it take some time to fetch data thats why i am using futurebuilder and the future we are waiting for is getNews() method
    return FutureBuilder(
        future: getCountryHeadlines(countryCode),
        builder: (context, snapshot) {
          //snapshot use to check current request call status
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  // return blog
                  return BlogTile(
                    blogName: news[index].name,
                    blogTitle: news[index].title,
                    blogUrl: news[index].url,
                    blogUrlToImage: news[index].urlToImage,
                    blogPublishedAt: news[index].publishedAt,
                  );
                },
              ),
            );
          }

          // if still loading then show progress indicator
          else {
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromRGBO(239, 83, 80, 1),
              ),
            );
          }
        }
      );
  }
}
