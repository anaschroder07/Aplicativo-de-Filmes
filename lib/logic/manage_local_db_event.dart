import '../model/review.dart';

abstract class ManageEvent {}

class SubmitEvent extends ManageEvent {
  Review review;
  SubmitEvent({required this.review});
}

class DeleteEvent extends ManageEvent {
  String reviewId;
  DeleteEvent({required this.reviewId});
}

class UpdateRequest extends ManageEvent {
  String reviewId;
  Review previousReview;

  UpdateRequest({
    required this.reviewId,
    required this.previousReview,
  });
}

class UpdateCancel extends ManageEvent {}
