import 'dart:async';

import 'package:flutter/material.dart';
import 'package:space_flights/api/article_model.dart';
import 'package:space_flights/article_widget.dart';
import 'package:space_flights/management/management.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlsView extends StatefulWidget {
  ArticlsView({Key? key}) : super(key: key);

  @override
  _ArticlsViewState createState() => _ArticlsViewState();
}

class _ArticlsViewState extends State<ArticlsView> {
  List<Article?> artiles = [];
  late StreamSubscription streamSubscription;
  int selectionIndex = 0;
  late WebViewController controller;
  Completer<WebViewController> compliter = Completer<WebViewController>();

  void getData() async {
    await Managemnt().articles.getArticles();
    streamSubscription = Managemnt().articles.article.listen((value) {
      if (mounted)
        setState(() {
          artiles = value!;
        });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
          if (orientation == Orientation.portrait) {
            return StreamBuilder(
              stream: Managemnt().articles.article,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Article?>?> snapshot) {
                if (!snapshot.hasData) return Text("Yani Error");
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (contex, index) {
                        return ArticleWidget(
                            article: snapshot.data![index]!,
                            onTap: () {
                              selectionIndex = index;
                              //Yani navigacia
                            });
                      }),
                );
              },
            );
          }
          return Row(
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: artiles.length,
                      itemBuilder: (contex, index) {
                        return ArticleWidget(
                            article: artiles[index]!,
                            onTap: () {
                              selectionIndex = index;
                              controller.loadUrl(artiles[index]!.url!);
                              setState(() {});
                            });
                      }),
                ),
              ),
              Expanded(
                child: WebView(
                  initialUrl: artiles[selectionIndex]?.url,
                  onWebViewCreated: (WebViewController text) async {
                    controller = text;
                    compliter.complete(text);
                  },
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
