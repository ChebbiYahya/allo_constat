import 'package:flutter/material.dart';

import '../../../theme/constants.dart';

class TitleConstat extends StatelessWidget {
  final String title;
  final String nb;
  const TitleConstat({
    super.key,
    required this.title,
    required this.nb,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Container(
            width: 30.0,
            height: 30.0,
            decoration: const BoxDecoration(
              color: kGreenColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                nb,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(title,
              maxLines: 3,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: kDarkBlueColor, fontWeight: FontWeight.bold)),
          const Spacer(),
        ],
      ),
    );
  }
}
