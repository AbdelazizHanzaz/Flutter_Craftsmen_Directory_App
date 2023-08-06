class Craftsman {
  final int id;
  final int userId;
  final String bio;
  final List<String> services;
  final String city;
  final String state;
  final List<String> portfolio;

  Craftsman({
    required this.id,
    required this.userId,
    required this.bio,
    required this.services,
    required this.city,
    required this.state,
    required this.portfolio
  });
  
  factory Craftsman.fromJson(Map<String, dynamic> json) {
    return Craftsman(
      id: json["id"], 
      userId: json["userId"], 
      bio: json["bio"], 
      services: json["services"], 
      city: json["city"], 
      state: json["state"],  
      portfolio: json["portfolio"]);
  }

  Map<String, dynamic> toJson() {
   return {
      "id": id,
      "userId": userId,
      "bio": bio,
      "services": services,
      "city": city,
      "state": state,
      "portfolio": portfolio
   };
  }
}