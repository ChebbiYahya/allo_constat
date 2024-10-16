import 'dart:io';
import 'dart:typed_data';

class PDFConstatModel {
  String? id;
  String? dateAccident;
  String? lieuAccident;
  String? regionAccident;
  String? heureAccident;
  String? temoin;
  bool? blesses;
  bool? degatMateriels;

  // Vehicule A
  String? vehiculeAssureParA;
  String? policeAssuranceA;
  String? agenceA;
  String? attestationValableDeA;
  String? attestationValableAuA;
  // Identité du conducteur A
  String? nomConducteurA;
  String? prenomConducteurA;
  String? adresseConducteurA;
  String? permisConduireConducteurA;
  String? delivreConducteurA;
  // Assuré A
  String? nomAssureA;
  String? prenomAssureA;
  String? adresseAssureA;
  String? telephoneAssureA;
  // Identité véhicule A
  String? marqueVehiculeA;
  String? numImmatriculationVehiculeA;
  String? venantDeVehiculeA;
  String? allantAVehiculeA;
  // Dégâts apparents véhicule A
  String? degatApparentsVehiculeA;
  // Observations véhicule A
  String? observationVehiculeA;

  // Vehicule B
  String? vehiculeAssureParB;
  String? policeAssuranceB;
  String? agenceB;
  String? attestationValableDeB;
  String? attestationValableAuB;
  // Identité du conducteur B
  String? nomConducteurB;
  String? prenomConducteurB;
  String? adresseConducteurB;
  String? permisConduireConducteurB;
  String? delivreConducteurB;
  // Assuré B
  String? nomAssureB;
  String? prenomAssureB;
  String? adresseAssureB;
  String? telephoneAssureB;
  // Identité véhicule B
  String? marqueVehiculeB;
  String? numImmatriculationVehiculeB;
  String? venantDeVehiculeB;
  String? allantAVehiculeB;
  // Dégâts apparents véhicule B
  String? degatApparentsVehiculeB;
  // Observations véhicule B
  String? observationVehiculeB;

  // Circonstances A
  bool? enStationnementA;
  bool? quittaitA;
  bool? prenaitA;
  bool? sortaitA;
  bool? engageaitA;
  bool? arretA;
  bool? frottementA;
  bool? heurtaitA;
  bool? roulaitA;
  bool? changeaitA;
  bool? doublaitA;
  bool? viraitDroitA;
  bool? viraitGaucheA;
  bool? reculaitA;
  bool? reserveeA;
  bool? venaitA;
  bool? navaitA;

  // Circonstances B
  bool? enStationnementB;
  bool? quittaitB;
  bool? prenaitB;
  bool? sortaitB;
  bool? engageaitB;
  bool? arretB;
  bool? frottementB;
  bool? heurtaitB;
  bool? roulaitB;
  bool? changeaitB;
  bool? doublaitB;
  bool? viraitDroitB;
  bool? viraitGaucheB;
  bool? reculaitB;
  bool? reserveeB;
  bool? venaitB;
  bool? navaitB;

  // Nombre de circonstances
  int? nbCirconstancesA;
  int? nbCirconstancesB;
  int? nbVoiture;
  String? emailA;
  String? emailB;

  // Images
  //File? imageTest;
  // Image flèche
  Uint8List? imageFlecheA;
  Uint8List? imageFlecheB;
  Uint8List? imageCroquis;
  //image voiture A
  Uint8List? imagePermisRectoA;
  Uint8List? imagePermisVersoA;
  Uint8List? imageCarteGriseRectoA;
  Uint8List? imageCarteGriseVersoA;
  Uint8List? imageAssuranceA;

  Uint8List? imageVoitureAvA;
  Uint8List? imageVoitureAvGA;
  Uint8List? imageVoitureAvDA;
  Uint8List? imageVoitureGA;
  Uint8List? imageVoitureDA;
  Uint8List? imageVoitureDerA;
  Uint8List? imageVoitureDerGA;
  Uint8List? imageVoitureDerDA;
  //image voiture B
  Uint8List? imagePermisRectoB;
  Uint8List? imagePermisVersoB;
  Uint8List? imageCarteGriseRectoB;
  Uint8List? imageCarteGriseVersoB;
  Uint8List? imageAssuranceB;
  Uint8List? imageVoitureAvB;
  Uint8List? imageVoitureAvGB;
  Uint8List? imageVoitureAvDB;
  Uint8List? imageVoitureGB;
  Uint8List? imageVoitureDB;
  Uint8List? imageVoitureDerB;
  Uint8List? imageVoitureDerGB;
  Uint8List? imageVoitureDerDB;

