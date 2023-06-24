//import 'package:asdf/provider/local_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/note.dart';
import '../provider/firestore_firebase.dart';
//import '../provider/realtime_firebase.dart';
//import '../provider/rest_provider.dart';

class ManageBloc extends Bloc<ManageEvent, ManageState> {
  ManageBloc() : super(InsertState()) {
    on<SubmitEvent>(submitEvent);
    on<UpdateRequest>(updateRequest);
    on<UpdateCancel>(updateCancel);
    on<DeleteEvent>(deleteEvent);
  }

  updateRequest(UpdateRequest event, Emitter emit) {
    emit(UpdateState(
      noteId: event.noteId,
      previousNote: event.previousNote,
    ));
  }

  updateCancel(UpdateCancel event, Emitter emit) {
    emit(InsertState());
  }

  deleteEvent(DeleteEvent event, Emitter emit) {
    //RealtimeDatabaseProvider.helper.deleteNote(event.noteId);
    FirestoreDatabase.helper.deleteNote(event.noteId);
  }

  submitEvent(SubmitEvent event, Emitter emit) {
    if (state is InsertState) {
      //RestDataProvider.helper.insertNote(event.note);
      //RealtimeDatabaseProvider.helper.insertNote(event.note);
      FirestoreDatabase.helper.insertNote(event.note);
    } else if (state is UpdateState) {
      //RestDataProvider.helper.updateNote(
      //RealtimeDatabaseProvider.helper.updateNote(
      FirestoreDatabase.helper.updateNote(
        (state as UpdateState).noteId,
        event.note,
      );
      emit(InsertState());
    }
  }
}

// Eventos
abstract class ManageEvent {}

class SubmitEvent extends ManageEvent {
  Note note;
  SubmitEvent({required this.note});
}

class DeleteEvent extends ManageEvent {
  String noteId;
  DeleteEvent({required this.noteId});
}

class UpdateRequest extends ManageEvent {
  String noteId;
  Note previousNote;

  UpdateRequest({
    required this.noteId,
    required this.previousNote,
  });
}

class UpdateCancel extends ManageEvent {}

// Estados
abstract class ManageState {}

class InsertState extends ManageState {}

class UpdateState extends ManageState {
  String noteId;
  Note previousNote;

  UpdateState({
    required this.noteId,
    required this.previousNote,
  });
}
