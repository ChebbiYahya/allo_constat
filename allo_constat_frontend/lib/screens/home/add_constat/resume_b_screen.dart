import 'package:flutter/material.dart';
import '../../../models/constat_state_model.dart';
import '../../../models/pdf_constat_model.dart';
import '../../../theme/constants.dart';
import '../components/text_resume_component.dart';

class ResumeBScreen extends StatefulWidget {
  final ValueNotifier<ConstatState> constatNotifier;
  final PDFConstatModel pdfConstatModel;
  const ResumeBScreen({
    super.key,
    required this.constatNotifier,
    required this.pdfConstatModel,
  });

  @override
  State<ResumeBScreen> createState() => _ResumeBScreenState();
}

class _ResumeBScreenState extends State<ResumeBScreen> {
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
                      "RAPPORT du VEHICULE B",
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
                        subtitle: widget.pdfConstatModel.vehiculeAssureParB),
                    TextResume(
                        title: "Police d'assurance N° :",
                        subtitle: widget.pdfConstatModel.policeAssuranceB),
                    TextResume(
                        title: "Agence :",
                        subtitle: widget.pdfConstatModel.agenceB),
                    TextResume(
                        title: "Attestation valable du:",
                        subtitle: widget.pdfConstatModel.attestationValableDeB),
                    TextResume(
                        title: "Attestation valable au :",
                        subtitle: widget.pdfConstatModel.attestationValableAuB),
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
                        subtitle: widget.pdfConstatModel.nomConducteurB),
                    TextResume(
                        title: "Prénom :",
                        subtitle: widget.pdfConstatModel.prenomConducteurB),
                    TextResume(
                        title: "Permis de conduire N° :",
                        subtitle:
                            widget.pdfConstatModel.permisConduireConducteurB),
                    TextResume(
                        title: "Délivré le :",
                        subtitle: widget.pdfConstatModel.delivreConducteurB),
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
                        subtitle: widget.pdfConstatModel.nomAssureB),
                    TextResume(
                        title: "Prénom :",
                        subtitle: widget.pdfConstatModel.prenomAssureB),
                    TextResume(
                        title: "Adresse :",
                        subtitle: widget.pdfConstatModel.adresseAssureB),
                    TextResume(
                        title: "Téléphone :",
                        subtitle: widget.pdfConstatModel.telephoneAssureB),
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
                        subtitle: widget.pdfConstatModel.marqueVehiculeB),
                    TextResume(
                        title: "N° d'immatriculation :",
                        subtitle:
                            widget.pdfConstatModel.numImmatriculationVehiculeB),
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
                        subtitle: widget.pdfConstatModel.venantDeVehiculeB),
                    TextResume(
                        title: "Allant à :",
                        subtitle: widget.pdfConstatModel.allantAVehiculeB),
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
                      widget.pdfConstatModel.degatApparentsVehiculeB.toString(),
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
                      widget.pdfConstatModel.observationVehiculeB.toString(),
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
                        if (widget.pdfConstatModel.enStationnementB == true)
                          Text(
                            "-En stationnement",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.quittaitB == true)
                          Text(
                            "-Quittait un stationnement",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.prenaitB == true)
                          Text(
                            "-Prenait un stationnement",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.sortaitB == true)
                          Text(
                            "-Sortait d'un parking, d'un lieu privé, d'un chemin de terre",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.engageaitB == true)
                          Text(
                            "-S'engageait dans un parking, un lieu privé, un chemin de terre",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.arretB == true)
                          Text(
                            "-Arret de circulation",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.frottementB == true)
                          Text(
                            "-Frottement sans changement de file",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.heurtaitB == true)
                          Text(
                            "-Heurtait à l'arriere, en roulant dans le meme sans et sur un meme file",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.roulaitB == true)
                          Text(
                            "-Roulait dans le meme sens et sur une file différente",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.changeaitB == true)
                          Text(
                            "-Changeait de file",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.doublaitB == true)
                          Text(
                            "-Doublait",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.viraitDroitB == true)
                          Text(
                            "-Virait à droite",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.viraitGaucheB == true)
                          Text(
                            "-Virait à gauche",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.reculaitB == true)
                          Text(
                            "-Reculait empiétait sur la partie de chaussée",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.reserveeB == true)
                          Text(
                            "-Réservée à la circulation en sens inverse",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.venaitB == true)
                          Text(
                            "-Venait de droite (dans un carrefour)",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        if (widget.pdfConstatModel.navaitB == true)
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
                            widget.pdfConstatModel.nbCirconstancesB.toString()),
                    const Divider(),
                    //Image indiquer par fleche
                    Center(
                      child: Image.memory(widget.pdfConstatModel.imageFlecheB!),
                    ),
                    //Image Carte grise
                    const SizedBox(height: 10),
                    const Divider(),
                    Text(
                      "Carte grise B",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child:
                          widget.pdfConstatModel.imageCarteGriseRectoB != null
                              ? Image.memory(
                                  widget.pdfConstatModel.imageCarteGriseRectoB!)
                              : const Text('No Image'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child:
                          widget.pdfConstatModel.imageCarteGriseVersoB != null
                              ? Image.memory(
                                  widget.pdfConstatModel.imageCarteGriseVersoB!)
                              : const Text('No Image'),
                    ),
                    //Image Assurance
                    const SizedBox(height: 10),
                    const Divider(),
                    Text(
                      "Assurance B",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imageAssuranceB != null
                          ? Image.memory(
                              widget.pdfConstatModel.imageAssuranceB!)
                          : const Text('No Image'),
                    ),
                    //Image Permis de consuire
                    const SizedBox(height: 10),
                    const Divider(),
                    Text(
                      "Permis de conduire B",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imagePermisRectoB != null
                          ? Image.memory(
                              widget.pdfConstatModel.imagePermisRectoB!)
                          : const Text('No Image'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imagePermisVersoB != null
                          ? Image.memory(
                              widget.pdfConstatModel.imagePermisVersoB!)
                          : const Text('No Image'),
                    ),
                    //Image voiture A
                    const SizedBox(height: 10),
                    const Divider(),
                    Text(
                      "Voiture B",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imageVoitureAvB != null
                          ? Image.memory(
                              widget.pdfConstatModel.imageVoitureAvB!)
                          : const Text('No Image'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imageVoitureAvDB != null
                          ? Image.memory(
                              widget.pdfConstatModel.imageVoitureAvDB!)
                          : const Text('No Image'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imageVoitureDB != null
                          ? Image.memory(widget.pdfConstatModel.imageVoitureDB!)
                          : const Text('No Image'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imageVoitureDerDB != null
                          ? Image.memory(
                              widget.pdfConstatModel.imageVoitureDerDB!)
                          : const Text('No Image'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imageVoitureDerB != null
                          ? Image.memory(
                              widget.pdfConstatModel.imageVoitureDerB!)
                          : const Text('No Image'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imageVoitureDerDB != null
                          ? Image.memory(
                              widget.pdfConstatModel.imageVoitureDerDB!)
                          : const Text('No Image'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imageVoitureDerGB != null
                          ? Image.memory(
                              widget.pdfConstatModel.imageVoitureDerGB!)
                          : const Text('No Image'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imageVoitureGB != null
                          ? Image.memory(widget.pdfConstatModel.imageVoitureGB!)
                          : const Text('No Image'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: widget.pdfConstatModel.imageVoitureAvGB != null
                          ? Image.memory(
                              widget.pdfConstatModel.imageVoitureAvGB!)
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
                    widget.constatNotifier.value = ConstatState(
                        declaration: true,
                        vehA: true,
                        vehB: true,
                        croquis: true,
                        nbVoiture: widget.constatNotifier.value.nbVoiture);
                    Navigator.pushNamed(context, '/croquis',
                        arguments: widget.pdfConstatModel);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Text(
                      "Valider vehicule B",
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
