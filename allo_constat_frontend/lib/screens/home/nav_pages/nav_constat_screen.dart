import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/constat_controller.dart';
import '../../../models/user_model.dart';
import '../../../theme/constants.dart';
import '../components/constat_component.dart';

class NavConstatScreen extends StatelessWidget {
  const NavConstatScreen({super.key, this.usr});
  final UserModel? usr;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ConstatController());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text("Vos constats",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: kDarkBlueColor, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder(
                  future: controller.getConstatController(usr!.id.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ConstatComponent(
                              constatCollection: snapshot.data![index],
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else {
                        return const Center(
                            child: Text("Quelque chose n'a pas fonctionné"));
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