  PDFConstatModel({
    this.id,
    this.dateAccident,
    this.lieuAccident,
    this.regionAccident,
    this.heureAccident,
    this.temoin,
    this.blesses,
    this.degatMateriels,
    this.vehiculeAssureParA,
    this.policeAssuranceA,
    this.agenceA,
    this.attestationValableDeA,
    this.attestationValableAuA,
    this.nomConducteurA,
    this.prenomConducteurA,
    this.adresseConducteurA,
    this.permisConduireConducteurA,
    this.delivreConducteurA,
    this.nomAssureA,
    this.prenomAssureA,
    this.adresseAssureA,
    this.telephoneAssureA,
    this.marqueVehiculeA,
    this.numImmatriculationVehiculeA,
    this.venantDeVehiculeA,
    this.allantAVehiculeA,
    this.degatApparentsVehiculeA,
    this.observationVehiculeA,
    this.vehiculeAssureParB,
    this.policeAssuranceB,
    this.agenceB,
    this.attestationValableDeB,
    this.attestationValableAuB,
    this.nomConducteurB,
    this.prenomConducteurB,
    this.adresseConducteurB,
    this.permisConduireConducteurB,
    this.delivreConducteurB,
    this.nomAssureB,
    this.prenomAssureB,
    this.adresseAssureB,
    this.telephoneAssureB,
    this.marqueVehiculeB,
    this.numImmatriculationVehiculeB,
    this.venantDeVehiculeB,
    this.allantAVehiculeB,
    this.degatApparentsVehiculeB,
    this.observationVehiculeB,
    this.enStationnementA,
    this.quittaitA,
    this.prenaitA,
    this.sortaitA,
    this.engageaitA,
    this.arretA,
    this.frottementA,
    this.heurtaitA,
    this.roulaitA,
    this.changeaitA,
    this.doublaitA,
    this.viraitDroitA,
    this.viraitGaucheA,
    this.reculaitA,
    this.reserveeA,
    this.venaitA,
    this.navaitA,
    this.enStationnementB,
    this.quittaitB,
    this.prenaitB,
    this.sortaitB,
    this.engageaitB,
    this.arretB,
    this.frottementB,
    this.heurtaitB,
    this.roulaitB,
    this.changeaitB,
    this.doublaitB,
    this.viraitDroitB,
    this.viraitGaucheB,
    this.reculaitB,
    this.reserveeB,
    this.venaitB,
    this.navaitB,
    this.nbCirconstancesA,
    this.nbCirconstancesB,
    this.nbVoiture,
    this.emailA,
    this.emailB,
    this.imageFlecheA,
    this.imageFlecheB,
    this.imageCroquis,
    this.imagePermisRectoA,
    this.imagePermisVersoA,
    this.imageCarteGriseRectoA,
    this.imageCarteGriseVersoA,
    this.imageAssuranceA,
    this.imageVoitureAvA,
    this.imageVoitureAvGA,
    this.imageVoitureAvDA,
    this.imageVoitureGA,
    this.imageVoitureDA,
    this.imageVoitureDerA,
    this.imageVoitureDerGA,
    this.imageVoitureDerDA,
    //
    this.imagePermisRectoB,
    this.imagePermisVersoB,
    this.imageCarteGriseRectoB,
    this.imageCarteGriseVersoB,
    this.imageAssuranceB,
    this.imageVoitureAvB,
    this.imageVoitureAvGB,
    this.imageVoitureAvDB,
    this.imageVoitureGB,
    this.imageVoitureDB,
    this.imageVoitureDerB,
    this.imageVoitureDerGB,
    this.imageVoitureDerDB,
  });

