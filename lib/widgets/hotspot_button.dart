import 'package:flutter/material.dart';

class hotspotButton extends StatelessWidget {
  const hotspotButton({
    super.key,
    this.text = null,
    required this.icon,
    required this.onPressed,
  });

  final String? text;
  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(CircleBorder()),
            backgroundColor: WidgetStateProperty.all(Colors.black38),
            foregroundColor: WidgetStateProperty.all(Colors.white),
          ),
          child: Icon(icon, size: 200),
          onPressed: onPressed,
        ),
        text != null ? Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Center(child: Text(text!, style: TextStyle(fontSize: 36, color: Colors.white),)),
              )
              : Container()

      ],
    );
  }
}