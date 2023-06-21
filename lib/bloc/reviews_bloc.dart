import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/local/local_database.dart';

//eventos
abstract class ReviewsEvent {}

class InsertReviewsEvent extends ReviewsEvent {
  final String review;

  InsertReviewsEvent(this.review);
}

class RemoveReviewsEvent extends ReviewsEvent {
  final String review;

  RemoveReviewsEvent(this.review);

  @override
  List<Object> get props => [review];
}

//estados
abstract class ReviewsState {}

class ReviewListState extends ReviewsState {
  final List<String> reviews;

  ReviewListState({required this.reviews});
}

class ReviewsInitial extends ReviewsState {}

//bloc
class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  final ReviewDataProvider _reviewProvider;
  ReviewsBloc(this._reviewProvider) : super(ReviewsInitial()) {
    initialize();
    on<InsertReviewsEvent>((event, emit) async {
      await _reviewProvider.insertReviews(event.review);
      final reviews = await _reviewProvider.listarReviews();
      emit(ReviewListState(reviews: reviews));
    });
    on<RemoveReviewsEvent>((event, emit) async {
      await _reviewProvider.removeReview(event.review);
      final reviews = await _reviewProvider.listarReviews();
      emit(ReviewListState(reviews: reviews));
    });
  }

  void initialize() async {
    final reviews = await _reviewProvider.listarReviews();
    emit(ReviewListState(reviews: reviews));
  }
}
