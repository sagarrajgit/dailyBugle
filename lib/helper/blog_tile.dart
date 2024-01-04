import 'package:flutter/material.dart';
import 'package:news/pages/webview.dart';

class BlogTile extends StatelessWidget {
  final String blogName, blogTitle, blogUrl, blogUrlToImage, blogPublishedAt;
  const BlogTile(
    { 
      super.key,
      required this.blogName,
      required this.blogTitle,
      required this.blogUrl,
      required this.blogUrlToImage,
      required this.blogPublishedAt
    }
  );

  @override
  Widget build(BuildContext context) {

    // getting device height and width
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleWebView(
              articleUrl: blogUrl,
            ),
          ),
        );
      },

      // image
      child: Padding(
        padding: const EdgeInsets.only(top:5),
        child: Column(
          children: [
            Container(
              height: height * 0.23,
              width: width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    10), // Match the borderRadius with the Container's decoration
                child: Image.network(blogUrlToImage, fit: BoxFit.cover),
              ),
            ),

            // publisher and time of publish
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SizedBox(
                width: width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      blogName,
                      style: const TextStyle(
                          fontSize: 11,
                          color: Color.fromRGBO(97, 97, 97, 1),
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      blogPublishedAt.substring(0, 10),
                      style: const TextStyle(
                          fontSize: 11,
                          color: Color.fromRGBO(97, 97, 97, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            // title
            SizedBox(
                width: width * 0.9,
                child: Text(
                  blogTitle,
                  style: const TextStyle(
                      wordSpacing: 0,
                      // letterSpacing: 5,
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                  ),
                )),
            Divider(
              thickness: 1,
              indent: width * 0.05,
              endIndent: width * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
