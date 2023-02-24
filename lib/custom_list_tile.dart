import 'package:flutter/material.dart';
import 'package:newsapi/news_api.dart';

import 'news_page.dart';

class CustomListTile extends StatelessWidget {
  final Article article;

  const CustomListTile({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsPage(
                      article: article,
                    )));
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 100,
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.3,
              height: 200,
              child: Image.network(
                article.urlToImage ?? "",
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return const Center(
                    child: Icon(Icons.image_not_supported_outlined),
                  );
                },
              ),
            ),
            const SizedBox(width: 5),
            SizedBox(
              height: 200,
              width: size.width * 0.65,
              child: Column(
                children: [
                  Flexible(
                      child: Text(
                    article.title,
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
