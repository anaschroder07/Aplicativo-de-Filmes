class Note {
  String movie = "";
  String review = "";
  String rating = "";
  String movieUrl = "";
  Note() {
    movie = "";
    review = "";
    rating = "";
    movieUrl = "";
  }

  Note.withData(
      {this.movie = "",
      this.review = "",
      this.rating = "",
      this.movieUrl = ""});

  Note.fromMap(map) {
    movie = map["movie"] ?? "";
    review = map["review"] ?? "";
    rating = map["rating"] ?? "";
    movieUrl = map["movieUrl"] ?? "";
  }

  toMap() {
    return {
      "movie": movie,
      "review": review,
      "rating": rating,
      "movieUrl": movieUrl
    };
  }
}
