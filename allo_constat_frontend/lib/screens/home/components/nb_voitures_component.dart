import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NbVoituresComponent extends StatelessWidget {
  final String imageUrl;
  final String text;
  final int value;
  final int? groupValue;
  final ValueChanged<int?> onChanged;
  const NbVoituresComponent({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          onChanged(value), // Change la valeur quand on tape sur le conteneur
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            SvgPicture.asset(
              imageUrl,
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Radio<int>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
