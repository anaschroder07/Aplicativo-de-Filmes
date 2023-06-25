import 'package:trabalho1/data/local/local_database.dart';

//import 'package:aula6/provider/local_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'manage_local_db_event.dart';
import 'manage_local_db_state.dart';

class ManageBloc extends Bloc<ManageEvent, ManageState> {
  ManageBloc() : super(InsertState());

  Stream<ManageState> mapEventToState(ManageEvent event) async* {
    if (event is SubmitEvent) {
      if (state is InsertState){
        DatabaseLocalServer.helper.insertReview(event.review);
        yield InsertState();
      }
    }
  }
}


/*
class ManageBloc extends Bloc<ManageEvent, ManageState> {
  ManageBloc() : super(InsertState()) {
    on<SubmitEvent>(submitEvent);
    on<UpdateRequest>(updateRequest);
    on<UpdateCancel>(updateCancel);
    on<DeleteEvent>(deleteEvent);
  }

  updateRequest(UpdateRequest event, Emitter emit) {
    emit(UpdateState(
      reviewId: event.reviewId,
      previousReview: event.previousReview,
    ));
  }

  updateCancel(UpdateCancel event, Emitter emit) {
    emit(InsertState());
  }

  deleteEvent(DeleteEvent event, Emitter emit) {
    RestDataProvider.helper.deleteReview(event.reviewId);
  }

  submitEvent(SubmitEvent event, Emitter emit) {
    if (state is InsertState) {
      RestDataProvider.helper.insertReview(event.review);
    } else if (state is UpdateState) {
      RestDataProvider.helper.updateReview(
        (state as UpdateState).reviewId,
        event.review,
      );
      emit(InsertState());
    }
  }
}*/