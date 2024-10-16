import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

import '../../../controllers/auth_controller.dart';
import '../../../models/user_model.dart';
import '../home_pages.dart';

class NavAddQrScreen extends StatefulWidget {
  const NavAddQrScreen({super.key, this.usr});
  final UserModel? usr;

  @override
  State<NavAddQrScreen> createState() => _NavAddQrScreenState();
}

class _NavAddQrScreenState extends State<NavAddQrScreen> {
  final controller = Get.put(AuthController());

  List<Barcode> barcodes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Scanner le QR du constat",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  MobileScanner(
                    controller: MobileScannerController(
                      detectionSpeed: DetectionSpeed.noDuplicates,
                      returnImage: true,
                    ),
                    onDetect: (capture) async {
                      setState(() {
                        barcodes = capture.barcodes;
                      });
                      final Uint8List? image = capture.image;

                      if (image != null) {
                       // print("code = ${barcodes.first.rawValue ?? ""}");
                        var resultat =
                            await controller.updateListConstatController(
                                widget.usr!.id.toString(),
                                barcodes.first.rawValue ?? "");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                children: [
                                  Text(resultat['message']),
                                ],
                              ),
                            ),
                          ),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePages(
                                  token: widget.usr!.token.toString())),
                        );
                      }
                    },
                  ),
                  QRScannerOverlay(
                    overlayColor: Colors.transparent,
                    scanAreaWidth: 300,
                    scanAreaHeight: 300,
                  )
                ],
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
