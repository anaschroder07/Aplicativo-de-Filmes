

class Note {
  String review = "";
  String rating = "";

  Note() {
    review = "";
    rating = "";
  }

  Note.withData({this.review = "", this.rating = ""});

  Note.fromMap(map) {
    review = map["review"];
    rating = map["rating"];
  }

  toMap() {
    return {"review": review, "rating": rating};
  }
}