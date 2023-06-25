// import 'package:asdf/provider/local_database.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/note_collection.dart';
import '../provider/firestore_firebase.dart';

final _database = FirestoreDatabase.helper;

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  NoteCollection noteCollection = NoteCollection();

  MonitorBloc()
      : super(MonitorState(
          noteCollection: NoteCollection(),
        )) {
    //LocalDatabase.helper.stream.listen((event) {

    on<UpdateList>((event, Emitter emit) {
      emit(MonitorState(noteCollection: noteCollection));
    });

    on<AskNewList>((event, Emitter emit) async {
      noteCollection = await _database.getNoteList();
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
