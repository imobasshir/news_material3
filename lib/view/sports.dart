import 'package:flutter/material.dart';
import 'package:news/widget/effect.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controller/data_service.dart';
import '../model/model.dart';

class SportsNews extends StatefulWidget {
  const SportsNews({Key? key}) : super(key: key);

  @override
  _SportsNewsState createState() => _SportsNewsState();
}

class _SportsNewsState extends State<SportsNews> {
  late Future<NewsModel> news;
  @override
  void initState() {
    super.initState();
    news = DataService().fetchNewsList('sports', 'in');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
    );
  }
}
