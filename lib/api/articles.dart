import 'package:dio/dio.dart';
import 'package:space_flights/api/response.dart';
import 'package:space_flights/api/urls.dart';

class Articles {
  final Dio dio;

  Articles(this.dio);

  Future<ArticleResponse<List>> getArticles() async {
    List? data = [];
    ApiError? error;

    Map<String, dynamic> params = {
      '_limit': 20,
      '_start': 0,
    };
    Map<String, dynamic> headers = {'Content-type': 'application/json'};

    var response = await dio.get(
      AppURLs.getArticles,
      queryParameters: params,
      options: Options(headers: headers),
    );

    if (response.statusCode == 200 && response.data != null) {
      data = response.data;
    } else {
      error = ApiError(response.data['message']);
    }
    return ArticleResponse(data: data, error: error);
  }
}
