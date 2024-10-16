import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../theme/constants.dart';

class ForguetPasswordScreen extends StatefulWidget {
  const ForguetPasswordScreen({super.key});

  @override
  State<ForguetPasswordScreen> createState() => _ForguetPasswordScreenState();
}

class _ForguetPasswordScreenState extends State<ForguetPasswordScreen> {
  late TextEditingController _emailController;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // SizedBox(height: 20),
                  Center(
                    child: Image.asset(
                      "assets/images/appbar_image.png",
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text("Mot de passe oublié",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              color: kDarkBlueColor,
                              fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Text("Réinitialisez le mot de passe en deux étapes rapides",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              color: kDarkGreeyColor,
                              fontWeight: FontWeight.w100)),
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: _emailController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                    validator: MultiValidator(
                      [
                        RequiredValidator(
                            errorText:
                                "* Veuillez saisir votre adresse e-mail"),
                        EmailValidator(
                            errorText:
                                "Veuillez saisir une adresse e-mail valide"),
                      ],
                    ).call,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {}
                      },
                      child: Text(
                        "Modifier",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: kWhiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
