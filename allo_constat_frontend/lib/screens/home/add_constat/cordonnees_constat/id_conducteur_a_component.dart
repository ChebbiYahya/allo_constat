import 'package:flutter/material.dart';

import '../../../../models/constat_state_model.dart';
import '../../../../models/pdf_constat_model.dart';
import '../../../../theme/constants.dart';
import '../../components/title_constat.dart';

class IdConducteurAComponent extends StatefulWidget {
  final ValueNotifier<ConstatState> constatNotifier;
  final PDFConstatModel pdfConstatModel;
  const IdConducteurAComponent({
    required GlobalKey<IdConducteurAComponentState> key,
    required this.constatNotifier,
    required this.pdfConstatModel,
  }) : super(key: key);

  @override
  State<IdConducteurAComponent> createState() => IdConducteurAComponentState();
}

class IdConducteurAComponentState extends State<IdConducteurAComponent> {
  late TextEditingController _nomConducteur,
      _prenomConducteur,
      _adresseConducteur,
      _permisConduireConducteur;

  late DateTime dateDelivre;
  String delivre = "jj/mm/aaaa";
  DateTime dateTime = DateTime.now();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nomConducteur = TextEditingController();
    _prenomConducteur = TextEditingController();
    _adresseConducteur = TextEditingController();
    _permisConduireConducteur = TextEditingController();
  }

  @override
  void dispose() {
    _nomConducteur.dispose();
    _prenomConducteur.dispose();
    _adresseConducteur.dispose();
    _permisConduireConducteur.dispose();
    super.dispose();
  }

  Future<void> remplir() async {
    widget.pdfConstatModel.nomConducteurA = _nomConducteur.text.trim();
    widget.pdfConstatModel.prenomConducteurA = _prenomConducteur.text.trim();
    widget.pdfConstatModel.adresseConducteurA = _adresseConducteur.text.trim();
    widget.pdfConstatModel.permisConduireConducteurA =
        _permisConduireConducteur.text.trim();
    widget.pdfConstatModel.delivreConducteurA = delivre;
  }

  bool validateForm() {
    if (_formKey.currentState!.validate()) {
      remplir();
      return true;
    }
    return false;
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
              const TitleConstat(nb: "7", title: "Identité du Conducteur"),
              const SizedBox(height: 10),
              TextFormField(
                controller: _nomConducteur,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Nom",
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
                controller: _prenomConducteur,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Prénom",
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
                controller: _adresseConducteur,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Adresse",
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
                controller: _permisConduireConducteur,
                maxLines: 1,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Permis de conduire N°",
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
              ElevatedButton(
                onPressed: pickDateTimeDelivre,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kWhiteColor,
                  side: const BorderSide(color: kGreenColor, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(8.0),
                ),
                child: Text(
                  "Délivré : $delivre",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: kGreenColor,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future pickDateTimeDelivre() async {
    DateTime? date = await pickDate();
    if (date == null) return;

    final dateDelivre = DateTime(date.year, date.month, date.day);
    setState(() {
      this.dateDelivre = dateDelivre;
    });

    delivre = "${dateDelivre.year}/${dateDelivre.month}/${dateDelivre.day}";
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2030));
}
