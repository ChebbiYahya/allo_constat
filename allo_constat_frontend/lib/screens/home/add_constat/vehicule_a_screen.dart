import 'package:flutter/material.dart';

import '../../../models/constat_state_model.dart';
import '../../../models/pdf_constat_model.dart';
import '../../../theme/constants.dart';
import 'cordonnees_constat/assure_a_component.dart';
import 'cordonnees_constat/circonstance_a_component.dart';
import 'cordonnees_constat/degat_a_component.dart';
import 'cordonnees_constat/id_conducteur_a_component.dart';
import 'cordonnees_constat/id_vehicule_a_component.dart';
import 'cordonnees_constat/images_carte_a_component.dart';
import 'cordonnees_constat/images_vehicule_a_component.dart';
import 'cordonnees_constat/societe_assurance_a_component.dart';

class VehiculeAScreen extends StatefulWidget {
  final ValueNotifier<ConstatState> constatNotifier;
  final PDFConstatModel pdfConstatModel;
  const VehiculeAScreen({
    super.key,
    required this.pdfConstatModel,
    required this.constatNotifier,
  });

  @override
  State<VehiculeAScreen> createState() => _VehiculeAScreenState();
}

class _VehiculeAScreenState extends State<VehiculeAScreen> {
  int currentStep = 0;

  final GlobalKey<SocieteAssuranceAComponentState> step1Key =
      GlobalKey<SocieteAssuranceAComponentState>();
  final GlobalKey<IdConducteurAComponentState> step2Key =
      GlobalKey<IdConducteurAComponentState>();
  final GlobalKey<AssureAComponentState> step3Key =
      GlobalKey<AssureAComponentState>();
  final GlobalKey<IdVehiculeAComponentState> step4Key =
      GlobalKey<IdVehiculeAComponentState>();
  final GlobalKey<DegatAComponentState> step5Key =
      GlobalKey<DegatAComponentState>();
  final GlobalKey<CirconstanceAComponentState> step6Key =
      GlobalKey<CirconstanceAComponentState>();
  final GlobalKey<ImagesCarteAComponentState> step7Key =
      GlobalKey<ImagesCarteAComponentState>();
  final GlobalKey<ImagesVehiculeAComponentState> step8Key =
      GlobalKey<ImagesVehiculeAComponentState>();
  @override
  Widget build(BuildContext context) {
    List<Step> getSteps() => [
          Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            title: const Text(""),
            content: SocieteAssuranceAComponent(
              constatNotifier: widget.constatNotifier,
              key: step1Key,
              pdfConstatModel: widget.pdfConstatModel,
            ),
          ),
          Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: const Text(""),
            content: IdConducteurAComponent(
              constatNotifier: widget.constatNotifier,
              key: step2Key,
              pdfConstatModel: widget.pdfConstatModel,
            ),
          ),
          Step(
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            title: const Text(""),
            content: AssureAComponent(
              constatNotifier: widget.constatNotifier,
              key: step3Key,
              pdfConstatModel: widget.pdfConstatModel,
            ),
          ),
          Step(
            state: currentStep > 3 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 3,
            title: const Text(""),
            content: IdVehiculeAComponent(
              constatNotifier: widget.constatNotifier,
              key: step4Key,
              pdfConstatModel: widget.pdfConstatModel,
            ),
          ),
          Step(
            state: currentStep > 4 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 4,
            title: const Text(""),
            content: DegatAComponent(
              constatNotifier: widget.constatNotifier,
              key: step5Key,
              pdfConstatModel: widget.pdfConstatModel,
            ),
          ),
          Step(
            state: currentStep > 5 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 5,
            title: const Text(""),
            content: CirconstanceAComponent(
              constatNotifier: widget.constatNotifier,
              key: step6Key,
              pdfConstatModel: widget.pdfConstatModel,
            ),
          ),
          Step(
            state: currentStep > 6 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 6,
            title: const Text(""),
            content: ImagesCarteAComponent(
              constatNotifier: widget.constatNotifier,
              key: step7Key,
              pdfConstatModel: widget.pdfConstatModel,
            ),
          ),
          Step(
            state: currentStep > 7 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 7,
            title: const Text(""),
            content: ImagesVehiculeAComponent(
              constatNotifier: widget.constatNotifier,
              key: step8Key,
              pdfConstatModel: widget.pdfConstatModel,
            ),
          ),
        ];
    final steps = getSteps();
    final isLastStep = currentStep == steps.length - 1;
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: kGreenColor)),
        child: Stepper(
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: () async {
            if (currentStep == 0) {
              if (step1Key.currentState!.validateForm()) {
                setState(() {
                  if (currentStep < steps.length - 1) {
                    currentStep += 1;
                  }
                });
              }
            } else if (currentStep == 1) {
              if (step2Key.currentState!.validateForm()) {
                setState(() {
                  if (currentStep < steps.length - 1) {
                    currentStep += 1;
                  }
                });
              }
            } else if (currentStep == 2) {
              if (step3Key.currentState!.validateForm()) {
                setState(() {
                  if (currentStep < steps.length - 1) {
                    currentStep += 1;
                  }
                });
              }
            } else if (currentStep == 3) {
              if (step4Key.currentState!.validateForm()) {
                setState(() {
                  if (currentStep < steps.length - 1) {
                    currentStep += 1;
                  }
                });
              }
            } else if (currentStep == 4) {
              if (step5Key.currentState!.validateForm()) {
                setState(() {
                  if (currentStep < steps.length - 1) {
                    currentStep += 1;
                  }
                });
              }
            } else if (currentStep == 5) {
              if (step6Key.currentState!.validateForm()) {
                setState(() {
                  if (currentStep < steps.length - 1) {
                    currentStep += 1;
                  }
                });
              }
            } else if (currentStep == 6) {
              if (step7Key.currentState!.validateForm()) {
                setState(() {
                  if (currentStep < steps.length - 1) {
                    currentStep += 1;
                  }
                });
              }
            } else if (currentStep == 7) {
              if (step8Key.currentState!.validateForm()) {
                Navigator.pushNamed(
                  context,
                  '/imageFlecheA',
                  arguments: widget.pdfConstatModel,
                );
              }
            }
          },
          onStepCancel: () {
            currentStep == 0
                ? {
                    Navigator.pop(context),
                    widget.constatNotifier.value = ConstatState(
                      nbVoiture: widget.pdfConstatModel.nbVoiture!,
                      declaration: true,
                      vehA: false,
                      vehB: false,
                      croquis: false,
                    ),
                  }
                : setState(() => currentStep -= 1);
          },
          controlsBuilder: (context, detail) {
            return Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // if (currentStep != 0)
                  Expanded(
                      child: ElevatedButton(
                          onPressed: detail.onStepCancel,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: kGreenColor,
                          ),
                          child: Text(
                            "Retour",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  color: kWhiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ))),
                  const SizedBox(width: 10),
                  Expanded(
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: kGreenColor,
                    ),
                    onPressed: detail.onStepContinue,
                    child: Text(
                      isLastStep ? "Suivant" : "Suivant",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: kWhiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
