

// import 'package:asdf/provider/local_database.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/note_collection.dart';
import '../provider/realtime_firebase.dart';
import '../provider/rest_provider.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  NoteCollection noteCollection = NoteCollection();

  MonitorBloc()
      : super(MonitorState(
          noteCollection: NoteCollection(),
        )) {
    //LocalDatabase.helper.stream.listen((event) {
    RestDataProvider.helper.stream.listen((event) {
      String noteId = event[0];
      if (event[1] == null) {
        noteCollection.deleteNoteOfId(noteId);
      } else {
        noteCollection.updateOrInsertNoteOfId(noteId, event[1]);
      }

      add(UpdateList());
    });
    on<UpdateList>((event, Emitter emit) {
      emit(MonitorState(noteCollection: noteCollection));
    });

    on<AskNewList>((event, Emitter emit) async {
      noteCollection = await RealtimeDatabaseProvider.helper.getNoteList();
      emit(MonitorState(noteCollection: noteCollection));
    });

    add(AskNewList());
  }
}

abstract class MonitorEvent {}

class UpdateList extends MonitorEvent {}

class AskNewList extends MonitorEvent {}

class MonitorState {
  NoteCollection noteCollection;
  MonitorState({required this.noteCollection});
}