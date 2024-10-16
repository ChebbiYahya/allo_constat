import 'package:flutter/material.dart';

import '../../../../models/constat_state_model.dart';
import '../../../../models/pdf_constat_model.dart';
import '../../components/title_constat.dart';

class CirconstanceBComponent extends StatefulWidget {
  final ValueNotifier<ConstatState> constatNotifier;
  final PDFConstatModel pdfConstatModel;
  const CirconstanceBComponent({
    required GlobalKey<CirconstanceBComponentState> key,
    required this.constatNotifier,
    required this.pdfConstatModel,
  }) : super(key: key);

  @override
  State<CirconstanceBComponent> createState() => CirconstanceBComponentState();
}

class CirconstanceBComponentState extends State<CirconstanceBComponent> {
  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;
  bool check5 = false;
  bool check6 = false;
  bool check7 = false;
  bool check8 = false;
  bool check9 = false;
  bool check10 = false;
  bool check11 = false;
  bool check12 = false;
  bool check13 = false;
  bool check14 = false;
  bool check15 = false;
  bool check16 = false;
  bool check17 = false;

//nb circanstances
  int nbCirB = 0;
  Future<void> remplir() async {
    widget.pdfConstatModel.enStationnementB = check1;
    widget.pdfConstatModel.quittaitB = check2;
    widget.pdfConstatModel.prenaitB = check3;
    widget.pdfConstatModel.sortaitB = check4;
    widget.pdfConstatModel.engageaitB = check5;
    widget.pdfConstatModel.arretB = check6;
    widget.pdfConstatModel.frottementB = check7;
    widget.pdfConstatModel.heurtaitB = check8;
    widget.pdfConstatModel.roulaitB = check9;
    widget.pdfConstatModel.changeaitB = check10;
    widget.pdfConstatModel.doublaitB = check11;
    widget.pdfConstatModel.viraitDroitB = check12;
    widget.pdfConstatModel.viraitGaucheB = check13;
    widget.pdfConstatModel.reculaitB = check14;
    widget.pdfConstatModel.reserveeB = check15;
    widget.pdfConstatModel.venaitB = check16;
    widget.pdfConstatModel.navaitB = check17;
    widget.pdfConstatModel.nbCirconstancesB = nbCirB;
  }

