import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controllers/auth_controller.dart';
import '../../models/user_model.dart';
import '../../theme/constants.dart';
import '../home/home_pages.dart';
import 'forguet_password_screen.dart';
import 'signup_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  GlobalKey<FormState> formkeySignin = GlobalKey<FormState>();

  final controller = Get.put(AuthController());
  late SharedPreferences prefs;
  bool _passwordVisible = false;
  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    initSharedPref();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SvgPicture.asset("assets/icons/remorquage_icon.svg"),
            ),
          ),
          actions: [
            InkWell(
              onTap: () async {
                // await FlutterPhoneDirectCaller.callNumber(NumeroRemorquage);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(
                  Icons.phone_enabled_outlined,
                  //color: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: formkeySignin,
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/appbar_image.png",
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text("Se Connecter",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              color: kDarkBlueColor,
                              fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(
                      "Créer-vous un compte une seule fois \n et connectez-vous sur tous nos services",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              color: kDarkGreeyColor,
                              fontWeight: FontWeight.w100)),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      labelText: "E-mail",
                      prefixIcon: Icon(Icons.email_outlined),
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
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordController,
                    maxLines: 1,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      labelText: "Mot de passe",
                      /* border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),*/
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
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForguetPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Mot de passe oublié ?",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: kGreenColor,
                                  fontWeight: FontWeight.bold,
                                ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formkeySignin.currentState!.validate()) {
                          final user = UserModel(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          var result = await controller.signinController(user);

                          if (result['status'] == true) {
                            var mytoken = result['token'];
                            prefs.setString('token', mytoken);
                            Navigator.pushAndRemoveUntil(
                                context,
                                CupertinoPageRoute(
                                  builder: ((context) =>
                                      HomePages(token: mytoken)),
                                ),
                                (route) => false);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(result['error']),
                              ),
                            );
                          }
                        }
                      },
                      child: Text(
                        "Se Connecter",
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
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text("OU"),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: const Column(
                                    children: [
                                      Text(
                                          "This service isn't available right now"),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Image.asset(
                            "assets/icons/gmail_icon.png",
                            height: 30,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: const Column(
                                    children: [
                                      Text(
                                        "This service isn't available right now",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Image.asset(
                            "assets/icons/facebook_icon.png",
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headlineSmall!,
                        children: const <TextSpan>[
                          TextSpan(
                            text: "Vous êtes nouveau ici ? ",
                          ),
                          TextSpan(
                            text: "Inscrivez-vous ici",
                            style: TextStyle(
                                color: kGreenColor,
                                fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
