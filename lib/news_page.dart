import 'package:flutter/material.dart';
import 'package:newsapi/news_api.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatelessWidget {
  final Article article;

  const NewsPage({super.key, required this.article});

  _URLPage() async {
    var urlpage = Uri.parse(article.url);
    if (await canLaunchUrl(urlpage)) {
      await launchUrl(urlpage);
    } else {
      throw 'no page $urlpage';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.arrow_back, color: Colors.black,),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_border,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        // elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image.network(
              article.urlToImage ?? "",
              height: 350,
              width: 350,
            ),
            // const SizedBox(height: 10),
            Text(
              article.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(article.content!),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _URLPage,
              child: const Text('view full article'),
            ),
          ],
        ),
      ),
    );
  }
}
