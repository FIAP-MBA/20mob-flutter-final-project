import 'package:dio/dio.dart';
import 'package:flutter_20mob_project_final/app/models/movie_model.dart';
import 'package:flutter_20mob_project_final/app/models/movie_response.dart';
import 'package:flutter_20mob_project_final/app/utils/logging_interceptor.dart';

class MovieApiProvider {
  static String apiKey = "3fdab48e2bddf5d597050debe64abb1c";
  static String _endpoint = "https://api.themoviedb.org/3";
  static String language = "pt-BR";
  var getMoviesUrl =
      '$_endpoint/movie/popular?api_key=$apiKey&language=$language&page=1';
  Dio _dio;

  MovieApiProvider() {
    BaseOptions options =
        BaseOptions(receiveTimeout: 5000, connectTimeout: 5000);
    _dio = Dio(options);
    _dio.interceptors.add(LoggingInterceptor());
  }

  Future<List<MovieModel>> getMovies() async {
    try {
      Response response = await _dio.get(getMoviesUrl);
      return MovieResponse.fromJson(response.data).results;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError(_handleError(error)).results;
    }
  }

  String _handleError(Error error) {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error as DioError;
      switch (dioError.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.RESPONSE:
          errorDescription =
              "Received invalid status code: ${dioError.response.statusCode}";
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }
}
