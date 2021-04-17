import 'package:space_flights/management/articles.dart';

class Managemnt {
  Managemnt._internal(this.articles);

  static Managemnt _singleton = Managemnt._internal(Articles());

  factory Managemnt() => _singleton;

  final Articles articles;
}
