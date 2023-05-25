import '../review.dart';

class ReviewCollection {
  List<String> idList = [];
  List<Review> reviewList = [];

  ReviewCollection() {
    idList = [];
    reviewList = [];
  }

  int length() {
    return idList.length;
  }

  Review getReviewAtIndex(int index) {
    Review review = reviewList[index];
    return Review.withData(
      comment: review.comment,
      stars: review.stars,
    );
  }

  String getIdAtIndex(int index) {
    return idList[index];
  }

  int getIndexOfId(String id) {
    return idList.indexOf(id);
  }

  updateOrInsertReviewOfId(String id, Review review) {
    int index = getIndexOfId(id);
    if (index != -1) {
      // Update
      reviewList[index] = Review.withData(
        comment: review.comment,
        stars: review.stars,
      );
    } else {
      // Insert
      idList.add(id);
      reviewList.add(
        Review.withData(
          comment: review.comment,
          stars: review.stars,
        ),
      );
    }
  }

  updateReviewOfId(String id, Review review) {
    int index = getIndexOfId(id);
    if (index != -1) {
      reviewList[index] =
          Review.withData(comment: review.comment, stars: review.stars);
    }
  }

  deleteReviewOfId(String id) {
    int index = getIndexOfId(id);
    if (index != -1) {
      reviewList.removeAt(index);
      idList.removeAt(index);
    }
  }

  insertReviewOfId(String id, Review review) {
    idList.add(id);
    reviewList.add(
      Review.withData(
        comment: review.comment,
        stars: review.stars,
      ),
    );
  }
}