  bool validateForm() {
    remplir();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TitleConstat(nb: "12", title: "Circonstances"),
            const SizedBox(height: 10),
            CheckboxListTile(
                title: const Expanded(child: Text("En stationnement")),
                value: check1,
                onChanged: (value) {
                  setState(() {
                    check1 = value!;
                    if (value) {
                      nbCirB++;
                    } else {
                      nbCirB--;
                    }
                  });
                }),
            CheckboxListTile(
                title: const Expanded(child: Text("Quittait un stationnement")),
                value: check2,
                onChanged: (value) {
                  setState(() {
                    check2 = value!;
                    if (value) {
                      nbCirB++;
                    } else {
                      nbCirB--;
                    }
                  });
                }),
            CheckboxListTile(
                title: const Expanded(child: Text("Prenait un stationnement")),
                value: check3,
                onChanged: (value) {
                  setState(() {
                    check3 = value!;
                    if (value) {
                      nbCirB++;
                    } else {
                      nbCirB--;
                    }
                  });
                }),
            const Divider(),
            CheckboxListTile(
                title: const Expanded(
                    child: Text(
                        "Sortait d’un parking, d’un lieu privé, un chemin de terre")),
                value: check4,
                onChanged: (value) {
                  setState(() {
                    check4 = value!;
                    if (value) {
                      nbCirB++;
                    } else {
                      nbCirB--;
                    }
                  });
                }),
            CheckboxListTile(
                title: const Expanded(
                    child: Text(
                        "S’engageait dans un parking, un lieu privé, un chemin de terre")),
                value: check5,
                onChanged: (value) {
                  setState(() {
                    check5 = value!;
                    if (value) {
                      nbCirB++;
                    } else {
                      nbCirB--;
                    }
                  });
                }),
            const Divider(),
            CheckboxListTile(
                title: const Expanded(child: Text("Arrét de circulation")),
                value: check6,
                onChanged: (value) {
                  setState(() {
                    check6 = value!;
                    if (value) {
                      nbCirB++;
                    } else {
                      nbCirB--;
                    }
                  });
                }),
            CheckboxListTile(
                title: const Expanded(
                    child: Text("Frottement sans changement de fille")),
                value: check7,
                onChanged: (value) {
                  setState(() {
                    check7 = value!;
                    if (value) {
                      nbCirB++;
                    } else {
                      nbCirB--;
                    }
                  });
                }),
            CheckboxListTile(
                title: const Expanded(
                    child: Text(
                        "Heurtait à l’arrière, en roulant dans le meme sens et sur une meme file ")),
                value: check8,
                onChanged: (value) {
                  setState(() {
                    check8 = value!;
                    if (value) {
                      nbCirB++;
                    } else {
                      nbCirB--;
                    }
                  });
                }),
            CheckboxListTile(
                title: const Expanded(
                    child: Text(
                        "Roulait dans le meme sens et sur une fille différente")),
                value: check9,
                onChanged: (value) {
                  setState(() {
                    check9 = value!;
                    if (value) {
                      nbCirB++;
                    } else {
                      nbCirB--;
                    }
                  });
                }),
            CheckboxListTile(
                title: const Expanded(child: Text("Changeait de fille")),
                value: check10,
                onChanged: (value) {
                  setState(() {
                    check10 = value!;
                    if (value) {
                      nbCirB++;
                    } else {
                      nbCirB--;
                    }
                  });
                }),
            CheckboxListTile(
                title: const Expanded(child: Text("Doublait")),
                value: check11,
                onChanged: (value) {
                  setState(() {
                    check11 = value!;
                    if (value) {
                      nbCirB++;
                    } else {
                      nbCirB--;
                    }
                  });
                }),
            const Divider(),
            CheckboxListTile(
                title: const Expanded(child: Text("Virait à droit")),
                value: check12,
                onChanged: (value) {
                  setState(() {
                    check12 = value!;
                    if (value) {
                      nbCirB++;
                    } else {
                      nbCirB--;
                    }
                  });
                }),
            CheckboxListTile(
                title: const Expanded(child: Text("Virait à gauche")),
                value: check13,
                onChanged: (value) {
                  setState(() {
                    check13 = value!;
                    if (value) {
                      nbCirB++;
                    } else {
                      nbCirB--;
                    }
                  });
                }),
            const Divider(),
            CheckboxListTile(
                title: const Expanded(
                    child:
                        Text("Reculait empiétait sur la partie de chaussée")),
                value: check14,
                onChanged: (value) {
                  setState(() {
                    check14 = value!;
                    if (value) {
                      nbCirB++;
                    } else {
                      nbCirB--;
                    }
                  });
                }),
            CheckboxListTile(
                title: const Expanded(
                    child: Text("Réservée à la circulation en sens inverse")),
                value: check15,
                onChanged: (value) {
                  setState(() {
                    check15 = value!;
                    if (value) {
                      nbCirB++;
                    } else {
                      nbCirB--;
                    }
                  });
                }),
            CheckboxListTile(
                title: const Expanded(
                    child: Text("Venait de droit (dans un carrefour)")),
                value: check16,
                onChanged: (value) {
                  setState(() {
                    check16 = value!;
                    if (value) {
                      nbCirB++;
                    } else {
                      nbCirB--;
                    }
                  });
                }),
            CheckboxListTile(
                title: const Expanded(
                    child: Text("N’avait pas observé le signal de priorité")),
                value: check17,
                onChanged: (value) {
                  setState(() {
                    check17 = value!;
                    if (value) {
                      nbCirB++;
                    } else {
                      nbCirB--;
                    }
                  });
                }),
          ],
        ),
      ),
    );
  }
}
