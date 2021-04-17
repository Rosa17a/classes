import 'package:rxdart/subjects.dart';
import 'package:space_flights/api/api.dart';
import 'package:space_flights/api/article_model.dart';

class Articles {
  API _api = API();

  BehaviorSubject<List<Article?>?> article = BehaviorSubject<List<Article?>?>();

  Future<List<Article?>>? getArticles() async {
    List<Article?>? articles = [];
    var responseData = await _api.articles.getArticles();

    if (responseData.data != null) {
      for (var item in responseData.data!) {
        Article article = Article.fromJson(item);
        articles.add(article);
      }
      article.sink.add(articles);
      print(articles.first!.toJson());
    } else {
      //Show dialog
    }

    return articles;
  }
}