  PDFConstatModel copyWith({
    String? id,
    String? dateAccident,
    String? lieuAccident,
    String? regionAccident,
    String? heureAccident,
    String? temoin,
    bool? blesses,
    bool? degatMateriels,
    String? vehiculeAssureParA,
    String? policeAssuranceA,
    String? agenceA,
    String? attestationValableDeA,
    String? attestationValableAuA,
    String? nomConducteurA,
    String? prenomConducteurA,
    String? adresseConducteurA,
    String? permisConduireConducteurA,
    String? delivreConducteurA,
    String? nomAssureA,
    String? prenomAssureA,
    String? adresseAssureA,
    String? telephoneAssureA,
    String? marqueVehiculeA,
    String? numImmatriculationVehiculeA,
    String? venantDeVehiculeA,
    String? allantAVehiculeA,
    String? degatApparentsVehiculeA,
    String? observationVehiculeA,
    String? vehiculeAssureParB,
    String? policeAssuranceB,
    String? agenceB,
    String? attestationValableDeB,
    String? attestationValableAuB,
    String? nomConducteurB,
    String? prenomConducteurB,
    String? adresseConducteurB,
    String? permisConduireConducteurB,
    String? delivreConducteurB,
    String? nomAssureB,
    String? prenomAssureB,
    String? adresseAssureB,
    String? telephoneAssureB,
    String? marqueVehiculeB,
    String? numImmatriculationVehiculeB,
    String? venantDeVehiculeB,
    String? allantAVehiculeB,
    String? degatApparentsVehiculeB,
    String? observationVehiculeB,
    bool? enStationnementA,
    bool? quittaitA,
    bool? prenaitA,
    bool? sortaitA,
    bool? engageaitA,
    bool? arretA,
    bool? frottementA,
    bool? heurtaitA,
    bool? roulaitA,
    bool? changeaitA,
    bool? doublaitA,
    bool? viraitDroitA,
    bool? viraitGaucheA,
    bool? reculaitA,
    bool? reserveeA,
    bool? venaitA,
    bool? navaitA,
    bool? enStationnementB,
    bool? quittaitB,
    bool? prenaitB,
    bool? sortaitB,
    bool? engageaitB,
    bool? arretB,
    bool? frottementB,
    bool? heurtaitB,
    bool? roulaitB,
    bool? changeaitB,
    bool? doublaitB,
    bool? viraitDroitB,
    bool? viraitGaucheB,
    bool? reculaitB,
    bool? reserveeB,
    bool? venaitB,
    bool? navaitB,
    int? nbCirconstancesA,
    int? nbCirconstancesB,
    int? nbVoiture,
    String? emailA,
    String? emailB,
    Uint8List? imageFlecheA,
    Uint8List? imageFlecheB,
    Uint8List? imageCroquis,
    //image A
    Uint8List? imagePermisRectoA,
    Uint8List? imagePermisVersoA,
    Uint8List? imageCarteGriseRectoA,
    Uint8List? imageCarteGriseVersoA,
    Uint8List? imageAssuranceA,
    Uint8List? imageVoitureAvA,
    Uint8List? imageVoitureAvGA,
    Uint8List? imageVoitureAvDA,
    Uint8List? imageVoitureGA,
    Uint8List? imageVoitureDA,
    Uint8List? imageVoitureDerA,
    Uint8List? imageVoitureDerGA,
    Uint8List? imageVoitureDerDA,
    //image B
    Uint8List? imagePermisRectoB,
    Uint8List? imagePermisVersoB,
    Uint8List? imageCarteGriseRectoB,
    Uint8List? imageCarteGriseVersoB,
    Uint8List? imageAssuranceB,
    Uint8List? imageVoitureAvB,
    Uint8List? imageVoitureAvGB,
    Uint8List? imageVoitureAvDB,
    Uint8List? imageVoitureGB,
    Uint8List? imageVoitureDB,
    Uint8List? imageVoitureDerB,
    Uint8List? imageVoitureDerGB,
    Uint8List? imageVoitureDerDB,
  }) {
    return PDFConstatModel(
      id: id ?? this.id,
      dateAccident: dateAccident ?? this.dateAccident,
      lieuAccident: lieuAccident ?? this.lieuAccident,
      regionAccident: regionAccident ?? this.regionAccident,
      heureAccident: heureAccident ?? this.heureAccident,
      temoin: temoin ?? this.temoin,
      blesses: blesses ?? this.blesses,
      degatMateriels: degatMateriels ?? this.degatMateriels,
      vehiculeAssureParA: vehiculeAssureParA ?? this.vehiculeAssureParA,
      policeAssuranceA: policeAssuranceA ?? this.policeAssuranceA,
      agenceA: agenceA ?? this.agenceA,
      attestationValableDeA:
          attestationValableDeA ?? this.attestationValableDeA,
      attestationValableAuA:
          attestationValableAuA ?? this.attestationValableAuA,
      nomConducteurA: nomConducteurA ?? this.nomConducteurA,
      prenomConducteurA: prenomConducteurA ?? this.prenomConducteurA,
      adresseConducteurA: adresseConducteurA ?? this.adresseConducteurA,
      permisConduireConducteurA:
          permisConduireConducteurA ?? this.permisConduireConducteurA,
      delivreConducteurA: delivreConducteurA ?? this.delivreConducteurA,
      nomAssureA: nomAssureA ?? this.nomAssureA,
      prenomAssureA: prenomAssureA ?? this.prenomAssureA,
      adresseAssureA: adresseAssureA ?? this.adresseAssureA,
      telephoneAssureA: telephoneAssureA ?? this.telephoneAssureA,
      marqueVehiculeA: marqueVehiculeA ?? this.marqueVehiculeA,
      numImmatriculationVehiculeA:
          numImmatriculationVehiculeA ?? this.numImmatriculationVehiculeA,
      venantDeVehiculeA: venantDeVehiculeA ?? this.venantDeVehiculeA,
      allantAVehiculeA: allantAVehiculeA ?? this.allantAVehiculeA,
      degatApparentsVehiculeA:
          degatApparentsVehiculeA ?? this.degatApparentsVehiculeA,
      observationVehiculeA: observationVehiculeA ?? this.observationVehiculeA,
      vehiculeAssureParB: vehiculeAssureParB ?? this.vehiculeAssureParB,
      policeAssuranceB: policeAssuranceB ?? this.policeAssuranceB,
      agenceB: agenceB ?? this.agenceB,
      attestationValableDeB:
          attestationValableDeB ?? this.attestationValableDeB,
      attestationValableAuB:
          attestationValableAuB ?? this.attestationValableAuB,
      nomConducteurB: nomConducteurB ?? this.nomConducteurB,
      prenomConducteurB: prenomConducteurB ?? this.prenomConducteurB,
      adresseConducteurB: adresseConducteurB ?? this.adresseConducteurB,
      permisConduireConducteurB:
          permisConduireConducteurB ?? this.permisConduireConducteurB,
      delivreConducteurB: delivreConducteurB ?? this.delivreConducteurB,
      nomAssureB: nomAssureB ?? this.nomAssureB,
      prenomAssureB: prenomAssureB ?? this.prenomAssureB,
      adresseAssureB: adresseAssureB ?? this.adresseAssureB,
      telephoneAssureB: telephoneAssureB ?? this.telephoneAssureB,
      marqueVehiculeB: marqueVehiculeB ?? this.marqueVehiculeB,
      numImmatriculationVehiculeB:
          numImmatriculationVehiculeB ?? this.numImmatriculationVehiculeB,
      venantDeVehiculeB: venantDeVehiculeB ?? this.venantDeVehiculeB,
      allantAVehiculeB: allantAVehiculeB ?? this.allantAVehiculeB,
      degatApparentsVehiculeB:
          degatApparentsVehiculeB ?? this.degatApparentsVehiculeB,
      observationVehiculeB: observationVehiculeB ?? this.observationVehiculeB,
      enStationnementA: enStationnementA ?? this.enStationnementA,
      quittaitA: quittaitA ?? this.quittaitA,
      prenaitA: prenaitA ?? this.prenaitA,
      sortaitA: sortaitA ?? this.sortaitA,
      engageaitA: engageaitA ?? this.engageaitA,
      arretA: arretA ?? this.arretA,
      frottementA: frottementA ?? this.frottementA,
      heurtaitA: heurtaitA ?? this.heurtaitA,
      roulaitA: roulaitA ?? this.roulaitA,
      changeaitA: changeaitA ?? this.changeaitA,
      doublaitA: doublaitA ?? this.doublaitA,
      viraitDroitA: viraitDroitA ?? this.viraitDroitA,
      viraitGaucheA: viraitGaucheA ?? this.viraitGaucheA,
      reculaitA: reculaitA ?? this.reculaitA,
      reserveeA: reserveeA ?? this.reserveeA,
      venaitA: venaitA ?? this.venaitA,
      navaitA: navaitA ?? this.navaitA,
      enStationnementB: enStationnementB ?? this.enStationnementB,
      quittaitB: quittaitB ?? this.quittaitB,
      prenaitB: prenaitB ?? this.prenaitB,
      sortaitB: sortaitB ?? this.sortaitB,
      engageaitB: engageaitB ?? this.engageaitB,
      arretB: arretB ?? this.arretB,
      frottementB: frottementB ?? this.frottementB,
      heurtaitB: heurtaitB ?? this.heurtaitB,
      roulaitB: roulaitB ?? this.roulaitB,
      changeaitB: changeaitB ?? this.changeaitB,
      doublaitB: doublaitB ?? this.doublaitB,
      viraitDroitB: viraitDroitB ?? this.viraitDroitB,
      viraitGaucheB: viraitGaucheB ?? this.viraitGaucheB,
      reculaitB: reculaitB ?? this.reculaitB,
      reserveeB: reserveeB ?? this.reserveeB,
      venaitB: venaitB ?? this.venaitB,
      navaitB: navaitB ?? this.navaitB,
      nbCirconstancesA: nbCirconstancesA ?? this.nbCirconstancesA,
      nbCirconstancesB: nbCirconstancesB ?? this.nbCirconstancesB,
      nbVoiture: nbVoiture ?? this.nbVoiture,
      emailA: emailA ?? this.emailA,
      emailB: emailB ?? this.emailB,
      imageFlecheA: imageFlecheA ?? this.imageFlecheA,
      imageFlecheB: imageFlecheB ?? this.imageFlecheB,
      imageCroquis: imageCroquis ?? this.imageCroquis,
      //image voiture A
      imagePermisRectoA: imagePermisRectoA ?? this.imagePermisRectoA,
      imagePermisVersoA: imagePermisVersoA ?? this.imagePermisVersoA,
      imageCarteGriseRectoA:
          imageCarteGriseRectoA ?? this.imageCarteGriseRectoA,
      imageCarteGriseVersoA:
          imageCarteGriseVersoA ?? this.imageCarteGriseVersoA,
      imageAssuranceA: imageAssuranceA ?? this.imageAssuranceA,
      imageVoitureAvA: imageVoitureAvA ?? this.imageVoitureAvA,
      imageVoitureAvGA: imageVoitureAvGA ?? this.imageVoitureAvGA,
      imageVoitureAvDA: imageVoitureAvDA ?? this.imageVoitureAvDA,
      imageVoitureGA: imageVoitureGA ?? this.imageVoitureGA,
      imageVoitureDA: imageVoitureDA ?? this.imageVoitureDA,
      imageVoitureDerA: imageVoitureDerA ?? this.imageVoitureDerA,
      imageVoitureDerGA: imageVoitureDerGA ?? this.imageVoitureDerGA,
      imageVoitureDerDA: imageVoitureDerDA ?? this.imageVoitureDerDA,
      //image voiture B
      imagePermisRectoB: imagePermisRectoB ?? this.imagePermisRectoB,
      imagePermisVersoB: imagePermisVersoB ?? this.imagePermisVersoB,
      imageCarteGriseRectoB:
          imageCarteGriseRectoB ?? this.imageCarteGriseRectoB,
      imageCarteGriseVersoB:
          imageCarteGriseVersoB ?? this.imageCarteGriseVersoB,
      imageAssuranceB: imageAssuranceB ?? this.imageAssuranceB,
      imageVoitureAvB: imageVoitureAvB ?? this.imageVoitureAvB,
      imageVoitureAvGB: imageVoitureAvGB ?? this.imageVoitureAvGB,
      imageVoitureAvDB: imageVoitureAvDB ?? this.imageVoitureAvDB,
      imageVoitureGB: imageVoitureGB ?? this.imageVoitureGB,
      imageVoitureDB: imageVoitureDB ?? this.imageVoitureDB,
      imageVoitureDerB: imageVoitureDerB ?? this.imageVoitureDerB,
      imageVoitureDerGB: imageVoitureDerGB ?? this.imageVoitureDerGB,
      imageVoitureDerDB: imageVoitureDerDB ?? this.imageVoitureDerDB,
    );
  }
}
