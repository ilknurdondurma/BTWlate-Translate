// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InputLangController extends StatefulWidget {
  final Function(String) onSelected;

  const InputLangController({
    super.key,
    required this.onSelected
});
  static List<PopupMenuEntry<String>> menuEntriesInput = [
    PopupMenuItem<String>(
      value: 'tr',
      child: Text('TÜRKÇE'),
    ),
    PopupMenuItem<String>(
      value: 'en',
      child: Text('İNGİLİZCE'),
    ),
    PopupMenuItem<String>(
      value: 'de',
      child: Text('ALMANCA'),
    ),
    PopupMenuItem<String>(
      value: 'fr',
      child: Text('FRANSIZCA'),
    ),
    PopupMenuItem<String>(
      value: 'es',
      child: Text('İSPANYOLCA'),
    ),
    PopupMenuItem<String>(
      value: 'la',
      child: Text('LATİNCE'),
    ),
    PopupMenuItem<String>(
      value: 'ru',
      child: Text('RUSÇA'),
    ),
    PopupMenuItem<String>(
      value: 'ar',
      child: Text('ARAPÇA'),
    ),
    PopupMenuItem<String>(
      value: 'zc',
      child: Text('ÇİNCE'),
    )
  ];
  @override
  State<InputLangController> createState() => _InputLangControllerState();
}

class _InputLangControllerState extends State<InputLangController> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.keyboard_arrow_down_outlined),
      itemBuilder: (BuildContext context) {
        return InputLangController.menuEntriesInput;
      },
      onSelected: (selectedValue) => widget.onSelected(selectedValue),
    );
  }
}
abstract class OutputLangController extends StatelessWidget {
  static List<PopupMenuEntry<String>> menuEntriesOutput = [
    PopupMenuItem<String>(
      value: 'tr',
      child: Text('TÜRKÇE'),
    ),
    PopupMenuItem<String>(
      value: 'en',
      child: Text('İNGİLİZCE'),
    ),
    PopupMenuItem<String>(
      value: 'de',
      child: Text('ALMANCA'),
    ),
    PopupMenuItem<String>(
      value: 'fr',
      child: Text('FRANSIZCA'),
    ),
    PopupMenuItem<String>(
      value: 'es',
      child: Text('İSPANYOLCA'),
    ),
    PopupMenuItem<String>(
      value: 'la',
      child: Text('LATİNCE'),
    ),
    PopupMenuItem<String>(
      value: 'ru',
      child: Text('RUSÇA'),
    ),
    PopupMenuItem<String>(
      value: 'ar',
      child: Text('ARAPÇA'),
    ),
    PopupMenuItem<String>(
      value: 'zc',
      child: Text('ÇİNCE'),
    )
  ];// menu içerik listesi

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.keyboard_arrow_down_outlined),
      itemBuilder: (BuildContext context) {
        return menuEntriesOutput;
      },
      onSelected: (String selectedValue) => null,
    );
  }
}
