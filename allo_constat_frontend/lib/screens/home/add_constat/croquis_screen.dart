import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../../../controllers/constat_controller.dart';
import '../../../models/constat_state_model.dart';
import '../../../models/pdf_constat_model.dart';
import '../../../models/user_model.dart';
import '../../../theme/constants.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;

class CroquisScreen extends StatefulWidget {
  const CroquisScreen({
    super.key,
    required this.constatNotifier,
    required this.pdfConstatModel,
    required this.usr,
  });
  final ValueNotifier<ConstatState> constatNotifier;
  final PDFConstatModel pdfConstatModel;
  final UserModel? usr;

  @override
  State<CroquisScreen> createState() => _CroquisScreenState();
}

class _CroquisScreenState extends State<CroquisScreen> {
  final controller = Get.put(ConstatController());

  late Uint8List imageCroquis;
  GlobalKey globalKey = GlobalKey();
  final _strokes = <Path>[];
  var _strokesHistory = <Path>[];
  bool _isLoading = false;

  void _startStroke(double x, double y) {
    _strokes.add(Path()..moveTo(x, y));
    _strokesHistory = List.of(_strokes);
  }

  void _moveStroke(double x, double y) {
    setState(() {
      _strokes.last.lineTo(x, y);
      _strokesHistory = List.of(_strokes);
    });
  }

  Future<Uint8List> generateImage() async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();

    // Define the new dimensions (rotated, so width becomes height and vice versa)
    const int width = 100;
    const int height = 700;

    // Create a new image with the desired size
    ui.PictureRecorder recorder = ui.PictureRecorder();
    Canvas canvas = Canvas(
        recorder,
        Rect.fromPoints(
            const Offset(0, 0), Offset(height.toDouble(), width.toDouble())));

    // Apply a 90-degree rotation (pi/2 radians) around the top-left corner
    canvas.translate(height.toDouble(), 0); // Move canvas origin to the right
    canvas.rotate(1.5708); // Rotate canvas by 90 degrees (pi/2 radians)

    // Draw the original image onto the rotated canvas
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()),
      Paint(),
    );

    ui.Image rotatedImage =
        await recorder.endRecording().toImage(height, width);

    ByteData? byteData =
        await rotatedImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    return pngBytes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: const BoxDecoration(
                    color: kGreenColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      "14",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text("Croquis de l'accident",
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              color: kDarkBlueColor,
                              fontWeight: FontWeight.bold)),
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  child: FloatingActionButton(
                    backgroundColor: kGreenColor,
                    heroTag: "Undo",
                    onPressed: () {
                      if (_strokes.isNotEmpty && _strokesHistory.isNotEmpty) {
                        setState(() {
                          _strokes.removeLast();
                        });
                      }
                    },
                    child: const Icon(Icons.undo, color: kWhiteColor),
                  ),
                ),
                const SizedBox(width: 15),
                SizedBox(
                  height: 30,
                  child: FloatingActionButton(
                    backgroundColor: kGreenColor,
                    heroTag: "Redo",
                    onPressed: () {
                      setState(() {
                        if (_strokes.length < _strokesHistory.length) {
                          final index = _strokes.length;
                          _strokes.add(_strokesHistory[index]);
                        }
                      });
                    },
                    child: const Icon(Icons.redo, color: kWhiteColor),
                  ),
                ),
              ],
            ),
          ),
          RepaintBoundary(
            key: globalKey,
            child: GestureDetector(
              onPanStart: (details) {},
              onPanDown: (details) => _startStroke(
                details.localPosition.dx,
                details.localPosition.dy,
              ),
              onPanUpdate: (details) => _moveStroke(
                details.localPosition.dx,
                details.localPosition.dy,
              ),
              child: Container(
                //color: Colors.grey,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/croquis.png",
                      ),
                      fit: BoxFit.fill),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.55,
                child: CustomPaint(
                  painter: DrawingPainter(_strokes),
                ),
              ),
            ),
          ),
          const Spacer(),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 50),
                    backgroundColor: kGreenColor,
                  ),
                  onPressed: () {
                    widget.constatNotifier.value = ConstatState(
                      nbVoiture: widget.pdfConstatModel.nbVoiture!,
                      declaration: true,
                      vehA: true,
                      vehB:
                          widget.pdfConstatModel.nbVoiture == 1 ? false : true,
                      croquis: false,
                    );
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
                    minimumSize: const Size(150, 50),
                    backgroundColor: kGreenColor,
                  ),
                  onPressed: _isLoading ? null : _validerConstat,
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : Text(
                          "Valider constat",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: kWhiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _validerConstat() async {
    setState(() {
      _isLoading = true;
    });
    imageCroquis = await generateImage();
    widget.pdfConstatModel.imageCroquis = imageCroquis;
    int status = await controller.createConstatController(
        widget.pdfConstatModel, widget.usr!.id.toString());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              Text(status == 200 || status == 201
                  ? "Constat généré avec succès"
                  : "Problème de connexion"),
            ],
          ),
        ),
      ),
    );
    setState(() {
      _isLoading = false;
    });
  }
}

class DrawingPainter extends CustomPainter {
  final List<Path> strokes;

  DrawingPainter(this.strokes);
  @override
  void paint(Canvas canvas, Size size) {
    for (final stroke in strokes) {
      final paint = Paint()
        ..strokeWidth = 5
        ..color = Colors.teal
        ..style = PaintingStyle.stroke;

      canvas.drawPath(stroke, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
