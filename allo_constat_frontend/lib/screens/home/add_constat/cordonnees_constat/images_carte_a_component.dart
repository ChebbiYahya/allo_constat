import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import '../../../../models/constat_state_model.dart';
import '../../../../models/pdf_constat_model.dart';
import '../../../../theme/constants.dart';
import '../../components/title_constat.dart';

class ImagesCarteAComponent extends StatefulWidget {
  final ValueNotifier<ConstatState> constatNotifier;
  final PDFConstatModel pdfConstatModel;
  const ImagesCarteAComponent({
    required GlobalKey<ImagesCarteAComponentState> key,
    required this.constatNotifier,
    required this.pdfConstatModel,
  }) : super(key: key);

  @override
  State<ImagesCarteAComponent> createState() => ImagesCarteAComponentState();
}

class ImagesCarteAComponentState extends State<ImagesCarteAComponent> {
  Uint8List? _imageCartegrisePhase;
  Uint8List? _imageCartegriseVerso;
  Uint8List? _imagePermisPhase;
  Uint8List? _imagePermisVerso;
  Uint8List? _imageAssurance;
  //File? _imageTest;

  final ImagePicker _imagePicker = ImagePicker();

  Future<File?> getImage() async {
    File? pickedImage;
    final result = await _imagePicker.pickImage(
      source: ImageSource.camera,
      //imageQuality: 50,
      imageQuality: 100,
      maxHeight: 500,
      maxWidth: 500,
    );
    if (result != null) {
      setState(() {
        pickedImage = File(result.path);
      });

      return await convertImageToPng(pickedImage!);
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
    widget.pdfConstatModel.imageCarteGriseRectoA = _imageCartegrisePhase;
    widget.pdfConstatModel.imageCarteGriseVersoA = _imageCartegriseVerso;
    widget.pdfConstatModel.imageAssuranceA = _imageAssurance;
    widget.pdfConstatModel.imagePermisRectoA = _imagePermisPhase;
    widget.pdfConstatModel.imagePermisVersoA = _imagePermisVerso;
  }

  bool validateForm() {
    remplir();
    return true;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TitleConstat(nb: "14", title: "Carte grise"),
            const SizedBox(height: 10),
            Center(
              child: InkWell(
                onTap: () async {
                  File? img = await getImage();
                  if (img != null) {
                    Uint8List imageBytes = await img.readAsBytes();
                    setState(() {
                      _imageCartegrisePhase = imageBytes;
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
                    child: _imageCartegrisePhase != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              _imageCartegrisePhase!,
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
                                    "assets/images/carte_grise.svg",
                                    //color: Colors.grey,
                                  )),
                                  Text(
                                    "Rajouter Face Recto du carte grise",
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
                      _imageCartegriseVerso = imageBytes;
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
                    child: _imageCartegriseVerso != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              _imageCartegriseVerso!,
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
                                    "assets/images/carte_grise.svg",
                                    //color: Colors.grey,
                                  )),
                                  Text(
                                    "Rajouter Face Verso du carte grise",
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
            const Divider(),
            const TitleConstat(nb: "15", title: "Assurance"),
            const SizedBox(height: 10),
            Center(
              child: InkWell(
                onTap: () async {
                  File? img = await getImage();
                  if (img != null) {
                    Uint8List imageBytes = await img.readAsBytes();
                    setState(() {
                      _imageAssurance = imageBytes;
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
                    child: _imageAssurance != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              _imageAssurance!,
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
                                    "assets/images/assurance_image.svg",
                                    //color: Colors.grey,
                                  )),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Rajouter Face Recto du carte grise",
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
            const Divider(),
            const TitleConstat(nb: "16", title: "Permis de conduire"),
            const SizedBox(height: 10),
            Center(
              child: InkWell(
                onTap: () async {
                  File? img = await getImage();
                  if (img != null) {
                    Uint8List imageBytes = await img.readAsBytes();
                    setState(() {
                      _imagePermisPhase = imageBytes;
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
                    child: _imagePermisPhase != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              _imagePermisPhase!,
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
                                    "assets/images/permis_phase_image.svg",
                                    //color: Colors.grey,
                                  )),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Rajouter Face Recto du permis",
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
                      _imagePermisVerso = imageBytes;
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
                  child: _imagePermisVerso != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.memory(
                            _imagePermisVerso!,
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
                                  "assets/images/permis_verso_image.svg",
                                  //color: Colors.grey,
                                )),
                                const SizedBox(height: 10),
                                Text(
                                  "Rajouter Face Verso du permis",
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
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
