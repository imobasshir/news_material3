import 'package:flutter/material.dart';
import 'package:news/view/business.dart';
import 'package:news/view/entertainment.dart';
import 'package:news/view/general.dart';
import 'package:news/view/sports.dart';
import 'package:news/view/tech.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  int _currentIndex = 0;
  final _bodyItem = [
    const GeneralNews(),
    const BusinessNews(),
    const TechNews(),
    const SportsNews(),
    const EntertainmentNews(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // shadowColor: const Color(0x00edf7ff),
        foregroundColor: const Color(0x00edf7ff),
        surfaceTintColor: const Color(0x00edf7ff),
        backgroundColor: const Color(0x00edf7ff),
        elevation: 0.0,
        title: const Text(
          'News App',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: _bodyItem[_currentIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0x00f3f9fe),
        destinations: const [
          NavigationDestination(
            label: 'General',
            icon: Icon(
              Icons.feed_outlined,
            ),
          ),
          NavigationDestination(
            label: 'Business',
            icon: Icon(
              Icons.business_outlined,
            ),
          ),
          NavigationDestination(
            label: 'Technology',
            icon: Icon(
              Icons.laptop_outlined,
            ),
          ),
          NavigationDestination(
            label: 'Sports',
            icon: Icon(
              Icons.sports_cricket_outlined,
            ),
          ),
          NavigationDestination(
            label: 'Films',
            icon: Icon(
              Icons.movie_outlined,
            ),
          ),
        ],
        elevation: 0.0,
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
