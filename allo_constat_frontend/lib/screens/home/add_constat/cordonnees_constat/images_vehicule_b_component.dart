import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import '../../../../models/constat_state_model.dart';
import '../../../../models/pdf_constat_model.dart';
import '../../../../theme/constants.dart';
import '../../components/title_constat.dart';

class ImagesVehiculeBComponent extends StatefulWidget {
  final ValueNotifier<ConstatState> constatNotifier;
  final PDFConstatModel pdfConstatModel;
  const ImagesVehiculeBComponent({
    required GlobalKey<ImagesVehiculeBComponentState> key,
    required this.constatNotifier,
    required this.pdfConstatModel,
  }) : super(key: key);

  @override
  State<ImagesVehiculeBComponent> createState() =>
      ImagesVehiculeBComponentState();
}

class ImagesVehiculeBComponentState extends State<ImagesVehiculeBComponent> {
  Uint8List? _imageVehAvant;
  Uint8List? _imageVehAvantDroit;
  Uint8List? _imageVehAvantGauche;
  Uint8List? _imageVehDroit;
  Uint8List? _imageVehGauche;
  Uint8List? _imageVehDerriere;
  Uint8List? _imageVehDerriereDroit;
  Uint8List? _imageVehDerriereGauche;
  final ImagePicker _imagePicker = ImagePicker();

