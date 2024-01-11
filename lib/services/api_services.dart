import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;

import '../models/my_model.dart';
import '../models/now_playing_model.dart';
import '../models/poular_model.dart';

class ApiServies{

  static const baseUrl = 'https://api.themoviedb.org/3/movie/';
  final String _nowplayingurl = '${baseUrl}now_playing?api_key=1b11a9f6356e930cb7542b3606c403f9&language=en-US&page=1';
  final String _popular = '${baseUrl}popular?api_key=1b11a9f6356e930cb7542b3606c403f9&language=en-US&page=1';

  final dio.Dio _dio = dio.Dio();

  Future<List<MyModel>> fetchMyModelData() async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return myModelFromJson(response.body);
      } else {
        throw Exception("Network Error");
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<PopularModel> fetchPopularMovieData() async {
    final uri = Uri.parse(_popular);
    try {
      final response = await http.get(uri);
      final map = jsonDecode(utf8.decode(response.bodyBytes));
      // print(map);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return PopularModel.fromJson(map);
      } else {
        throw Exception("Network Error");
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<NowPlayingModel> fetchNowPlayingMovieData() async {
    try {
      dio.Response response = await _dio.get(_nowplayingurl);
      // print(response.data);
      return NowPlayingModel.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      return NowPlayingModel.withError("Data not found / Connection issue");
    }
  }

}