import 'package:allo_constat_frontend/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controllers/auth_controller.dart';
import '../../theme/constants.dart';
import '../home/home_pages.dart';
import 'signin_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController _nomController;
  late TextEditingController _prenomController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _passwordVisible = false;
  bool _isChecked = false;
  GlobalKey<FormState> formkeySignUp = GlobalKey<FormState>();
  final controller = Get.put(AuthController());
  late SharedPreferences prefs;
  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    _nomController = TextEditingController();
    _prenomController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    initSharedPref();
    super.initState();
  }

  @override
  void dispose() {
    _nomController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _prenomController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        flexibleSpace: Center(
          child: Image.asset(
            "assets/images/appbar_image.png",
            height: 45,
          ),
        ),
      ),
      body: Form(
        key: formkeySignUp,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // const SizedBox(height: 20),
                /*Center(
                  child: Image.asset(
                    "assets/images/appbar_image.png",
                    height: 100,
                  ),
                ),*/
                // const SizedBox(height: 10),
                Text("S'inscrire",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: kDarkBlueColor, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(
                    "Créer-vous un compte une seule fois \n et connectez-vous sur tous nos services",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: kDarkGreeyColor, fontWeight: FontWeight.w100)),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nomController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: "Nom ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.person_outline_rounded),
                  ),
                  style: Theme.of(context).inputDecorationTheme.labelStyle,
                  validator: MultiValidator(
                    [
                      RequiredValidator(
                          errorText: "* Veuillez saisir votre Nom "),
                    ],
                  ).call,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _prenomController,
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
                  controller: _phoneController,
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
                TextFormField(
                  controller: _emailController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.email_outlined),
                  ),
                  style: Theme.of(context).inputDecorationTheme.labelStyle,
                  validator: MultiValidator(
                    [
                      RequiredValidator(
                          errorText: "* Veuillez saisir votre adresse e-mail"),
                      EmailValidator(
                          errorText:
                              "Veuillez saisir une adresse e-mail valide"),
                    ],
                  ).call,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  maxLines: 1,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    labelText: "Mot de passe",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  style: Theme.of(context).inputDecorationTheme.labelStyle,
                  validator: MultiValidator([
                    RequiredValidator(
                        errorText: "* Veuillez saisir votre mot de passe"),
                    MinLengthValidator(6,
                        errorText:
                            "Le mot de passe doit comporter au moins 6 caractères"),
                    MaxLengthValidator(15,
                        errorText:
                            "Le mot de passe ne doit pas comporter plus de 15 caractères"),
                  ]).call,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (newValue) {
                        setState(() {
                          _isChecked = newValue!;
                        });
                      },
                    ),
                    Expanded(
                        child: TextButton(
                      onPressed: () => conditionGeneralDisplay(context),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: Theme.of(context).textTheme.headlineSmall!,
                          //.copyWith(fontWeight: FontWeight.bold),
                          children: const <TextSpan>[
                            TextSpan(
                              text: "Je suis d'accord avec ",
                            ),
                            TextSpan(
                              text: "les Conditions d'utilisation ",
                              style: TextStyle(
                                color: kGreenColor,
                              ),
                            ),
                            TextSpan(
                              text: "et ",
                            ),
                            TextSpan(
                              text: "Politique de confidentialité ",
                              style: TextStyle(
                                color: kGreenColor,
                              ),
                            ),
                            /*TextSpan(
                              text: "d'Allo Constat.",
                            ),*/
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // minimumSize: Size(double.infinity, 50),
                      backgroundColor: _isChecked ? kGreenColor : kGreeyColor,
                    ),
                    onPressed: _isChecked
                        ? () async {
                            if (formkeySignUp.currentState!.validate()) {
                              UserModel user = UserModel(
                                nom: _nomController.text.toString(),
                                prenom: _prenomController.text.toString(),
                                email: _emailController.text.toString(),
                                password: _passwordController.text.toString(),
                                phoneNum: _phoneController.text.toString(),
                              );
                              var result =
                                  await controller.signupController(user);
                              var status = result['status'];
                              if (status == true) {
                                var mytoken = result['token'];
                                prefs.setString('token', mytoken);
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    CupertinoPageRoute(
                                      builder: ((context) =>
                                          HomePages(token: mytoken)),
                                    ),
                                    (route) => false);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Column(
                                        children: [
                                          Text(result['success']),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Column(
                                        children: [
                                          Text(result['error']),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                            }
                          }
                        : null,
                    child: Text(
                      "S'inscrire",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: kWhiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SigninScreen(),
                      ),
                    );
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headlineSmall!,
                      children: const <TextSpan>[
                        TextSpan(
                          text: "Déjà inscrit ? ",
                        ),
                        TextSpan(
                          text: "Connectez-vous ici",
                          style: TextStyle(
                              color: kGreenColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Future<void> conditionGeneralDisplay(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Contrat de Services de Documentation d'Accidents de la Circulation",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          actions: [
            // Return or Close Button
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Closes the dialog
              },
              child: Text(
                "D'accord",
                style:
                    TextStyle(color: kGreenColor, fontWeight: FontWeight.bold),
              ),
            ),
          ],
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Entre Le Client et La Société TUNISIE CONSTAT",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 10),
                Text(
                  "Article 1 : Objet \nClause 1 :\nL'objet de ce contrat est de documenter les accidents de la circulation impliquant le client, à travers l'application appartenant à la société TUNISIE CONSTAT. La société fournit ce service sous les termes et conditions énoncés dans ce contrat. \n\nArticle 2 : Autorisation \nClause 2 : \nLe client autorise la société susmentionnée, TUNISIE CONSTAT, à documenter les accidents de la circulation en son nom, en fournissant les données personnelles requises via l'application approuvée par la société. \n\nArticle 3 : Frais et Paiement \nClause 3 : \n1. Le client s'engage à payer les frais spécifiés et convenus avec la société TUNISIE CONSTAT. \n2. Les frais dus doivent être payés dans les délais spécifiés, et tout défaut de paiement à temps sera considéré comme une violation de ce contrat. \n3. Les délais spécifiés pour le paiement des frais seront d'un mois à partir de la date de la documentation de l'accident. \n\nArticle 4 : Compensation \nClause 4 : \n1. La société TUNISIE CONSTAT fournit le service avec précision et fiabilité, mais elle n'est pas responsable de tout retard ou erreur dans la documentation des accidents dus à des raisons indépendantes de sa volonté. \n2. En cas de tout dysfonctionnement technique ou retard dans la documentation des accidents, la responsabilité de la société est limitée à la ré-documentation de l'accident dans les meilleurs délais. \n\nArticle 5 : Données Personnelles et Confidentialité des Données \nClause 5 \n1. Le client s'engage à fournir des données personnelles précises et valides via l'application approuvée de la société TUNISIE CONSTAT. \n2. Ces données seront traitées de manière strictement confidentielle conformément à la politique de confidentialité approuvée par la société. \n3. La société s'engage à maintenir la confidentialité des données personnelles et s'engage à ne pas les partager avec des tiers sans le consentement explicite du client. \n4. La société utilisera ces données dans la mesure nécessaire pour fournir le service de manière complète et efficace, en prenant toutes les mesures nécessaires pour protéger les données et garantir qu'elles ne sont pas utilisées à des fins illégales ou non autorisées. \n\nArticle 6 : Opposition \nClause 6 : \n1. Le client a le droit de s'opposer à la documentation effectuée par la société dans un délai ne dépassant pas un jour à compter de la date de la documentation. \n2. L'opposition doit être faite par écrit et envoyée à la société par courrier électronique et en contactant le personnel concerné de la société.",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
