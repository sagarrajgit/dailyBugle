import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/acticle.dart';
import 'blog_tile.dart';

class CountryNews extends StatefulWidget {
  final String countryCode;
  const CountryNews({super.key, required this.countryCode});

  @override
  State<CountryNews> createState() => _CountryNewsState();
}

class _CountryNewsState extends State<CountryNews> {

  List<Article> countryNews = [];
  Future<void> getCountryNews(String requiredCountryCode) async{
    var response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=$requiredCountryCode&apiKey=57e57303e14549bf9f7a36a65f3de434"),);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      for(var element in jsonData['articles']){
        if(element['urlToImage'] != null && element['title'] != null){

          // instead of final Article can be used
          final articleModel = Article(
              name: element['source']['name'],
              title: element['title'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              publishedAt: element['publishedAt'],
          );
          countryNews.add(articleModel);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCountryNews(widget.countryCode),
      builder: (context, snapshot){

        //snapshot use to check current request call status
        if(snapshot.connectionState == ConnectionState.done){
          return CustomScrollView(

            slivers: <Widget>[

              SliverList(
                delegate: SliverChildBuilderDelegate((context, index){
                  // Blog Tile
                    return BlogTile(
                    blogName: countryNews[index].name,
                    blogTitle: countryNews[index].title,
                    blogUrl: countryNews[index].url,
                    blogUrlToImage: countryNews[index].urlToImage,
                    blogPublishedAt: countryNews[index].publishedAt,
                  );
                },
                childCount: countryNews.length,
                ),
              )
            ],
          );
        }
        // if still loading then show progress indicator
        else{
          return const Center(child: CircularProgressIndicator(color: Color.fromRGBO(239, 83, 80, 1),),);
        }
      }
    );
  }
}