class AppURLs {
  static final String _baseURL = 'https://test.spaceflightnewsapi.net';
  static final String _api = '/api/v2';
  static final String _articles = '/articles';

  static String get getArticles {
    return '$_baseURL$_api$_articles';
  }
}
