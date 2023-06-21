class Review {
  String _comment = "";
  double _stars = 0;

  Review() {
    _comment = "";
    _stars = 0;
  }

  Review.fromMap(map) {
    this._comment = map["comment"];
    this._stars = map["stars"];
  }

  String get comment => _comment;
  double get stars => _stars;

  set description(String newComment) {
    if (newComment.length > 0) {
      this._comment = newComment;
    }
  }

  set stars(double newStars) {
    if (newStars > 0) {
      this._stars = newStars;
    }
  }

  toMap() {
    var map = Map<String, dynamic>();
    map["comment"] = _comment;
    map["stars"] = _stars;
    return map;
  }
}
