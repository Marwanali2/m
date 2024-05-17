import 'package:dio/dio.dart';



class ApiServices {
  static String baseUrl = "https://api.themoviedb.org/3";
  static String apiKey = "31521ab741626851b73c684539c33b5a";
  static Dio dio=Dio();

  ApiServices(Dio dio);

 

  // Future<Map<String, dynamic>> getTopRated({required String endPoint}) async {
  //   var response = await _dio.get('$_baseUrl/$endPoint?api_key=$apiKey');
  //   return response.data;
  // }

  // Future<Map<String, dynamic>> getGenres(
  //     {required String endPoint, required int genreId}) async {
  //   var response = await _dio
  //       .get('$_baseUrl/$endPoint?api_key=$apiKey&with_genres=$genreId');
  //   return response.data;
  // }
}
