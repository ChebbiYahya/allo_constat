import 'package:flutter/material.dart';
import '../../../models/constat_state_model.dart';
import '../../../models/pdf_constat_model.dart';
import '../../../theme/constants.dart';
import '../components/text_field_constat.dart';
import '../components/title_constat.dart';

class DeclarationAccidentScreen extends StatefulWidget {
  const DeclarationAccidentScreen({
    super.key,
    required this.constatNotifier,
    required this.pdfConstatModel,
  });
  final ValueNotifier<ConstatState> constatNotifier;
  final PDFConstatModel pdfConstatModel;

  @override
  State<DeclarationAccidentScreen> createState() =>
      _DeclarationAccidentScreenState();
}

class _DeclarationAccidentScreenState extends State<DeclarationAccidentScreen> {
  List<bool> isSelectedDegatMateriel = [false, true];
  List<bool> isSelectedBlesses = [false, true];
  String? date = "";

  late TextEditingController _temoin;
  DateTime dateTime = DateTime.now();
  String regionAccident = "";
  String lieuAccident = "";
  var items = const <DropdownMenuEntry<String>>[
    DropdownMenuEntry(value: "Ariana", label: "Ariana"),
    DropdownMenuEntry(value: "Béja", label: "Béja"),
    DropdownMenuEntry(value: "Ben Arous", label: "Ben Arous"),
    DropdownMenuEntry(value: "Bizerte", label: "Bizerte"),
    DropdownMenuEntry(value: "Gabès", label: "Gabès"),
    DropdownMenuEntry(value: "Gafsa", label: "Gafsa"),
    DropdownMenuEntry(value: "Jendouba", label: "Jendouba"),
    DropdownMenuEntry(value: "Kairouan", label: "Kairouan"),
    DropdownMenuEntry(value: "Kasserine", label: "Kasserine"),
    DropdownMenuEntry(value: "Kébili", label: "Kébili"),
    DropdownMenuEntry(value: "Kef", label: "Kef"),
    DropdownMenuEntry(value: "Mahdia", label: "Mahdia"),
    DropdownMenuEntry(value: "Manouba", label: "Manouba"),
    DropdownMenuEntry(value: "Médenine", label: "Médenine"),
    DropdownMenuEntry(value: "Monastir", label: "Monastir"),
    DropdownMenuEntry(value: "Nabeul", label: "Nabeul"),
    DropdownMenuEntry(value: "Sfax", label: "Sfax"),
    DropdownMenuEntry(value: "Sidi Bouzid", label: "Sidi Bouzid"),
    DropdownMenuEntry(value: "Siliana", label: "Siliana"),
    DropdownMenuEntry(value: "Sousse", label: "Sousse"),
    DropdownMenuEntry(value: "Tataouine", label: "Tataouine"),
    DropdownMenuEntry(value: "Tozeur", label: "Tozeur"),
    DropdownMenuEntry(value: "Tunis", label: "Tunis"),
    DropdownMenuEntry(value: "Zaghouan", label: "Zaghouan"),
  ];
  @override
  void initState() {
    _temoin = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _temoin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: const BoxDecoration(
                              color: kGreenColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                "1",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: DropdownMenu(
                              width: MediaQuery.of(context).size.width * 0.8,
                              label: Text(
                                "Région de l'accident",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: kDarkGreeyColor,
                                      // fontWeight: FontWeight.bold
                                    ),
                              ),
                              inputDecorationTheme: InputDecorationTheme(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              enableSearch: true,
                              onSelected: (lieu) {
                                if (lieu != null) {
                                  setState(() {
                                    regionAccident = lieu;
                                  });
                                }
                              },
                              dropdownMenuEntries: items,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFieldConstat(
                      nb: "2",
                      title: "Lieu",
                      onTextChanged: (value) {
                        setState(() {
                          lieuAccident = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    const TitleConstat(nb: "3", title: "Date de l'accident"),
                    const SizedBox(height: 10),
                    SizedBox(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kWhiteColor,
                          side: const BorderSide(color: kGreenColor, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.all(8.0),
                        ),
                        onPressed: pickDateTime,
                        child: Text(
                          " ${dateTime.year}/${dateTime.month}/${dateTime.day} $hours:$minutes ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: kGreenColor,
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TitleConstat(nb: "4", title: "Dégâts matériels"),
                    Text(
                      "(autres qu'aux véhicules A et B)",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: kDarkBlueColor,
                              fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: ToggleButtons(
                        renderBorder: false,
                        fillColor: Colors.transparent,
                        onPressed: (index) {
                          setState(() {
                            for (int i = 0;
                                i < isSelectedDegatMateriel.length;
                                i++) {
                              isSelectedDegatMateriel[i] = i == index;
                            }
                          });
                        },
                        isSelected: isSelectedDegatMateriel,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: isSelectedDegatMateriel[0]
                                  ? kGreenColor
                                  : Colors.transparent,
                              border: Border.all(
                                color: kGreenColor,
                                width: 1.0,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                'Oui',
                                style: TextStyle(
                                  color: isSelectedDegatMateriel[0]
                                      ? Colors.white
                                      : kGreenColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: isSelectedDegatMateriel[1]
                                  ? kGreenColor
                                  : Colors.transparent,
                              border: Border.all(
                                color: kGreenColor,
                                width: 1.0,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                'Non',
                                style: TextStyle(
                                  color: isSelectedDegatMateriel[1]
                                      ? Colors.white
                                      : kGreenColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const TitleConstat(nb: "5", title: "Blessés"),
                    Text(
                      "(meme légers)",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: kDarkBlueColor,
                              fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: ToggleButtons(
                        renderBorder: false,
                        fillColor: Colors.transparent,
                        onPressed: (index) {
                          setState(() {
                            for (int i = 0; i < isSelectedBlesses.length; i++) {
                              isSelectedBlesses[i] = i == index;
                            }
                          });
                        },
                        isSelected: isSelectedBlesses,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: isSelectedBlesses[0]
                                  ? kGreenColor
                                  : Colors.transparent,
                              border: Border.all(
                                color: kGreenColor,
                                width: 1.0,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                'Oui',
                                style: TextStyle(
                                  color: isSelectedBlesses[0]
                                      ? Colors.white
                                      : kGreenColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: isSelectedBlesses[1]
                                  ? kGreenColor
                                  : Colors.transparent,
                              border: Border.all(
                                color: kGreenColor,
                                width: 1.0,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                'Non',
                                style: TextStyle(
                                  color: isSelectedBlesses[1]
                                      ? Colors.white
                                      : kGreenColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TitleConstat(nb: "11", title: "Observation"),
                    Text(
                      "nom, adresses et tel \n(à souligner s'il s'agit d'un passager de A et B)",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: kDarkBlueColor,
                              fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: _temoin,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          labelText: "témoins",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        style:
                            Theme.of(context).inputDecorationTheme.labelStyle,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ce champ est obligatoire';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize:
                          const Size(150, 50), // Taille minimum du bouton
                      backgroundColor: kGreenColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Retour",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: kWhiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 50),
                      backgroundColor: kGreenColor,
                    ),
                    onPressed: () {
                      if (lieuAccident != "" && regionAccident != "") {
                        widget.constatNotifier.value = ConstatState(
                          declaration: true,
                          vehA: true,
                          vehB: false,
                          croquis: false,
                          nbVoiture: widget.constatNotifier.value.nbVoiture,
                        );
                        String dateAcc =
                            "${dateTime.year}/${dateTime.month}/${dateTime.day}";
                        String heureAcc = "$hours:$minutes";

                        final updatedPdfConstatModel = widget.pdfConstatModel;
                        updatedPdfConstatModel.dateAccident =
                            dateAcc.toString();
                        updatedPdfConstatModel.heureAccident =
                            heureAcc.toString();
                        updatedPdfConstatModel.regionAccident = regionAccident;
                        updatedPdfConstatModel.lieuAccident =
                            "$lieuAccident, $regionAccident";
                        updatedPdfConstatModel.temoin = _temoin.text.trim();
                        updatedPdfConstatModel.blesses = isSelectedBlesses[0];
                        updatedPdfConstatModel.degatMateriels =
                            isSelectedDegatMateriel[0];

                        Navigator.pushNamed(
                          context,
                          '/vehiculeA',
                          arguments: widget.pdfConstatModel,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: const Column(
                                children: [
                                  Text(
                                      "Région, lieu et date sont obligatoires"),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Suivant",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: kWhiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return;
    TimeOfDay? time = await pickTime();
    if (time == null) return;
    final dateTime =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);
    setState(() {
      this.dateTime = dateTime;
    });
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(2023),
      lastDate: dateTime);
  Future<TimeOfDay?> pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(
          hour: dateTime.hour,
          minute: dateTime.minute,
        ),
      );
}
