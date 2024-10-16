import 'package:allo_constat_frontend/models/pdf_constat_model.dart';
import 'package:flutter/material.dart';
import '../../../models/constat_state_model.dart';
import '../../../theme/constants.dart';
import '../components/text_resume_component.dart';

class ResumeAScreen extends StatefulWidget {
  final ValueNotifier<ConstatState> constatNotifier;
  final PDFConstatModel pdfConstatModel;
  const ResumeAScreen({
    super.key,
    required this.constatNotifier,
    required this.pdfConstatModel,
  });

  @override
  State<ResumeAScreen> createState() => _ResumeAScreenState();
}

class _ResumeAScreenState extends State<ResumeAScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kLightBlueColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      "RAPPORT du VEHICULE A",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                    TextResume(
                        title: "Date :",
                        subtitle: widget.pdfConstatModel.dateAccident!),
                    TextResume(
                        title: "Heure :",
                        subtitle: widget.pdfConstatModel.heureAccident!),
                    TextResume(
                        title: "Region Accident:",
                        subtitle: widget.pdfConstatModel.regionAccident!),
                    TextResume(
                        title: "Lieu Accident:",
                        subtitle: widget.pdfConstatModel.lieuAccident!),
                    TextResume(
                      title: "Blessés :",
                      subtitle: widget.pdfConstatModel.blesses == true
                          ? "Oui"
                          : "Non",
                    ),
                    TextResume(
                      title: "Dégats matériels :",
                      subtitle: widget.pdfConstatModel.degatMateriels == true
                          ? "Oui"
                          : "Non",
                    ),
                    TextResume(
                        title: "Témoins :",
                        subtitle: widget.pdfConstatModel.temoin),
                    const Divider(),
                    Text(
                      "Société d'Assurances",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    TextResume(
                        title: "Véhicule assuré par :",
                        subtitle: widget.pdfConstatModel.vehiculeAssureParA!),
                    TextResume(
                        title: "Police d'assurance N° :",
                        subtitle: widget.pdfConstatModel.policeAssuranceA!),
                    TextResume(
                        title: "Agence :",
                        subtitle: widget.pdfConstatModel.agenceA!),
                    TextResume(
                        title: "Attestation valable du:",
                        subtitle:
                            widget.pdfConstatModel.attestationValableDeA ?? ""),
                    TextResume(
                        title: "Attestation valable au :",
                        subtitle:
                            widget.pdfConstatModel.attestationValableAuA ?? ""),
                    const Divider(),
                    Text(
                      "Identité du Conducteur",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    TextResume(
                        title: "Nom :",
                        subtitle: widget.pdfConstatModel.nomConducteurA),
                    TextResume(
                        title: "Prénom :",
                        subtitle: widget.pdfConstatModel.prenomConducteurA),
                    TextResume(
                        title: "Permis de conduire N° :",
                        subtitle:
                            widget.pdfConstatModel.permisConduireConducteurA),
                    TextResume(
                        title: "Délivré le :",
                        subtitle:
                            widget.pdfConstatModel.delivreConducteurA ?? ""),
                    const Divider(),
                    Text(
                      "Assuré",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    TextResume(
                        title: "Nom :",
                        subtitle: widget.pdfConstatModel.nomAssureA),
                    TextResume(
                        title: "Prénom :",
                        subtitle: widget.pdfConstatModel.prenomAssureA),
                    TextResume(
                        title: "Adresse :",
                        subtitle: widget.pdfConstatModel.adresseAssureA),
                    TextResume(
                        title: "Téléphone :",
                        subtitle: widget.pdfConstatModel.telephoneAssureA),
                    const Divider(),
                    Text(
                      "Identité du véhicule",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    TextResume(
                        title: "Marque, Type :",
                        subtitle: widget.pdfConstatModel.marqueVehiculeA),
                    TextResume(
                        title: "N° d'immatriculation :",
                        subtitle:
                            widget.pdfConstatModel.numImmatriculationVehiculeA),
                    const Divider(),
                    Text(
                      "Sens suivi",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    TextResume(
                        title: "Venant de :",
                        subtitle: widget.pdfConstatModel.venantDeVehiculeA),
                    TextResume(
                        title: "Allant à :",
                        subtitle: widget.pdfConstatModel.allantAVehiculeA),
                    const Divider(),
                    Text(
                      "Dégats apparents",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      widget.pdfConstatModel.degatApparentsVehiculeA.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w400, fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                    const Divider(),
                    Text(
                      "Observations",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      widget.pdfConstatModel.observationVehiculeA.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w400, fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                    const Divider(),
                    Text(
                      "Circonstances",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.pdfConstatModel.enStationnementA == true)
                          Text(
                            "-En stationnement",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.quittaitA == true)
                          Text(
                            "-Quittait un stationnement",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.prenaitA == true)
                          Text(
                            "-Prenait un stationnement",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.sortaitA == true)
                          Text(
                            "-Sortait d'un parking, d'un lieu privé, d'un chemin de terre",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.engageaitA == true)
                          Text(
                            "-S'engageait dans un parking, un lieu privé, un chemin de terre",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.arretA == true)
                          Text(
                            "-Arret de circulation",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.frottementA == true)
                          Text(
                            "-Frottement sans changement de file",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.heurtaitA == true)
                          Text(
                            "-Heurtait à l'arriere, en roulant dans le meme sans et sur un meme file",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.roulaitA == true)
                          Text(
                            "-Roulait dans le meme sens et sur une file différente",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.changeaitA == true)
                          Text(
                            "-Changeait de file",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.doublaitA == true)
                          Text(
                            "-Doublait",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.viraitDroitA == true)
                          Text(
                            "-Virait à droite",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.viraitGaucheA == true)
                          Text(
                            "-Virait à gauche",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.reculaitA == true)
                          Text(
                            "-Reculait empiétait sur la partie de chaussée",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.reserveeA == true)
                          Text(
                            "-Réservée à la circulation en sens inverse",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.venaitA == true)
                          Text(
                            "-Venait de droite (dans un carrefour)",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.navaitA == true)
                          Text(
                            "-n'avait pas observé le signal de priorité",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                      ],
                    ),
                    TextResume(
                        title: "Nombre Circonstances :",
                        subtitle:
                            widget.pdfConstatModel.nbCirconstancesA.toString()),
                    const Divider(),
                    //Image indiquer par fleche
                    Center(
                      child: Image.memory(widget.pdfConstatModel.imageFlecheA!),
                    ),
                    //Image Carte grise
                    const SizedBox(height: 10),
                    const Divider(),
                    Text(
                      "Carte grise A",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child:
                          widget.pdfConstatModel.imageCarteGriseRectoA != null
                              ? Image.memory(
                                  widget.pdfConstatModel.imageCarteGriseRectoA!)
                              : const Text('No Image'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child:
                          widget.pdfConstatModel.imageCarteGriseVersoA != null
                              ? Image.memory(
                                  widget.pdfConstatModel.imageCarteGriseVersoA!)
                              : const Text('No Image'),
                    ),
                    //Image Assurance
                    const SizedBox(height: 10),
                    const Divider(),
                    Text(
                      "Assurance A",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imageAssuranceA != null
                          ? Image.memory(
                              widget.pdfConstatModel.imageAssuranceA!)
                          : const Text('No Image'),
                    ),
                    //Image Permis de consuire
                    const SizedBox(height: 10),
                    const Divider(),
                    Text(
                      "Permis de conduire A",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imagePermisRectoA != null
                          ? Image.memory(
                              widget.pdfConstatModel.imagePermisRectoA!)
                          : const Text('No Image'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imagePermisVersoA != null
                          ? Image.memory(
                              widget.pdfConstatModel.imagePermisVersoA!)
                          : const Text('No Image'),
                    ),
                    //Image voiture A
                    const SizedBox(height: 10),
                    const Divider(),
                    Text(
                      "Voiture A",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imageVoitureAvA != null
                          ? Image.memory(
                              widget.pdfConstatModel.imageVoitureAvA!)
                          : const Text('No Image'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imageVoitureAvDA != null
                          ? Image.memory(
                              widget.pdfConstatModel.imageVoitureAvDA!)
                          : const Text('No Image'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imageVoitureDA != null
                          ? Image.memory(widget.pdfConstatModel.imageVoitureDA!)
                          : const Text('No Image'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imageVoitureDerDA != null
                          ? Image.memory(
                              widget.pdfConstatModel.imageVoitureDerDA!)
                          : const Text('No Image'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imageVoitureDerA != null
                          ? Image.memory(
                              widget.pdfConstatModel.imageVoitureDerA!)
                          : const Text('No Image'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imageVoitureDerDA != null
                          ? Image.memory(
                              widget.pdfConstatModel.imageVoitureDerDA!)
                          : const Text('No Image'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imageVoitureDerGA != null
                          ? Image.memory(
                              widget.pdfConstatModel.imageVoitureDerGA!)
                          : const Text('No Image'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imageVoitureGA != null
                          ? Image.memory(widget.pdfConstatModel.imageVoitureGA!)
                          : const Text('No Image'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imageVoitureAvGA != null
                          ? Image.memory(
                              widget.pdfConstatModel.imageVoitureAvGA!)
                          : const Text('No Image'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
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
                    if (widget.constatNotifier.value.nbVoiture == 2) {
                      widget.constatNotifier.value = ConstatState(
                          declaration: true,
                          vehA: true,
                          vehB: false,
                          croquis: false,
                          nbVoiture: widget.constatNotifier.value.nbVoiture);
                    }
                    if (widget.constatNotifier.value.nbVoiture == 1) {
                      widget.constatNotifier.value = ConstatState(
                          declaration: true,
                          vehA: true,
                          vehB: false,
                          croquis: false,
                          nbVoiture: widget.constatNotifier.value.nbVoiture);
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Retour",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: kWhiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        const Size(150, 50), // Taille minimum du bouton
                    backgroundColor: kGreenColor,
                  ),
                  onPressed: () {
                    if (widget.constatNotifier.value.nbVoiture == 2) {
                      widget.constatNotifier.value = ConstatState(
                          declaration: true,
                          vehA: true,
                          vehB: true,
                          croquis: false,
                          nbVoiture: widget.constatNotifier.value.nbVoiture);
                      Navigator.pushNamed(context, '/vehiculeB',
                          arguments: widget.pdfConstatModel);
                    }
                    if (widget.constatNotifier.value.nbVoiture == 1) {
                      widget.constatNotifier.value = ConstatState(
                          declaration: true,
                          vehA: true,
                          vehB: false,
                          croquis: true,
                          nbVoiture: widget.constatNotifier.value.nbVoiture);
                      Navigator.pushNamed(context, '/croquis',
                          arguments: widget.pdfConstatModel);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Text(
                      "Valider vehicule A",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: kWhiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
