import 'package:allo_constat_frontend/screens/home/components/pdf_viewer_page.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../models/constat_collection_model.dart';
import '../../../theme/constants.dart';
import '../../../config.dart';

class ConstatComponent extends StatelessWidget {
  const ConstatComponent({
    super.key,
    this.constatCollection,
  });
  final ConstatCollectionModel? constatCollection;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        String pdfurl = url + constatCollection!.pdfUrls!['duplicata']!;
        print("duplicata= ${pdfurl}");
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PdfViewerPage(pdfUrl: pdfurl),
          ),
        );
      },
      onLongPress: () {
        //print("code qr = ${constatCollection!.id.toString()}");
        showDialog(
          context: context,
          builder: (content) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return AlertDialog(
                  title: const Text("Voici le code QR de ce constat"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (constatCollection != null &&
                          constatCollection!.id != null)
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: QrImageView(
                            data: constatCollection!.id.toString(),
                            version: QrVersions.auto,
                          ),
                        ),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(4.0, 4.0),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset("assets/images/pdf_image.png"),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headlineMedium!,
                      children: <TextSpan>[
                        const TextSpan(
                          text: "Matricule A : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: constatCollection!.matriculeA,
                          style: const TextStyle(
                            color: kDarkGreeyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  constatCollection!.nbrVehicles == 2
                      ? RichText(
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            style: Theme.of(context).textTheme.headlineMedium!,
                            children: <TextSpan>[
                              const TextSpan(
                                text: "Matricule B : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: constatCollection!.matriculeB,
                                style: const TextStyle(
                                  color: kDarkGreeyColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  RichText(
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headlineMedium!,
                      children: <TextSpan>[
                        const TextSpan(
                          text: "Date : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: constatCollection!.timestamp,
                          style: const TextStyle(
                            color: kDarkGreeyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headlineMedium!,
                      children: <TextSpan>[
                        const TextSpan(
                          text: "Region : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: constatCollection!.region,
                          style: const TextStyle(
                            color: kDarkGreeyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headlineMedium!,
                      children: <TextSpan>[
                        const TextSpan(
                          text: "Lieu : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: constatCollection!.region,
                          style: const TextStyle(
                            color: kDarkGreeyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
