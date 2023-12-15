import 'dart:convert';
import 'package:flutter/material.dart';
import '../helper/blog_tile.dart';
import '../model/acticle.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> news = [];

  Future getNews() async {
    news.clear();

    var response = await http.get(
      Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=in&apiKey=57e57303e14549bf9f7a36a65f3de434"),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // whenever we request for call it take some time to fetch data thats why i am using futurebuilder and the future we are waiting for is getNews() method
        body: FutureBuilder(
            future: getNews(),
            builder: (context, snapshot) {
              //snapshot use to check current request call status
              if (snapshot.connectionState == ConnectionState.done) {
                return CustomScrollView(
                  slivers: <Widget>[
                    const SliverAppBar(
                      backgroundColor: Color.fromRGBO(239, 83, 80, 1), //shade300
                      expandedHeight: 80,
                      scrolledUnderElevation: 5.0,
                      centerTitle: true,
                      pinned: true,
                      shadowColor: Color.fromRGBO(239, 83, 80, 1),

                      flexibleSpace: FlexibleSpaceBar(
                        expandedTitleScale: 1.4,
                        centerTitle: true,
                        title: Text(
                          'Daily Bugle',
                          style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          // Blog Tile
                          return BlogTile(
                            blogName: news[index].name,
                            blogTitle: news[index].title,
                            blogUrl: news[index].url,
                            blogUrlToImage: news[index].urlToImage,
                            blogPublishedAt: news[index].publishedAt,
                          );
                        },
                        childCount: news.length,
                      ),
                    )
                  ],
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
            }));
  }
}
