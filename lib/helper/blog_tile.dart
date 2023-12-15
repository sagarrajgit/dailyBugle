import 'package:flutter/material.dart';
import 'webview.dart';

class BlogTile extends StatelessWidget {

  final String blogName, blogTitle, blogUrl, blogUrlToImage, blogPublishedAt;
  const BlogTile({
    super.key, 
    required this.blogName, 
    required this.blogTitle, 
    required this.blogUrl, 
    required this.blogUrlToImage, 
    required this.blogPublishedAt
  }); //required this.web_viewUrl

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleWebView(articleUrl: blogUrl,),),);
      },

      child: Column(
        children: [

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(       
                width: width*0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8), // Match the borderRadius with the Container's decoration
                  child: Image.network(blogUrlToImage, fit: BoxFit.fill,),
                ),
              ),
            ),
      
      
            Padding(
              padding: const EdgeInsets.symmetric(vertical:5),
              child: Container(
                width: width*0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(blogName, style: const TextStyle(fontSize: 11, color: Color.fromRGBO(97, 97, 97, 1), fontWeight: FontWeight.w600),),
                    Text(blogPublishedAt.substring(0, 10), style: const TextStyle(fontSize: 11, color: Color.fromRGBO(97, 97, 97, 1), fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
            ),

            Container(
              width: width*0.9,
              child: Text(blogTitle, style: const TextStyle(fontSize: 18, color: Colors.black87, fontWeight: FontWeight.w700),)
            ),

            Divider(
              thickness: 1,
              indent: width*0.05,
              endIndent: width*0.05,
            ),
          ],
        ),
    );
  }
}