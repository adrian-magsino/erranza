import 'package:flutter/material.dart';

class hotspotButton extends StatelessWidget {
  const hotspotButton({
    super.key,
    this.label = null,
    this.icon = null,
    this.iconImage = null,
    required this.onPressed,
  });

  final Widget? label;
  final Icon? icon;
  final String? iconImage;
  final VoidCallback? onPressed;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (label != null) label!,
        TextButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(CircleBorder()),
            backgroundColor: WidgetStateProperty.all(Colors.black38),
            foregroundColor: WidgetStateProperty.all(Colors.white),
          ),
          child: iconImage != null? Image.asset(iconImage!, width: 100, height: 100): icon!,
          onPressed: onPressed,
        ),       
      ],
    );
  }
}

/*
text != null ? Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Center(child: Text(text!, style: TextStyle(fontSize: 36, color: Colors.white),)),
              )
              : Container(),
*/