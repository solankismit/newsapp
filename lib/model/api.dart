import 'package:dio/dio.dart';
import 'package:newsapp/model/getnews.dart';

class NewsAPIService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://newsapi.org/v2/';
  final String _apiKey = '16f6f5a09b4949838791caae0b5b8138'; // Replace this with your actual NewsAPI API key

  Future<GetNewsModel> getTopHeadlines() async {
    try {
      final response = await _dio.get('${_baseUrl}top-headlines', queryParameters: {
        'country': 'us', // Replace with the country code you want to get headlines from
        'apiKey': _apiKey,
      });

      if (response.statusCode == 200) {
        return GetNewsModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load top headlines');
      }
    } catch (e) {
      throw Exception('Failed to communicate with the API');
    }
  }
}
