class LibraryModel {
  String id;
  DateTime createdAt;
  String name;
  String contactInfo;
  String address;
  Location location;
  String userId;

  LibraryModel({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.contactInfo,
    required this.address,
    required this.location,
    required this.userId,
  });

  factory LibraryModel.fromJson(Map<String, dynamic> json) => LibraryModel(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    name: json["name"],
    contactInfo: json["contactInfo"],
    address: json["address"],
    location: Location.fromJson(json["location"]),
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "name": name,
    "contactInfo": contactInfo,
    "address": address,
    "location": location.toJson(),
    "user_id": userId,
  };
}

class Location {
  String type;
  List<int> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    type: json["type"],
    coordinates: List<int>.from(json["coordinates"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}