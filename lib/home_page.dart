import 'package:flutter/material.dart';
import 'package:newsapi/custom_list_tile.dart';
import 'package:newsapi/news_api.dart';
import 'package:newsapi/remote_services.dart';
import 'package:newsapi/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> articles = [];
  RemoteService ser = RemoteService();

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  Future<void> getData() async {
    articles = await ser.fetchData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'News',
          ),
          centerTitle: true,
          leading: const Icon(Icons.menu),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(articles: articles),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: Visibility(
          replacement: const Center(
              child: CircularProgressIndicator(
            color: Colors.cyan,
          )),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return CustomListTile(article: articles[index]);
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: articles.length),
        ));
  }
}
