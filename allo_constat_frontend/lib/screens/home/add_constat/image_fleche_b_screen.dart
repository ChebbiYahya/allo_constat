import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../models/constat_state_model.dart';
import '../../../models/pdf_constat_model.dart';
import '../../../theme/constants.dart';
import '../components/title_constat.dart';

class ImageFlecheBScreen extends StatefulWidget {
  final ValueNotifier<ConstatState> constatNotifier;
  final PDFConstatModel pdfConstatModel;
  const ImageFlecheBScreen({
    super.key,
    required this.constatNotifier,
    required this.pdfConstatModel,
  });

  @override
  State<ImageFlecheBScreen> createState() => _ImageFlecheBScreenState();
}

class _ImageFlecheBScreenState extends State<ImageFlecheBScreen> {
  late Uint8List imageFlecheB;
  GlobalKey globalKey = GlobalKey();
  final _strokes = <Path>[];
  var _strokesHistory = <Path>[];

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

  generateImage() async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    return pngBytes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const TitleConstat(
                nb: "18",
                title: "Indiquer par une flèche \n le point de choc initial"),
            RepaintBoundary(
              key: globalKey,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/chocInitialImageB.png",
                    ),
                  ),
                  GestureDetector(
                    onPanStart: (details) {},
                    onPanDown: (details) => _startStroke(
                      details.localPosition.dx,
                      details.localPosition.dy,
                    ),
                    onPanUpdate: (details) => _moveStroke(
                      details.localPosition.dx,
                      details.localPosition.dy,
                    ),
                    child: SizedBox(
                      height: 300,
                      width: 300,
                      child: CustomPaint(
                        painter: DrawingPainter(_strokes),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    backgroundColor: kGreenColor,
                    heroTag: "Undo",
                    onPressed: () {
                      if (_strokes.isNotEmpty && _strokesHistory.isNotEmpty) {
                        setState(() {
                          _strokes.removeLast();
                        });
                      }
                    },
                    child: const Icon(Icons.undo, color: Colors.white),
                  ),
                  const SizedBox(width: 15),
                  FloatingActionButton(
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
                    child: const Icon(Icons.redo, color: Colors.white),
                  ),
                ],
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
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Retour",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                    onPressed: () async {
                      imageFlecheB = await generateImage();
                      widget.pdfConstatModel.imageFlecheB = imageFlecheB;

                      Navigator.pushNamed(context, '/resumeB',
                          arguments: widget.pdfConstatModel);
                    },
                    child: Text(
                      "Suivant",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<Path> strokes;

  DrawingPainter(this.strokes);
  @override
  void paint(Canvas canvas, Size size) {
    for (final stroke in strokes) {
      final paint = Paint()
        ..strokeWidth = 4
        ..color = Colors.red
        ..style = PaintingStyle.stroke;

      canvas.drawPath(stroke, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
