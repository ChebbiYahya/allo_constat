import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../config.dart';
import '../models/user_model.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();
  Future<Map<String, dynamic>> signinController(UserModel user) async {
    var reqBody = {
      "email": user.email,
      "mot_de_passe": user.password,
    };

    var response = await http.post(
      Uri.parse(loginUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(reqBody),
    );
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['status'] == 200) {
      var myToken = jsonResponse['token'];
      return {
        "status": true,
        "success": "L'utilisateur s'est enregistré avec succès",
        "token": myToken
      };
    } else {
      return {
        "status": false,
        "error": jsonResponse['message'] ?? "Échec de l'enregistrement",
      };
    }
  }

  Future<Map<String, dynamic>> signupController(UserModel user) async {
    var reqBody = {
      "nom": user.nom,
      "prenom": user.prenom,
      "email": user.email,
      "mot_de_passe": user.password,
      "telephone": user.phoneNum,
      "region": "Tunisie",
      "role": "client"
    };

    var response = await http.post(
      Uri.parse(registerUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(reqBody),
    );
    var jsonResponse = jsonDecode(response.body);

    if (jsonResponse['status'] == 200) {
      return {
        "status": true,
        "success": "L'utilisateur s'est enregistré avec succès",
        "token": jsonResponse["token"],
      };
    } else {
      return {
        "status": false,
        "error": jsonResponse['message'] ?? "Échec de l'enregistrement",
      };
    }
  }

  Future<UserModel?> getUserByIdController(
      String idUser, String tokenUser) async {
    String getUserByIdURL = getUserByIdUrl + idUser;
    var response = await http.get(
      Uri.parse(getUserByIdURL),
      headers: {
        "Content-Type": "application/json",
        "x-access-token": tokenUser,
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == 200) {
        UserModel usr = UserModel(
          id: jsonResponse['data']['_id'],
          nom: jsonResponse['data']['nom'],
          prenom: jsonResponse['data']['prenom'],
          email: jsonResponse['data']['email'], // Correction ici
          phoneNum: jsonResponse['data']['telephone'],
          listConstat: List<String>.from(jsonResponse['data']['constats']),
          token: tokenUser,
        );

        return usr;
      } else {
        return null; // Retourne null si le statut n'est pas 200
      }
    } else {
      // Gérer le cas où le code de réponse n'est pas 200
      return null;
    }
  }

  Future<Map<String, dynamic>> updateUserByIdController(UserModel user,
      String newNom, String newPrenom, String newPhoneNum) async {
    String upadateUserByIdURL = updateUserByIdUrl + user.id!;

    var reqBody = {
      "nom": newNom,
      "prenom": newPrenom,
      "telephone": newPhoneNum,
    };
    var response = await http.put(
      Uri.parse(upadateUserByIdURL),
      headers: {
        "Content-Type": "application/json",
        "x-access-token": user.token!,
      },
      body: jsonEncode(reqBody),
    );
    var jsonResponse = jsonDecode(response.body);

    if (jsonResponse['status'] == 200) {
      return {
        "status": true,
        "message": "Votre profil a été modifié.",
      };
    } else {
      return {
        "status": false,
        "message": "Error de modification",
      };
    }
  }

  Future<Map<String, dynamic>> updateListConstatController(
    String idUser,
    String idConstat,
  ) async {
    String upadateListConstatURL = updateListConstatUrl + idUser;

    var reqBody = {
      "constat": idConstat,
    };
    var response = await http.post(
      Uri.parse(upadateListConstatURL),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(reqBody),
    );
    var jsonResponse = jsonDecode(response.body);

    return {
      "message": jsonResponse['message'],
    };
  }
}
