import 'package:flutter/material.dart';
import 'package:news/helper/category.dart';

class HeadlinesPage extends StatefulWidget {
  const HeadlinesPage({super.key});

  @override
  State<HeadlinesPage> createState() => _HeadlinesPageState();
}

class _HeadlinesPageState extends State<HeadlinesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Category',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          toolbarHeight: 65,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.red.shade400,
        ),
        body: const Column(
          children: [
            TabBar(
                isScrollable: true,
                indicatorColor: Color.fromRGBO(239, 83, 80, 1),
                padding: EdgeInsets.only(top: 4),
                unselectedLabelColor: Colors.black,
                labelColor: Color.fromRGBO(239, 83, 80, 1),
                labelStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                tabs: [
                  Tab(
                    child: Text('Science'),
                  ),
                  Tab(
                    child: Text('Business'),
                  ),
                  Tab(
                    child: Text('Technology'),
                  ),
                  Tab(
                    child: Text('Sports'),
                  ),
                  Tab(
                    child: Text('Health'),
                  ),
                  Tab(
                    child: Text('Entertainment'),
                  ),
                  Tab(
                    child: Text('General'),
                  ),
                ]),
            Expanded(
              child: TabBarView(children: [
                Expanded(child: CategoryNews(category: 'science')),
                Expanded(child: CategoryNews(category: 'Business')),
                Expanded(child: CategoryNews(category: 'Technology')),
                Expanded(child: CategoryNews(category: 'Sports')),
                Expanded(child: CategoryNews(category: 'Health')),
                Expanded(child: CategoryNews(category: 'Entertainment')),
                Expanded(child: CategoryNews(category: 'General')),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
