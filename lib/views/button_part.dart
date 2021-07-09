import 'package:flutter/material.dart';

class ButtonPart extends StatelessWidget {
  final Widget nextScreen;
  final String buttonText;

  const ButtonPart({
    Key? key,
    required this.nextScreen,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      child: ElevatedButton(
        child: Text(buttonText),
        style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          onPrimary: Colors.black,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => nextScreen,
            ),
          );
        },
      ),
    );
  }
}
