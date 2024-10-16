import 'package:flutter/material.dart';

import '../../../../models/constat_state_model.dart';
import '../../../../models/pdf_constat_model.dart';
import '../../../../theme/constants.dart';
import '../../components/title_constat.dart';

class IdVehiculeAComponent extends StatefulWidget {
  final ValueNotifier<ConstatState> constatNotifier;
  final PDFConstatModel pdfConstatModel;
  const IdVehiculeAComponent({
    required GlobalKey<IdVehiculeAComponentState> key,
    required this.constatNotifier,
    required this.pdfConstatModel,
  }) : super(key: key);

  @override
  State<IdVehiculeAComponent> createState() => IdVehiculeAComponentState();
}

class IdVehiculeAComponentState extends State<IdVehiculeAComponent> {
  late TextEditingController _marqueVehicule,
      _numImmatriculationVehicule,
      _venantDeVehicule,
      _allantAVehicule;
  final _formKey = GlobalKey<FormState>();

  Future<void> remplir() async {
    widget.pdfConstatModel.marqueVehiculeA = _marqueVehicule.text.trim();
    widget.pdfConstatModel.numImmatriculationVehiculeA =
        _numImmatriculationVehicule.text.trim();
    widget.pdfConstatModel.venantDeVehiculeA = _venantDeVehicule.text.trim();
    widget.pdfConstatModel.allantAVehiculeA = _allantAVehicule.text.trim();
  }

  bool validateForm() {
    if (_formKey.currentState!.validate()) {
      remplir();
      return true;
    }
    return false;
  }

  @override
  void initState() {
    _marqueVehicule = TextEditingController();
    _numImmatriculationVehicule = TextEditingController();
    _venantDeVehicule = TextEditingController();
    _allantAVehicule = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _marqueVehicule.dispose();
    _numImmatriculationVehicule.dispose();
    _venantDeVehicule.dispose();
    _allantAVehicule.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const TitleConstat(nb: "9", title: "Identité du Véhicule"),
              const SizedBox(height: 10),
              TextFormField(
                controller: _marqueVehicule,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Marque, Type",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                style: Theme.of(context).inputDecorationTheme.labelStyle,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ce champ est obligatoire';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _numImmatriculationVehicule,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "N° d'immatriculation",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                style: Theme.of(context).inputDecorationTheme.labelStyle,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ce champ est obligatoire';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text(
                "Sens Suivi",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: kDarkBlueColor,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _venantDeVehicule,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Venant de",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                style: Theme.of(context).inputDecorationTheme.labelStyle,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ce champ est obligatoire';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _allantAVehicule,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Allant à",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                style: Theme.of(context).inputDecorationTheme.labelStyle,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ce champ est obligatoire';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