  Future<File?> getImage() async {
    File? pickedImage;
    final result = await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
      maxHeight: 500,
      maxWidth: 500,
    );
    if (result != null) {
      setState(() {
        pickedImage = File(result.path);
      });

      return convertImageToPng(pickedImage!);
    }
    return null;
  }

  Future<File?> convertImageToPng(File jpegImage) async {
    try {
      final bytes = await jpegImage.readAsBytes();
      final image = img.decodeImage(Uint8List.fromList(bytes));

      if (image == null) {
        return null;
      }

      final pngBytes = img.encodePng(image);
      final pngFile = File(jpegImage.path.replaceAll('.jpg', '.png'));
      await pngFile.writeAsBytes(pngBytes);

      return pngFile;
    } catch (e) {
      return null;
    }
  }

  Future<void> remplir() async {
    widget.pdfConstatModel.imageVoitureAvB = _imageVehAvant;
    widget.pdfConstatModel.imageVoitureAvDB = _imageVehAvantDroit;
    widget.pdfConstatModel.imageVoitureAvGB = _imageVehAvantGauche;
    widget.pdfConstatModel.imageVoitureDB = _imageVehDroit;
    widget.pdfConstatModel.imageVoitureGB = _imageVehGauche;
    widget.pdfConstatModel.imageVoitureDerB = _imageVehDerriere;
    widget.pdfConstatModel.imageVoitureDerDB = _imageVehDerriereDroit;
    widget.pdfConstatModel.imageVoitureDerGB = _imageVehDerriereGauche;
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
            const TitleConstat(nb: "17", title: "Vehicule B"),
            Text(
              "Veuillez prendre des photos claires de votre véhicule",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: kDarkBlueColor, fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Center(
              child: InkWell(
                onTap: () async {
                  File? img = await getImage();
                  if (img != null) {
                    Uint8List imageBytes = await img.readAsBytes();
                    setState(() {
                      _imageVehAvantGauche = imageBytes;
                    });
                  }
                },
                child: Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _imageVehAvantGauche != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              _imageVehAvantGauche!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Center(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: SvgPicture.asset(
                                      "assets/images/veh_avant_gauche_image.svg",
                                      // color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "Rajouter image avant gauche de votre vehicule",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            color: kDarkBlueColor,
                                            fontWeight: FontWeight.normal),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          )),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: InkWell(
                onTap: () async {
                  File? img = await getImage();
                  if (img != null) {
                    Uint8List imageBytes = await img.readAsBytes();
                    setState(() {
                      _imageVehAvant = imageBytes;
                    });
                  }
                },
                child: Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _imageVehAvant != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              _imageVehAvant!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Center(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  /*  Icon(Icons.add_photo_alternate_outlined,
                                        size: 30),*/
                                  Expanded(
                                    child: SvgPicture.asset(
                                      "assets/images/veh_avant_image.svg",
                                      //color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "Rajouter image avant de votre vehicule",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            color: kDarkBlueColor,
                                            fontWeight: FontWeight.normal),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          )),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: InkWell(
                onTap: () async {
                  File? img = await getImage();
                  if (img != null) {
                    Uint8List imageBytes = await img.readAsBytes();
                    setState(() {
                      _imageVehAvantDroit = imageBytes;
                    });
                  }
                },
                child: Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _imageVehAvantDroit != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              _imageVehAvantDroit!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Center(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  /*  Icon(Icons.add_photo_alternate_outlined,
                                        size: 30),*/
                                  Expanded(
                                    child: SvgPicture.asset(
                                      "assets/images/veh_avant_droit_image.svg",
                                      // color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "Rajouter image avant droit de votre vehicule",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            color: kDarkBlueColor,
                                            fontWeight: FontWeight.normal),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          )),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: InkWell(
                onTap: () async {
                  File? img = await getImage();
                  if (img != null) {
                    Uint8List imageBytes = await img.readAsBytes();
                    setState(() {
                      _imageVehDroit = imageBytes;
                    });
                  }
                },
                child: Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _imageVehDroit != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              _imageVehDroit!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Center(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  /*  Icon(Icons.add_photo_alternate_outlined,
                                        size: 30),*/
                                  Expanded(
                                    child: SvgPicture.asset(
                                      "assets/images/veh_droit_image.svg",
                                      // color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "Rajouter image cotée droite de votre vehicule",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            color: kDarkBlueColor,
                                            fontWeight: FontWeight.normal),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          )),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: InkWell(
                onTap: () async {
                  File? img = await getImage();
                  if (img != null) {
                    Uint8List imageBytes = await img.readAsBytes();
                    setState(() {
                      _imageVehDerriereDroit = imageBytes;
                    });
                  }
                },
                child: Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _imageVehDerriereDroit != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              _imageVehDerriereDroit!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Center(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: SvgPicture.asset(
                                      "assets/images/veh_derriere_droit_image.svg",
                                      //color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "Rajouter image derriere droit de votre vehicule",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            color: kDarkBlueColor,
                                            fontWeight: FontWeight.normal),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          )),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: InkWell(
                onTap: () async {
                  File? img = await getImage();
                  if (img != null) {
                    Uint8List imageBytes = await img.readAsBytes();
                    setState(() {
                      _imageVehDerriere = imageBytes;
                    });
                  }
                },
                child: Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _imageVehDerriere != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              _imageVehDerriere!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Center(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: SvgPicture.asset(
                                      "assets/images/veh_derriere_image.svg",
                                      // color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "Rajouter image derriere de votre vehicule",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            color: kDarkBlueColor,
                                            fontWeight: FontWeight.normal),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          )),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: InkWell(
                onTap: () async {
                  File? img = await getImage();
                  if (img != null) {
                    Uint8List imageBytes = await img.readAsBytes();
                    setState(() {
                      _imageVehDerriereGauche = imageBytes;
                    });
                  }
                },
                child: Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _imageVehDerriereGauche != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              _imageVehDerriereGauche!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Center(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  /*  Icon(Icons.add_photo_alternate_outlined,
                                        size: 30),*/
                                  Expanded(
                                    child: SvgPicture.asset(
                                      "assets/images/veh_derriere_gauche_image.svg",
                                      //color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "Rajouter image derriere gauche de votre vehicule",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            color: kDarkBlueColor,
                                            fontWeight: FontWeight.normal),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          )),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: InkWell(
                onTap: () async {
                  File? img = await getImage();
                  if (img != null) {
                    Uint8List imageBytes = await img.readAsBytes();
                    setState(() {
                      _imageVehGauche = imageBytes;
                    });
                  }
                },
                child: Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _imageVehGauche != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              _imageVehGauche!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Center(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: SvgPicture.asset(
                                      "assets/images/veh_gauche_image.svg",
                                      // color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "Rajouter image de coté gauche de votre vehicule",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            color: kDarkBlueColor,
                                            fontWeight: FontWeight.normal),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
