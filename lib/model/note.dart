import 'dart:ffi';

class Note {
  String review = "";
  double rating = 0.0;

  Note() {
    review = "";
    rating = 0.0;
  }

  Note.withData({this.review = "", this.rating = 0.0});

  Note.fromMap(map) {
    review = map["review"];
    rating = map["rating"];
  }

  toMap() {
    return {"review": review, "rating": rating};
  }
}