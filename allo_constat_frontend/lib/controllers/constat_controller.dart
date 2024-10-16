import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:allo_constat_frontend/models/constat_collection_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../config.dart';
import '../models/pdf_constat_model.dart';
import 'package:image/image.dart' as img;

class ConstatController extends GetxController {
  static ConstatController get instance => Get.find();

  createConstatController(
      PDFConstatModel pdfConstatModel, String idUser) async {
    String imageCroquisBase64 = pdfConstatModel.imageCroquis != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageCroquis!)}"
        : "";

    String imageFlecheBase64A = pdfConstatModel.imageFlecheA != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageFlecheA!)}"
        : "";

    String imageFlecheBase64B = pdfConstatModel.imageFlecheB != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageFlecheB!)}"
        : "";
//test image
    /*  String imageTestBase64A = "";
    File? img = pdfConstatModel.imageTest;
    if (img != null) {
      img = await convertImageToPng(img);
      Uint8List imageTestBytes = await img!.readAsBytes();
      //
      imageTestBase64A =
          await "data:image/png;base64,${base64.encode(imageTestBytes)}";
      print("image test = $imageTestBase64A");
      print("image croquis = $imageCroquisBase64");
    } else {
      print("image test Error");
    }*/
//voiture A------------------------------------------------------------------------
    String imagePermisRectoBase64A = pdfConstatModel.imagePermisRectoA != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imagePermisRectoA!)}"
        : "";
    String imagePermisVersoBase64A = pdfConstatModel.imagePermisVersoA != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imagePermisVersoA!)}"
        : "";
    String imageCarteGriseRectoBase64A = pdfConstatModel
                .imageCarteGriseRectoA !=
            null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageCarteGriseRectoA!)}"
        : "";
    String imageCarteGriseVersoBase64A = pdfConstatModel
                .imageCarteGriseVersoA !=
            null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageCarteGriseVersoA!)}"
        : "";
    String imageAssuranceBase64A = pdfConstatModel.imageAssuranceA != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageAssuranceA!)}"
        : "";
    String imageVoitureAvBase64A = pdfConstatModel.imageVoitureAvA != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageVoitureAvA!)}"
        : "";
    String imageVoitureAvGBase64A = pdfConstatModel.imageVoitureAvGA != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageVoitureAvGA!)}"
        : "";
    String imageVoitureAvDBase64A = pdfConstatModel.imageVoitureAvDA != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageVoitureAvDA!)}"
        : "";
    String imageVoitureGBase64A = pdfConstatModel.imageVoitureGA != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageVoitureGA!)}"
        : "";
    String imageVoitureDBase64A = pdfConstatModel.imageVoitureDA != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageVoitureDA!)}"
        : "";
    String imageVoitureDerBase64A = pdfConstatModel.imageVoitureDerA != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageVoitureDerA!)}"
        : "";
    String imageVoitureDerGBase64A = pdfConstatModel.imageVoitureDerGA != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageVoitureDerGA!)}"
        : "";
    String imageVoitureDerDBase64A = pdfConstatModel.imageVoitureDerDA != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageVoitureDerDA!)}"
        : "";
    //voiture B -------------------------------------------------------------------

    String imagePermisRectoBase64B = pdfConstatModel.imagePermisRectoB != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imagePermisRectoB!)}"
        : "";

    String imagePermisVersoBase64B = pdfConstatModel.imagePermisVersoB != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imagePermisVersoB!)}"
        : "";

    String imageCarteGriseRectoBase64B = pdfConstatModel
                .imageCarteGriseRectoB !=
            null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageCarteGriseRectoB!)}"
        : "";
    String imageCarteGriseVersoBase64B = pdfConstatModel
                .imageCarteGriseVersoB !=
            null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageCarteGriseVersoB!)}"
        : "";
    String imageAssuranceBase64B = pdfConstatModel.imageAssuranceB != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageAssuranceB!)}"
        : "";
    String imageVoitureAvBase64B = pdfConstatModel.imageVoitureAvB != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageVoitureAvB!)}"
        : "";
    String imageVoitureAvGBase64B = pdfConstatModel.imageVoitureAvGB != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageVoitureAvGB!)}"
        : "";
    String imageVoitureAvDBase64B = pdfConstatModel.imageVoitureAvDB != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageVoitureAvDB!)}"
        : "";
    String imageVoitureGBase64B = pdfConstatModel.imageVoitureGB != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageVoitureGB!)}"
        : "";
    String imageVoitureDBase64B = pdfConstatModel.imageVoitureDB != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageVoitureDB!)}"
        : "";
    String imageVoitureDerBase64B = pdfConstatModel.imageVoitureDerB != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageVoitureDerB!)}"
        : "";
    String imageVoitureDerGBase64B = pdfConstatModel.imageVoitureDerGB != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageVoitureDerGB!)}"
        : "";
    String imageVoitureDerDBase64B = pdfConstatModel.imageVoitureDerDB != null
        ? "data:image/png;base64,${base64.encode(pdfConstatModel.imageVoitureDerDB!)}"
        : "";
    var regBody = {
      "report": {
        "vehicleType": "car",
        "date_accident": pdfConstatModel.dateAccident.toString(),
        "heure_accident": pdfConstatModel.heureAccident.toString(),
        "lieu": pdfConstatModel.lieuAccident.toString(),
        "blesses": pdfConstatModel.blesses,
        "degats_materiels": pdfConstatModel.degatMateriels,
        "croquis": imageCroquisBase64,
        "temoins": [
          {
            "nom": "John Doe",
            "adresse": "123 Main St, Tunis",
            "telephone": "12345678"
          }
        ],
        "vehicles": [
          {
            "nom": "A",
            "marque": pdfConstatModel.marqueVehiculeA.toString(),
            "numero_immatriculation":
                pdfConstatModel.numImmatriculationVehiculeA.toString(),
            "degats_apparents":
                pdfConstatModel.degatApparentsVehiculeA.toString(),
            "observations": pdfConstatModel.observationVehiculeA.toString(),
            "sens_suivi_venant": pdfConstatModel.venantDeVehiculeA.toString(),
            "sens_suivi_allant": pdfConstatModel.allantAVehiculeA.toString(),
            "photos": [
              {
                "images": [
                  imageCarteGriseRectoBase64A,
                  imageCarteGriseVersoBase64A,
                  imagePermisRectoBase64A,
                  imagePermisVersoBase64A,
                  imageAssuranceBase64A,
                  imageVoitureAvGBase64A,
                  imageVoitureAvBase64A,
                  imageVoitureAvDBase64A,
                  imageVoitureGBase64A,
                  imageVoitureDerDBase64A,
                  imageVoitureDerBase64A,
                  imageVoitureDerGBase64A,
                  imageVoitureDBase64A,
                ],
                "pointChoc": imageFlecheBase64A.toString()
              }
            ],
            "assurance": {
              "nom": pdfConstatModel.vehiculeAssureParA.toString(),
              "numero_assurance": pdfConstatModel.policeAssuranceA.toString(),
              "localisation": pdfConstatModel.agenceA.toString(),
              "date_validiteFin":
                  pdfConstatModel.attestationValableAuA.toString(),
              "date_validiteDebut":
                  pdfConstatModel.attestationValableDeA.toString()
            },
            "conducteur": {
              "nom": pdfConstatModel.nomConducteurA.toString(),
              "prenom": pdfConstatModel.prenomConducteurA.toString(),
              "adresse": pdfConstatModel.adresseConducteurA.toString(),
              "numero_permis":
                  pdfConstatModel.permisConduireConducteurA.toString(),
              "date_delivration": pdfConstatModel.delivreConducteurA.toString()
            },
            "assure": {
              "nom": pdfConstatModel.nomAssureA.toString(),
              "prenom": pdfConstatModel.prenomAssureA.toString(),
              "adresse": pdfConstatModel.adresseAssureA.toString(),
              "tel": pdfConstatModel.telephoneAssureA.toString()
            },
            "circonstances": [
              pdfConstatModel.enStationnementA! ? "1" : "",
              pdfConstatModel.quittaitA! ? "2" : "",
              pdfConstatModel.prenaitA! ? "3" : "",
              pdfConstatModel.sortaitA! ? "4" : "",
              pdfConstatModel.engageaitA! ? "5" : "",
              pdfConstatModel.arretA! ? "6" : "",
              pdfConstatModel.frottementA! ? "7" : "",
              pdfConstatModel.heurtaitA! ? "8" : "",
              pdfConstatModel.roulaitA! ? "9" : "",
              pdfConstatModel.changeaitA! ? "10" : "",
              pdfConstatModel.doublaitA! ? "11" : "",
              pdfConstatModel.viraitDroitA! ? "12" : "",
              pdfConstatModel.viraitGaucheA! ? "13" : "",
              pdfConstatModel.reculaitA! ? "14" : "",
              pdfConstatModel.reserveeA! ? "15" : "",
              pdfConstatModel.venaitA! ? "16" : "",
              pdfConstatModel.navaitA! ? "17" : "",
            ],
            "nbr_de_choix": pdfConstatModel.nbCirconstancesA.toString()
          },
          if (pdfConstatModel.nbVoiture == 2)
            {
              "nom": "B",
              "marque": pdfConstatModel.marqueVehiculeB.toString(),
              "numero_immatriculation":
                  pdfConstatModel.numImmatriculationVehiculeB.toString(),
              "degats_apparents":
                  pdfConstatModel.degatApparentsVehiculeB.toString(),
              "observations": pdfConstatModel.observationVehiculeB.toString(),
              "sens_suivi_venant": pdfConstatModel.venantDeVehiculeB.toString(),
              "sens_suivi_allant": pdfConstatModel.allantAVehiculeB.toString(),
              "photos": [
                {
                  "images": [
                    imageCarteGriseRectoBase64B,
                    imageCarteGriseVersoBase64B,
                    imagePermisRectoBase64B,
                    imagePermisVersoBase64B,
                    imageAssuranceBase64B,
                    imageVoitureAvGBase64B,
                    imageVoitureAvBase64B,
                    imageVoitureAvDBase64B,
                    imageVoitureGBase64B,
                    imageVoitureDerDBase64B,
                    imageVoitureDerBase64B,
                    imageVoitureDerGBase64B,
                    imageVoitureDBase64B,
                  ],
                  "pointChoc": imageFlecheBase64B.toString()
                }
              ],
              "assurance": {
                "nom": pdfConstatModel.vehiculeAssureParB.toString(),
                "numero_assurance": pdfConstatModel.policeAssuranceB.toString(),
                "localisation": pdfConstatModel.agenceB.toString(),
                "date_validiteFin":
                    pdfConstatModel.attestationValableAuB.toString(),
                "date_validiteDebut":
                    pdfConstatModel.attestationValableDeB.toString()
              },
              "conducteur": {
                "nom": pdfConstatModel.nomConducteurB.toString(),
                "prenom": pdfConstatModel.prenomConducteurB.toString(),
                "adresse": pdfConstatModel.adresseConducteurB.toString(),
                "numero_permis":
                    pdfConstatModel.permisConduireConducteurB.toString(),
                "date_delivration":
                    pdfConstatModel.delivreConducteurB.toString()
              },
              "assure": {
                "nom": pdfConstatModel.nomAssureB.toString(),
                "prenom": pdfConstatModel.prenomAssureB.toString(),
                "adresse": pdfConstatModel.adresseAssureB.toString(),
                "tel": pdfConstatModel.telephoneAssureB.toString(),
              },
              "circonstances": [
                pdfConstatModel.enStationnementB! ? "1" : "",
                pdfConstatModel.quittaitB! ? "2" : "",
                pdfConstatModel.prenaitB! ? "3" : "",
                pdfConstatModel.sortaitB! ? "4" : "",
                pdfConstatModel.engageaitB! ? "5" : "",
                pdfConstatModel.arretB! ? "6" : "",
                pdfConstatModel.frottementB! ? "7" : "",
                pdfConstatModel.heurtaitB! ? "8" : "",
                pdfConstatModel.roulaitB! ? "9" : "",
                pdfConstatModel.changeaitB! ? "10" : "",
                pdfConstatModel.doublaitB! ? "11" : "",
                pdfConstatModel.viraitDroitB! ? "12" : "",
                pdfConstatModel.viraitGaucheB! ? "13" : "",
                pdfConstatModel.reculaitB! ? "14" : "",
                pdfConstatModel.reserveeB! ? "15" : "",
                pdfConstatModel.venaitB! ? "16" : "",
                pdfConstatModel.navaitB! ? "17" : "",
              ],
              "nbr_de_choix": pdfConstatModel.nbCirconstancesB.toString()
            }
        ]
      }
    };

    String url = "$createConstatUrl/$idUser";

    try {
      print("firssssssssssssssssssssssst");
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );
      print("Seconddddddddddddddddddddddddddddd");

      var jsonResponse = jsonDecode(response.body);
      print("Failed to create PDF: ${jsonResponse}");
      print("Failed to create PDF: ${jsonResponse['message']}");

      return jsonResponse['status'];
    } catch (e) {
      print("error de generation pdf = $e");
      return 404;
    }
    /*try {
      print("firssssssssssssssssssssssst");
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );
      print("Seconddddddddddddddddddddddddddddd");

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        if (response.headers['content-type']?.contains('application/json') ==
            true) {
          var jsonResponse = jsonDecode(response.body);
          print("Réponse JSON: $jsonResponse");
          return jsonResponse['status'];
        } else {
          print("La réponse n'est pas au format JSON.");
        }
      } else {
        print("Erreur: ${response.statusCode}");
        print("Body: ${response.body}");
      }
    } catch (e) {
      print("Erreur de génération PDF = $e");
    }*/
  }

  Future<List<ConstatCollectionModel>> getConstatController(
      String userId) async {
    String url = "$getConstatUrl/$userId";
    var response = await http.get(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
    );
    try {
      var jsonResponse = jsonDecode(response.body);
      if ((jsonResponse['constats'] as List).isNotEmpty) {
        return (jsonResponse['constats'] as List)
            .map((todo) => ConstatCollectionModel.fromJson(todo))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
