import 'package:flutter/material.dart';

import '../../../../models/constat_state_model.dart';
import '../../../../models/pdf_constat_model.dart';
import '../../components/title_constat.dart';

class AssureBComponent extends StatefulWidget {
  final ValueNotifier<ConstatState> constatNotifier;
  final PDFConstatModel pdfConstatModel;
  const AssureBComponent({
    required GlobalKey<AssureBComponentState> key,
    required this.constatNotifier,
    required this.pdfConstatModel,
  }) : super(key: key);

  @override
  State<AssureBComponent> createState() => AssureBComponentState();
}

class AssureBComponentState extends State<AssureBComponent> {
  late TextEditingController _nomAssure,
      _prenomAssure,
      _adresseAssure,
      _telephoneAssure;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nomAssure = TextEditingController();
    _prenomAssure = TextEditingController();
    _adresseAssure = TextEditingController();
    _telephoneAssure = TextEditingController();
  }

  @override
  void dispose() {
    _nomAssure.dispose();
    _prenomAssure.dispose();
    _adresseAssure.dispose();
    _telephoneAssure.dispose();
    super.dispose();
  }

  Future<void> remplir() async {
    widget.pdfConstatModel.nomAssureB = _nomAssure.text.trim();
    widget.pdfConstatModel.prenomAssureB = _prenomAssure.text.trim();
    widget.pdfConstatModel.adresseAssureB = _adresseAssure.text.trim();
    widget.pdfConstatModel.telephoneAssureB = _telephoneAssure.text.trim();
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
              const TitleConstat(
                  nb: "8", title: "Assuré \n(voir attest. d’assur)"),
              const SizedBox(height: 10),
              TextFormField(
                controller: _nomAssure,
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
                controller: _prenomAssure,
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
                controller: _adresseAssure,
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
                controller: _telephoneAssure,
                keyboardType: TextInputType.phone,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Téléphone",
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
