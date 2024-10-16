import 'dart:convert';

// Fonction pour convertir une liste de JSON en liste de modèles UserModel
List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

// Fonction pour convertir une liste de modèles UserModel en JSON
String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  String? id;
  String? nom;
  String? prenom;
  String? email;
  String? password;
  String? phoneNum;
  List listConstat;
  String? token; // Ajout du nouvel attribut

  UserModel({
    this.id,
    this.nom,
    this.prenom,
    this.email,
    this.password,
    this.phoneNum,
    this.listConstat = const [],
    this.token, // Initialisation du nouvel attribut
  });

  // Méthode pour modifier l'id de l'utilisateur
  UserModel setId(String idUser) {
    return UserModel(
      id: idUser,
      email: email,
      nom: nom,
      phoneNum: phoneNum,
      prenom: prenom,
      listConstat: listConstat,
      token: token, // Conserver le token actuel
    );
  }

  // Méthode pour mettre à jour les informations de l'utilisateur
  UserModel updateUser(
      String updatedNom, String updatedPrenom, String updatedPhoneNum) {
    return UserModel(
      id: id,
      email: email,
      nom: updatedNom,
      phoneNum: updatedPhoneNum,
      prenom: updatedPrenom,
      listConstat: listConstat,
      token: token, // Conserver le token actuel
    );
  }

  // Sérialiser les données vers un format JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nom": nom,
      "prenom": prenom,
      "email": email,
      "mot_de_passe": password,
      "telephone": phoneNum,
      "listConstat": listConstat,
      "token": token, // Ajouter le token au JSON
    };
  }

  // Méthode factory pour créer un UserModel à partir d'un JSON
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        nom: json["nom"],
        prenom: json["prenom"],
        email: json["email"],
        password: json["mot_de_passe"],
        phoneNum: json["phoneNum"],
        listConstat: json["listConstat"] ?? [],
        token: json["token"], // Récupérer le token du JSON
      );
}
