import 'package:flutter/material.dart';

import '../../../theme/constants.dart';

class TextFieldConstat extends StatefulWidget {
  final String title;
  final String nb;
  final void Function(String) onTextChanged;

  const TextFieldConstat({
    super.key,
    required this.title,
    required this.nb,
    required this.onTextChanged,
  });

  @override
  TextFieldConstatState createState() => TextFieldConstatState();
}

class TextFieldConstatState extends State<TextFieldConstat> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30.0,
            height: 30.0,
            decoration: const BoxDecoration(
              color: kGreenColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                widget.nb,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: _controller,
              maxLines: 1,
              onChanged: widget.onTextChanged,
              decoration: InputDecoration(
                labelText: widget.title,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              style: Theme.of(context).inputDecorationTheme.labelStyle,
            ),
          ),
        ],
      ),
    );
  }
}
