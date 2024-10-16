import 'package:flutter/material.dart';

import '../../../../models/constat_state_model.dart';
import '../../../../models/pdf_constat_model.dart';
import '../../../../theme/constants.dart';
import '../../components/title_constat.dart';

class SocieteAssuranceAComponent extends StatefulWidget {
  final ValueNotifier<ConstatState> constatNotifier;
  final PDFConstatModel pdfConstatModel;
  const SocieteAssuranceAComponent({
    required GlobalKey<SocieteAssuranceAComponentState> key,
    required this.constatNotifier,
    required this.pdfConstatModel,
  }) : super(key: key);

  @override
  State<SocieteAssuranceAComponent> createState() =>
      SocieteAssuranceAComponentState();
}

class SocieteAssuranceAComponentState
    extends State<SocieteAssuranceAComponent> {
  late TextEditingController _vehiculeAssurePar, _policeAssurance, _agence;
  final _formKey = GlobalKey<FormState>();

  DateTime dateTime = DateTime.now();
  late DateTime dateAttesValDu;
  late DateTime dateAttesValAu;
  String attestationDu = "jj/mm/aaaa";
  String attestationAu = "jj/mm/aaaa";

  Future<void> remplir() async {
    widget.pdfConstatModel.vehiculeAssureParA = _vehiculeAssurePar.text.trim();
    widget.pdfConstatModel.policeAssuranceA = _policeAssurance.text.trim();
    widget.pdfConstatModel.agenceA = _agence.text.trim();
    widget.pdfConstatModel.attestationValableDeA = attestationDu;
    widget.pdfConstatModel.attestationValableAuA = attestationAu;
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
    _vehiculeAssurePar = TextEditingController();
    _policeAssurance = TextEditingController();
    _agence = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _vehiculeAssurePar.dispose();
    _policeAssurance.dispose();
    _agence.dispose();
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
              const TitleConstat(nb: "6", title: "Société d’assurances"),
              const SizedBox(height: 10),
              TextFormField(
                controller: _vehiculeAssurePar,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Véhicule assuré par",
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
                controller: _policeAssurance,
                //keyboardType: TextInputType.phone,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Police d’assurance N°",
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
                controller: _agence,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Agence",
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
                "Attestation valable",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: kDarkBlueColor,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: pickDateTimeAttValDu,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kWhiteColor,
                  side: const BorderSide(color: kGreenColor, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(8.0),
                ),
                child: Text(
                  " Du : $attestationDu",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: kGreenColor,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: pickDateTimeAttValAu,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kWhiteColor,
                  side: const BorderSide(color: kGreenColor, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(8.0),
                ), //pickDateTimeAttValAu,
                child: Text(
                  "Au : $attestationAu",
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

  Future pickDateTimeAttValDu() async {
    DateTime? date = await pickDate();
    if (date == null) return;

    final dateAttesValDu = DateTime(date.year, date.month, date.day);
    setState(() {
      this.dateAttesValDu = dateAttesValDu;
    });
    attestationDu =
        "${dateAttesValDu.year}/${dateAttesValDu.month}/${dateAttesValDu.day}";
  }

  Future pickDateTimeAttValAu() async {
    DateTime? date = await pickDate();
    if (date == null) return;

    final dateAttesValAu = DateTime(date.year, date.month, date.day);
    setState(() {
      this.dateAttesValAu = dateAttesValAu;
    });

    attestationAu =
        "${dateAttesValAu.year}/${dateAttesValAu.month}/${dateAttesValAu.day}";
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2030));
}
