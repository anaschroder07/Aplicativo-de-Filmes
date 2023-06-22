import 'note.dart';

class NoteCollection {
  List<String> idList = [];
  List<Note> noteList = [];

  NoteCollection() {
    idList = [];
    noteList = [];
  }

  int length() {
    return idList.length;
  }

  Note getNoteAtIndex(int index) {
    Note note = noteList[index];
    return Note.withData(
      review: note.review,
      rating: note.rating,
    );
  }

  String getIdAtIndex(int index) {
    return idList[index];
  }

  int getIndexOfId(String id) {
    return idList.indexOf(id);
  }

  updateOrInsertNoteOfId(String id, Note note) {
    int index = getIndexOfId(id);
    if (index != -1) {
      // Update
      noteList[index] = Note.withData(
        review: note.review,
        rating: note.rating,
      );
    } else {
      // Insert
      idList.add(id);
      noteList.add(
        Note.withData(
          review: note.review,
          rating: note.rating,
        ),
      );
    }
  }

  updateNoteOfId(String id, Note note) {
    int index = getIndexOfId(id);
    if (index != -1) {
      noteList[index] =
          Note.withData(review: note.review, rating: note.rating);
    }
  }

  deleteNoteOfId(String id) {
    int index = getIndexOfId(id);
    if (index != -1) {
      noteList.removeAt(index);
      idList.removeAt(index);
    }
  }

  insertNoteOfId(String id, Note note) {
    idList.add(id);
    noteList.add(
      Note.withData(
        review: note.review,
        rating: note.rating,
      ),
    );
  }
}