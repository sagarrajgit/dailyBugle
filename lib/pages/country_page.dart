import 'package:flutter/material.dart';
import '../helper/country.dart';

class CountryList extends StatelessWidget {
  const CountryList({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        
        appBar: AppBar(title: const Text('Countries', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),),
          centerTitle: true,
          toolbarHeight: 70,
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
                    child: CountryNews(countryCode: 'us')
                  ),
                  Expanded(
                    child: CountryNews(countryCode: 'gb')
                  ),
                  Expanded(
                    child: CountryNews(countryCode: 'cn')
                  ),
                  Expanded(
                    child: CountryNews(countryCode: 'ca')
                  ),
                  Expanded(
                    child: CountryNews(countryCode: 'jp')
                  ),
                  Expanded(
                    child: CountryNews(countryCode: 'fr')
                  ),
                  Expanded(
                    child: CountryNews(countryCode: 'ru')
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
