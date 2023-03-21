// ignore_for_file: prefer_const_constructors

import 'package:btwlate/ui/helper/uiColorsHelper.dart';
import 'package:btwlate/ui/helper/uiSizeHelper.dart';
import 'package:btwlate/ui/helper/uiTextHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';


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
abstract class InBoxIconsController extends StatefulWidget{
  @override
  static copyController(String text,context){
    print("copyControllerInput cagrıldı");
    if (text.isEmpty){
      print("bos");
    }
    else {
      Clipboard.setData(ClipboardData(text: text)).then((value) => {

      Fluttertoast.showToast(

      msg: UITextHelper.copyText,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0
      )

      });
    }
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
//****************************** BİLDİRİM ********************************************************

class FunkyNotification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FunkyNotificationState();
}

class FunkyNotificationState extends State<FunkyNotification> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> position;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    position = Tween<Offset>(begin: Offset(0.0, -4.0), end: Offset.zero)
        .animate(
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    Future.delayed(Duration(seconds: 1), () {
      _controller.forward();
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 32.0),
            child: SlideTransition(
              position: position,
              child: Container(
                decoration: ShapeDecoration(
                    color: UIColorsHelper.light_notificationColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0))),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    UITextHelper.copyText,
                    style: TextStyle(
                        color: UIColorsHelper.light_notificationTextColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}