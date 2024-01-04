import 'package:flutter/material.dart';
import 'package:news/helper/country_headlines.dart';

class CountryList extends StatelessWidget {
  const CountryList({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        
        appBar: AppBar(title: const Text('Country Headlines', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),),
          centerTitle: true,
          toolbarHeight: 65,
          elevation: 0,
          backgroundColor: Colors.red.shade400,
        ),

        body: const Column(
          children: [
            TabBar(
              isScrollable: true,
              indicatorColor: Color.fromRGBO(239, 83, 80, 1),
              padding: EdgeInsets.only(top: 4),
              labelColor: Color.fromRGBO(239, 83, 80, 1),
              unselectedLabelColor: Colors.black,
              labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),

              tabs:[
                Tab(
                  child: Text('USA'),
                ),
                Tab(
                  child: Text('England'),
                ),
                Tab(
                  child: Text('China'),
                ),
                Tab(
                  child: Text('Canada'),
                ),
                Tab(
                  child: Text('Japan'),
                ),
                Tab(
                  child: Text('France'),
                ),
                Tab(
                  child: Text('Russia'),
                ),
              ] 
            ),

            Expanded(
              child: TabBarView(
                children: [
                  Expanded(
                    child: CountryHeadlines(countryCode: 'us')
                  ),
                  Expanded(
                    child: CountryHeadlines(countryCode: 'gb')
                  ),
                  Expanded(
                    child: CountryHeadlines(countryCode: 'cn')
                  ),
                  Expanded(
                    child: CountryHeadlines(countryCode: 'ca')
                  ),
                  Expanded(
                    child: CountryHeadlines(countryCode: 'jp')
                  ),
                  Expanded(
                    child: CountryHeadlines(countryCode: 'fr')
                  ),
                  Expanded(
                    child: CountryHeadlines(countryCode: 'ru')
                  ),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}
