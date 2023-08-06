class Review {
  final int id;
  final int craftsmanId;
  final int userId;
  final int rating;
  final String comment;

  Review({
    required this.id,
    required this.craftsmanId,
    required this.userId,
    required this.rating,
    required this.comment
  });

  factory Review.fromJson(Map<String, dynamic> json) {
     return Review(
      id: json["id"], 
      craftsmanId: json["craftsmanId"], 
      userId: json["userId"], 
      rating: json["rating"], 
      comment: json["comment"]);
  }

  Map<String, dynamic> toJson() {
    return {
       "id": id,
       "craftsmanId": craftsmanId,
       "userId": userId,
       "rating": rating,
       "comment": comment
    };
  }
}