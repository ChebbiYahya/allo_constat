import 'package:allo_constat_frontend/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/auth_controller.dart';
import '../../../theme/constants.dart';
import '../../login/signin_screen.dart';

class NavProfilScreen extends StatefulWidget {
  const NavProfilScreen({super.key, this.usr});
  final UserModel? usr;

  @override
  State<NavProfilScreen> createState() => _NavProfilScreenState();
}

class _NavProfilScreenState extends State<NavProfilScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    final nom = TextEditingController(text: widget.usr!.nom);
    final prenom = TextEditingController(text: widget.usr!.prenom);
    final phoneNum = TextEditingController(text: widget.usr!.phoneNum);
    late SharedPreferences prefs;

    void initSharedPref() async {
      prefs = await SharedPreferences.getInstance();
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/user_image.png",
                    height: 90,
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: nom,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: "Nom",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.person_outline_rounded),
                  ),
                  style: Theme.of(context).inputDecorationTheme.labelStyle,
                  validator: MultiValidator(
                    [
                      RequiredValidator(
                          errorText: "* Veuillez saisir votre Nom"),
                    ],
                  ).call,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: prenom,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: "Prénom",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.person_outline_rounded),
                  ),
                  style: Theme.of(context).inputDecorationTheme.labelStyle,
                  validator: MultiValidator(
                    [
                      RequiredValidator(
                          errorText: "* Veuillez saisir votre Prénom"),
                    ],
                  ).call,
                ),
                const SizedBox(height: 10),
                IntlPhoneField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: phoneNum,
                  keyboardType: TextInputType.phone,
                  focusNode: FocusNode(),
                  dropdownTextStyle: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'Numéro téléphone',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(),
                    ),
                  ),
                  style: const TextStyle(fontSize: 20),
                  initialCountryCode: 'TN',
                  onChanged: (phone) {},
                  validator: MultiValidator(
                    [
                      RequiredValidator(
                          errorText:
                              "* Veuillez saisir votre Numéro téléphone"),
                    ],
                  ).call,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: kGreenColor,
                  ),
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      UserModel user = widget.usr!;
                      var result = await controller.updateUserByIdController(
                          user,
                          nom.text.trim(),
                          prenom.text.trim(),
                          phoneNum.text.trim());
                      String message = result["message"];

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Column(
                              children: [
                                Text(message),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Modifier mon profil",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: kWhiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: kGreenColor,
                  ),
                  onPressed: () async {
                    //controller.logoutController();
                    initSharedPref();
                    await prefs.remove('token');
                    Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                            builder: ((context) => const SigninScreen())),
                        (route) => false);
                  },
                  child: Text(
                    "Déconnecter",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: kWhiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
