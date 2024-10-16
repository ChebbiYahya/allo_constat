import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/constat_controller.dart';
import '../../../models/constat_state_model.dart';
import '../../../models/pdf_constat_model.dart';
import '../../../theme/constants.dart';
import '../components/nb_voitures_component.dart';

class NbVoituresScreen extends StatefulWidget {
  const NbVoituresScreen({
    super.key,
    required this.constatNotifier,
    required this.pdfConstatModel,
  });
  final ValueNotifier<ConstatState> constatNotifier;
  final PDFConstatModel pdfConstatModel;

  @override
  State<NbVoituresScreen> createState() => _NbVoituresScreenState();
}

class _NbVoituresScreenState extends State<NbVoituresScreen> {
  final controller = Get.put(ConstatController());

  int? _selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Combien de véhicules sont impliqués ?",
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: kDarkBlueColor, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          NbVoituresComponent(
            imageUrl: "assets/images/car_accident_image.svg",
            text: '1 Véhicule',
            value: 1,
            groupValue: _selectedOption,
            onChanged: (int? value) {
              setState(() {
                _selectedOption = value;
                widget.constatNotifier.value = ConstatState(
                  declaration: true,
                  vehA: false,
                  vehB: false,
                  croquis: false,
                  nbVoiture: 1,
                );
              });
            },
          ),
          const SizedBox(height: 20.0),
          NbVoituresComponent(
            imageUrl: "assets/images/2_cars_accident_image.svg",
            text: '2 Véhicules',
            value: 2,
            groupValue: _selectedOption,
            onChanged: (int? value) {
              setState(() {
                _selectedOption = value;
                widget.constatNotifier.value = ConstatState(
                  declaration: true,
                  vehA: false,
                  vehB: false,
                  croquis: false,
                  nbVoiture: 2,
                );
              });
            },
          ),
          const SizedBox(height: 20.0),
          const Spacer(),
          Positioned(
            bottom: 20,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: kGreenColor,
                ),
                onPressed: () async {
                  /*   await controller
                      .getConstatController("66e5c0f31f2b10ae7bb76cc1");*/
                  widget.constatNotifier.value = ConstatState(
                    declaration: true,
                    vehA: false,
                    vehB: false,
                    croquis: false,
                    nbVoiture: _selectedOption!,
                  );
                  widget.pdfConstatModel.nbVoiture = _selectedOption;

                  Navigator.pushNamed(context, '/declaration',
                      arguments: widget.pdfConstatModel);
                },
                child: Text(
                  "Suivant",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: kWhiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  /* creationConstat() async {
    var regBody = {
      "report": {
        "vehicleType": "car",
        "date_accident": "2024-07-13",
        "heure_accident": "12:00",
        "lieu": "Tunis",
        "blesses": false,
        "degats_materiels": true,
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
            "marque": "Toyota",
            "numero_immatriculation": "1234-AB-56",
            "degats_apparents":
                "Front bumper damaged hahahahahah ahahaha hahaha hahahah hahahah hahahah",
            "observations":
                "No other visible damage hahahahahah ahahaha hahaha hahahah hahahah hahahah",
            "sens_suivi_venant": "North",
            "sens_suivi_allant": "South",
            "photos": [
              {
                "images": ["ghghghg", "jhjhjjhjh"],
                "pointChoc": "photosBase64A"
              }
            ],
            "assurance": {
              "nom": "Company A",
              "numero_assurance": "INS-12345",
              "localisation": "Tunis",
              "date_validiteFin": "2024-12-31",
              "date_validiteDebut": "2024-12-20"
            },
            "conducteur": {
              "nom": "Jane Smith",
              "prenom": "Jane",
              "adresse": "456 Elm St, Tunis",
              "numero_permis": "D12345678",
              "date_delivration": "2020-01-01"
            },
            "assure": {
              "nom": "Jane Smith",
              "prenom": "Jane",
              "adresse": "456 Elm St, Tunis",
              "tel": "00000000"
            },
            "circonstances": [
              "1",
              "2",
              "3",
              "4",
              "11",
              "12",
              "13",
              "16",
              "5",
              "8",
              "9",
              "6",
              "7",
              "17",
              "14",
              "10",
              "15"
            ],
            "nbr_de_choix": "17"
          },
          {
            "nom": "B",
            "marque": "Honda",
            "numero_immatriculation": "5678-CD-90",
            "degats_apparents":
                "Front bumper damaged hahahahahah ahahaha hahaha hahahah hahahah hahahah",
            "observations":
                "Scratch on the left side hahahahahah ahahaha hahaha hahahah hahahah hahahah",
            "sens_suivi_venant": "West",
            "sens_suivi_allant": "East",
            "photos": [
              {
                "images": ["ghghghg", "jhjhjjhjh"],
                "pointChoc": "photosBase64A"
              }
            ],
            "assurance": {
              "nom": "Company B",
              "numero_assurance": "INS-67890",
              "localisation": "Tunis",
              "date_validiteFin": "2024-11-30",
              "date_validiteDebut": "2024-11-20"
            },
            "conducteur": {
              "nom": "John Doe",
              "prenom": "John",
              "adresse": "789 Pine St, Tunis",
              "numero_permis": "E12345678",
              "date_delivration": "2019-05-15"
            },
            "assure": {
              "nom": "John Doe",
              "prenom": "John",
              "adresse": "789 Pine St, Tunis",
              "tel": "11111111"
            },
            "circonstances": [
              "1",
              "2",
              "3",
              "4",
              "11",
              "12",
              "13",
              "16",
              "5",
              "8",
              "9",
              "6",
              "15"
            ],
            "nbr_de_choix": "11"
          }
        ]
      }
    };
    String url = "http://192.168.100.9:3000/api/pdf/generate";
    final Response response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(regBody),
    );
    var jsonResponse = jsonDecode(response.body);
    print(jsonResponse['status']);
  }*/
}
