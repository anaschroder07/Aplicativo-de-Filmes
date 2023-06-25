//import 'dart:html';
/*
import 'package:dio/dio.dart';

import '../../model/collection/review_collection.dart';
import '../../model/review.dart';

class RestDataProvider {
  static RestDataProvider helper = RestDataProvider._createInstance();

  RestDataProvider._createInstance();

  final Dio _dio = Dio();

  String prefixUrl =
      "https://si7001s2023backend-production-bfd9.up.railway.app/reviews/";
  String suffixUrl = "";

  insertReview(Review review) async {
    _dio.post(
      prefixUrl + suffixUrl,
      data: review.toMap(),
    );
  }

  updateReview(String reviewId, Review review) async {
    _dio.put(
      prefixUrl + reviewId + suffixUrl,
      data: review.toMap(),
    );
  }

  deleteReview(String reviewId) async {
    _dio.delete(
      prefixUrl + reviewId + suffixUrl,
    );
  }

  Future<ReviewCollection> getReviewList() async {
    Response response = await _dio.get(prefixUrl + suffixUrl);

    ReviewCollection reviewCollection = ReviewCollection();

    response.data.forEach((value) {
      reviewCollection.insertReviewOfId(
          value["id"].toString(),
          Review.fromMap(
              {"comment": value["comment"], "stars": value["stars"]}));
    });
    return reviewCollection;
  }
}
*/