import 'dart:convert';

List<ConstatCollectionModel> constatCollectionModelFromJson(String str) =>
    List<ConstatCollectionModel>.from(
        json.decode(str).map((x) => ConstatCollectionModel.fromJson(x)));

String constatCollectionModelToJson(List<ConstatCollectionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ConstatCollectionModel {
  Map<String, String>? pdfUrls;
  String? id;
  String? region;
  String? timestamp;
  int? nbrVehicles;
  String? matriculeA;
  String? matriculeB; // Ajout du champ matriculeB
  String? userId;

  ConstatCollectionModel({
    this.pdfUrls,
    this.id,
    this.region,
    this.timestamp,
    this.nbrVehicles,
    this.matriculeA,
    this.matriculeB, // Ajout du champ matriculeB dans le constructeur
    this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      "pdfUrls": pdfUrls,
      "_id": id,
      "region": region,
      "timestamp": timestamp,
      "nbrVehicles": nbrVehicles,
      "matriculeA": matriculeA,
      "matriculeB": matriculeB, // Ajout du champ matriculeB à la méthode toJson
      "userId": userId,
    };
  }

  factory ConstatCollectionModel.fromJson(Map<String, dynamic> json) =>
      ConstatCollectionModel(
        pdfUrls: json["pdfUrls"] != null
            ? Map<String, String>.from(json["pdfUrls"])
            : null,
        id: json["_id"],
        region: json["region"],
        timestamp: json["timestamp"],
        nbrVehicles: json["nbrVehicles"],
        matriculeA: json["matriculeA"],
        matriculeB: json[
            "matriculeB"], // Ajout du champ matriculeB à la méthode fromJson
        userId: json["userId"],
      );
}
