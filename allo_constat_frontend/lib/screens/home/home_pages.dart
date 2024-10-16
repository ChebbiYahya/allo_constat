import 'package:allo_constat_frontend/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../controllers/auth_controller.dart';
import '../../theme/constants.dart';
import 'nav_pages/nav_add_constat_screen.dart';
import 'nav_pages/nav_add_qr_screen.dart';
import 'nav_pages/nav_constat_screen.dart';
import 'nav_pages/nav_profil_screen.dart';

class HomePages extends StatefulWidget {
  const HomePages({
    super.key,
    required this.token,
  });
  final String token;

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  final controller = Get.put(AuthController());
  late UserModel usr;
  int _selectedIndex = 0;
  late List<Widget> _pages = []; // Initialize with an empty list

  String numeroConstateur = "50614633";
  String numeroRemorquage = "50185358";

  late String userId;

  @override
  void initState() {
    super.initState();
    initializeUser();
  }

  Future<void> initializeUser() async {
    try {
      Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
      userId = jwtDecodedToken['id'];

      UserModel? user =
          await controller.getUserByIdController(userId, widget.token);

      if (user != null) {
        setState(() {
          usr = user;
          // Initialize _pages with the necessary screens
          _pages = [
            NavConstatScreen(usr: usr),
            NavAddConstatScreen(usr: usr),
            NavAddQrScreen(usr: usr),
            NavProfilScreen(usr: usr),
          ];
        });
      } else {
        // Handle the case where user is null
        print("User not found");
      }
    } catch (e) {
      // Handle errors such as invalid token
      print("Error initializing user: $e");
    }
  }

  @override
  void dispose() {
    _pages.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_pages.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () async {
            await FlutterPhoneDirectCaller.callNumber(numeroRemorquage);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset("assets/icons/remorquage_icon.svg"),
          ),
        ),
        flexibleSpace: Center(
          child: Image.asset(
            "assets/images/appbar_image.png",
            height: 45,
          ),
        ),
        actions: [
          InkWell(
            onTap: () async {
              await FlutterPhoneDirectCaller.callNumber(numeroConstateur);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Icon(
                Icons.phone_enabled_outlined,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: GNav(
          gap: 10,
          padding: const EdgeInsets.all(12),
          color: kDarkBlueColor,
          activeColor: kGreenColor,
          duration: const Duration(milliseconds: 600),
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: const [
            GButton(
              backgroundColor: kGreeyColor,
              icon: Icons.insert_drive_file_outlined,
              text: "Dossiers",
            ),
            GButton(
              backgroundColor: kGreeyColor,
              icon: Icons.add,
              text: "Ajouter",
            ),
            GButton(
              backgroundColor: kGreeyColor,
              icon: Icons.qr_code_rounded,
              text: "QR",
            ),
            GButton(
              backgroundColor: kGreeyColor,
              icon: Icons.person_outline_rounded,
              text: "Profile",
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    ));
  }
}
