class ArticleResponse<T> {
  T? data;
  ApiError? error;

  ArticleResponse({this.data, this.error});
}

class ApiError {
  String? message;

  ApiError(this.message);
}
