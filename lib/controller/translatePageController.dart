// ignore_for_file: prefer_const_constructors

import 'package:btwlate/ui/helper/uiColorsHelper.dart';
import 'package:btwlate/ui/helper/uiSizeHelper.dart';
import 'package:flutter/material.dart';


//**************** INPUT LANG POPUP ***************************************************

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
      color: UIColorsHelper.light_popupBackgorundColor,
      icon: Icon(Icons.keyboard_arrow_down_outlined,color: UIColorsHelper.light_body_IconColor,size: UISizeHelper.iconSelectLang1Size,),
      itemBuilder: (BuildContext context) {
        return InputLangController.menuEntriesInput;
      },
      onSelected: (selectedValue) => widget.onSelected(selectedValue),
    );
  }
}


//**************** OUTPUT LANG POPUP ***************************************************

class OutputLangController extends StatefulWidget {
   final Function(String) onSelected;

   const OutputLangController({
     super.key,
     required this.onSelected
   });
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
  ];
  @override
  State<OutputLangController> createState() => _OutputLangControllerState();
}
class _OutputLangControllerState extends State<OutputLangController> {
// menu içerik listesi
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: UIColorsHelper.light_popupBackgorundColor,
      icon: Icon(Icons.keyboard_arrow_down_outlined,color: UIColorsHelper.light_body_IconColor,size: UISizeHelper.iconSelectLang2Size,),
      itemBuilder: (BuildContext context) {
        return OutputLangController.menuEntriesOutput;
      },
      onSelected: (selectedValue) => widget.onSelected(selectedValue),
    );
  }
}

//*************** MENU ICON ************************************************************

class MenuIconController{
  static void menuIconController(){
    print("menuIconController cagrıldı");
  }
}
//****************** GREY CHANGE LANG ICON ******************************************************

class ChangeLangIconController{
  static void changeLangIconController(){
    print("changeLangIconControlle cagrıldı");
  }
}

//****************** TRANSALTE BUTTON ******************************************************
class TransalateButtonController{
  static void translateButtonController(){
    print("trasnlateButtonController cagrıldı");
  }
}

//****************** İN BOX ICONS ******************************************************
class InBoxIconsController{

  static void copyControllerInput(){
    print("copyControllerInput cagrıldı");
  }
  static void copyControllerOutput(){
    print("copyControllerOutput cagrıldı");
  }

  static void closeController(){
    print("closeController cagrıldı");
  }

  static void favriteController(){
    print("favoriteController cagrıldı");
  }

  static void voiceControllerInput(){
    print("voiceControllerInput cagrıldı");
  }
  static void voiceControllerOutput(){
    print("voiceControllerOutput cagrıldı");
  }
}