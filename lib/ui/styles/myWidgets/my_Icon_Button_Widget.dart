import 'package:flutter/material.dart';

class MyIconButtonWidget extends StatefulWidget {
  final IconData icon;
  final Color color;
  final double size;
  final Function() onPressed;

  const MyIconButtonWidget({
    Key? key,
    required this.icon,
    required this.color,
    required this.size,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<MyIconButtonWidget> createState() => _MyIconButtonWidgetState();
}

class _MyIconButtonWidgetState extends State<MyIconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        widget.icon,
        size: widget.size,
        color: widget.color,
      ),
      onPressed: () => widget.onPressed(),
    );
  }
}