import 'package:flutter/material.dart';
import 'package:news/controller/data_service.dart';
import 'package:news/model/model.dart';
import 'package:news/widget/effect.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsApiCall extends StatefulWidget {
  const NewsApiCall({Key? key}) : super(key: key);

  @override
  _NewsApiCallState createState() => _NewsApiCallState();
}

class _NewsApiCallState extends State<NewsApiCall> {
  late Future<NewsModel> news;
  @override
  void initState() {
    super.initState();
    news = DataService().fetchNewsList('sports', 'in');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'News Headlines',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
      future: news,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data.articles;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Card(
                        child: ListTile(
                          trailing: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.network(
                              data[index].urlToImage.toString(),
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset('images/not_found.png');
                              },
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          title: Text(
                            data[index].source.name.toString(),
                            textScaleFactor: 0.8,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              data[index].title,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          isThreeLine: false,
                          onTap: () {
                            launch(
                              data[index].url,
                              forceWebView: true,
                              enableJavaScript: true,
                              forceSafariVC: true,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Image.asset('images/not_found.png');
        } else {
          return const Effect();
        }
      },
    ),
    );
  }
}
