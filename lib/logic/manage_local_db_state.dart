import '../model/review.dart';

abstract class ManageState {}

class InsertState extends ManageState {}

class UpdateState extends ManageState {
  String reviewId;
  Review previousReview;

  UpdateState({
    required this.reviewId,
    required this.previousReview,
  });
}