import 'package:flutter/material.dart';
import '../../../models/constat_state_model.dart';
import '../../../models/pdf_constat_model.dart';
import '../../../models/user_model.dart';
import '../../../theme/constants.dart';
import '../add_constat/croquis_screen.dart';
import '../add_constat/declaration_accident_screen.dart';
import '../add_constat/image_fleche_a_screen.dart';
import '../add_constat/image_fleche_b_screen.dart';
import '../add_constat/nb_voitures_screen.dart';
import '../add_constat/resume_a_screen.dart';
import '../add_constat/resume_b_screen.dart';
import '../add_constat/vehicule_a_screen.dart';
import '../add_constat/vehicule_b_screen.dart';

class NavAddConstatScreen extends StatefulWidget {
  const NavAddConstatScreen({super.key, this.usr});
  final UserModel? usr;

  @override
  State<NavAddConstatScreen> createState() => _NavAddConstatScreenState();
}

class _NavAddConstatScreenState extends State<NavAddConstatScreen> {
  late ValueNotifier<ConstatState> constatNotifier;

  @override
  void initState() {
    constatNotifier = ValueNotifier<ConstatState>(ConstatState());
    super.initState();
  }

  @override
  void dispose() {
    constatNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ValueListenableBuilder<ConstatState>(
              valueListenable: constatNotifier,
              builder: (context, state, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatusContainer(
                      "assets/images/declaration_image.png",
                      "DÉCLARATION",
                      state.declaration ? Colors.blue : kGreeyColor,
                    ),
                    _buildStatusContainer(
                      "assets/images/carA.png",
                      "VEHICULE A",
                      state.vehA ? Colors.blue : kGreeyColor,
                    ),
                    if (state.nbVoiture == 2)
                      _buildStatusContainer(
                        "assets/images/carB.png",
                        "VEHICULE B",
                        state.vehB ? Colors.blue : kGreeyColor,
                      ),
                    _buildStatusContainer(
                      "assets/images/car_accident_image.png",
                      "CROQUIS",
                      state.croquis ? Colors.blue : kGreeyColor,
                    ),
                  ],
                );
              }),
          Expanded(
            child: Navigator(
              onGenerateRoute: (RouteSettings settings) {
                PDFConstatModel pdfConstatModel = PDFConstatModel();
                if (settings.arguments != null &&
                    settings.arguments is PDFConstatModel) {
                  pdfConstatModel = settings.arguments as PDFConstatModel;
                }
                switch (settings.name) {
                  case '/':
                    return MaterialPageRoute(
                      builder: (context) => NbVoituresScreen(
                        constatNotifier: constatNotifier,
                        pdfConstatModel: pdfConstatModel,
                      ),
                    );
                  case '/declaration':
                    return _createRoute(
                      DeclarationAccidentScreen(
                        constatNotifier: constatNotifier,
                        pdfConstatModel: pdfConstatModel,
                      ),
                    );
                  case '/vehiculeA':
                    return _createRoute(
                      VehiculeAScreen(
                        constatNotifier: constatNotifier,
                        pdfConstatModel: pdfConstatModel,
                      ),
                    );
                  case '/vehiculeB':
                    return _createRoute(VehiculeBScreen(
                      constatNotifier: constatNotifier,
                      pdfConstatModel: pdfConstatModel,
                    ));
                  case '/imageFlecheA':
                    return _createRoute(ImageFlecheAScreen(
                      constatNotifier: constatNotifier,
                      pdfConstatModel: pdfConstatModel,
                    ));

                  case '/imageFlecheB':
                    return _createRoute(ImageFlecheBScreen(
                      constatNotifier: constatNotifier,
                      pdfConstatModel: pdfConstatModel,
                    ));
                  case '/resumeA':
                    return _createRoute(ResumeAScreen(
                      constatNotifier: constatNotifier,
                      pdfConstatModel: pdfConstatModel,
                    ));
                  case '/resumeB':
                    return _createRoute(ResumeBScreen(
                      constatNotifier: constatNotifier,
                      pdfConstatModel: pdfConstatModel,
                    ));

                  case '/croquis':
                    return _createRoute(CroquisScreen(
                      constatNotifier: constatNotifier,
                      pdfConstatModel: pdfConstatModel,
                      usr: widget.usr,
                      // usr: widget.usr,
                    ));
                  default:
                    return null;
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusContainer(String asset, String label, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Image.asset(
                asset,
                height: 20,
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: Text(label,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: kDarkGreeyColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
