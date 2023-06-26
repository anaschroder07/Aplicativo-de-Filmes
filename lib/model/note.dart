class Note {
  String movie = "";
  String review = "";
  String rating = "";
  Note() {
    movie = "";
    review = "";
    rating = "";
  }

  Note.withData({this.movie = "", this.review = "", this.rating = ""});

  Note.fromMap(map) {
    movie = map["movie"] ?? "";
    review = map["review"] ?? "";
    rating = map["rating"] ?? "";
  }

  toMap() {
    return {"movie": movie, "review": review, "rating": rating};
  }
}
