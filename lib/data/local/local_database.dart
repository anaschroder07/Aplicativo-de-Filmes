import 'package:dio/dio.dart';

import '../../model/review.dart';

class ReviewDataProvider {
  final Dio _dio = Dio();

  insertReviews(String review) async {
    _dio.post(
        'https://aplicativo-de-filmes-26f39-default-rtdb.firebaseio.com/-reviews.json',
        data: {'review': review});
  }

  Future<List<String>> listarReviews() async {
    final response = await _dio.get(
        'https://aplicativo-de-filmes-26f39-default-rtdb.firebaseio.com/-reviews.json');
    final data = response.data as Map<String, dynamic>;
    final reviews =
        data.values.map((item) => item['review'] as String).toList();
    return reviews;
  }

  Future<void> removeReview(String review) async {
    final response = await _dio.get(
        'https://aplicativo-de-filmes-26f39-default-rtdb.firebaseio.com/-reviews.json');
    final data = response.data as Map<String, dynamic>;

    String? reviewId;

    data.forEach((key, value) {
      if (value['review'] == review) {
        reviewId = key;
      }
    });

    if (reviewId != null) {
      final deleteResponse = await _dio.delete(
          'https://aplicativo-de-filmes-26f39-default-rtdb.firebaseio.com/-reviews/$reviewId.json');
    }
  }
}
