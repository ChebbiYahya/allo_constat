import 'package:flutter/material.dart';

import '../../../../models/constat_state_model.dart';
import '../../../../models/pdf_constat_model.dart';
import '../../components/title_constat.dart';

class DegatBComponent extends StatefulWidget {
  final ValueNotifier<ConstatState> constatNotifier;
  final PDFConstatModel pdfConstatModel;
  const DegatBComponent({
    required GlobalKey<DegatBComponentState> key,
    required this.constatNotifier,
    required this.pdfConstatModel,
  }) : super(key: key);

  @override
  State<DegatBComponent> createState() => DegatBComponentState();
}

class DegatBComponentState extends State<DegatBComponent> {
  late TextEditingController _degatApparentsVehicule, _observationVehicule;
  final _formKey = GlobalKey<FormState>();
  Future<void> remplir() async {
    widget.pdfConstatModel.degatApparentsVehiculeB =
        _degatApparentsVehicule.text.trim();
    widget.pdfConstatModel.observationVehiculeB =
        _observationVehicule.text.trim();
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
    _degatApparentsVehicule = TextEditingController();
    _observationVehicule = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _degatApparentsVehicule.dispose();
    _observationVehicule.dispose();
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
              const TitleConstat(nb: "10", title: "Dégats apparents"),
              const SizedBox(height: 10),
              TextFormField(
                controller: _degatApparentsVehicule,
                maxLines: 5,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10),
                  hintText: "dégat apparents",
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
              const TitleConstat(nb: "11", title: "Observation"),
              const SizedBox(height: 10),
              TextFormField(
                controller: _observationVehicule,
                maxLines: 5,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10),
                  hintText: "Observation",
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
