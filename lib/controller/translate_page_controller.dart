// ignore_for_file: prefer_const_constructors

import 'package:btwlate/ui/helper/constants/ui_colors_helper.dart';
import 'package:btwlate/ui/helper/constants/ui_size_helper.dart';
import 'package:btwlate/ui/helper/constants/ui_text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

import '../ui/styles/myWidgets/my_spinkit_widget.dart';


//**************** INPUT LANG POPUP ********************************************
class InputLangController extends StatefulWidget {
  final Function(String) onSelected;

  const InputLangController({super.key, required this.onSelected});

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
  ];

  @override
  State<InputLangController> createState() => _InputLangControllerState();
}

class _InputLangControllerState extends State<InputLangController> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: UIColorsHelper.popupBackgorundColor,
      icon: Icon(
        Icons.keyboard_arrow_down_outlined,
        color: UIColorsHelper.inBoxIconsColor,
        size: UISizeHelper.iconSelectLang1Size,
      ),
      itemBuilder: (BuildContext context) {
        return InputLangController.menuEntriesInput;
      },
      onSelected: (selectedValue) => widget.onSelected(selectedValue),
    );
  }
}

//**************** OUTPUT LANG POPUP *******************************************
class OutputLangController extends StatefulWidget {
  final Function(String) onSelected;

  const OutputLangController({super.key, required this.onSelected});
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
      color: UIColorsHelper.popupBackgorundColor,
      icon: Icon(
        Icons.keyboard_arrow_down_outlined,
        color: UIColorsHelper.inBoxIconsColor,
        size: UISizeHelper.iconSelectLang2Size,
      ),
      itemBuilder: (BuildContext context) {
        return OutputLangController.menuEntriesOutput;
      },
      onSelected: (selectedValue) => widget.onSelected(selectedValue),
    );
  }
}

//****************** TRANSALTE BUTTON ******************************************
class TransalateButtonController extends GetxController {
  static RxString responseTranslate = "".obs;

  static Future<String> translateButtonController(
      String word, String language1, String language2) async {
    if (word.isEmpty) {
      word = UITextHelper.errorEmpty;
    }
    print("translateButtonController called");
    final translator = GoogleTranslator();
    // Show CircularProgressIndicator
    Get.dialog(
      MySpinkit(),
    );
    String translatedText = await translator
        .translate(word, from: language1, to: language2)
        .then((s) {
      responseTranslate.value = s.text;
      print(s);
      return responseTranslate.value;
    });
    // Wait for 0.5 seconds
    //await Future.delayed(Duration(milliseconds: 500));
    // Hide CircularProgressIndicator
    Get.back();
    return translatedText;
  }
}


//****************** İN BOX ICONS **********************************************
class InBoxIconsController {
// like işlemi firebase.dart dosyasında

  static copyController(String text, context) {
    print("copyControllerInput cagrıldı");
    if (text.isEmpty) {
      print("bos");
    } else {
      Clipboard.setData(ClipboardData(text: text)).then((value) => {
        Fluttertoast.showToast(
            msg: UITextHelper.copyText,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0)
      });
    }
  }
  static Future<void> speak(String selectedLanguage, String text) async {

    final FlutterTts tts = FlutterTts();
    await tts.setLanguage("$selectedLanguage-${selectedLanguage.toUpperCase()}");

    await tts.setPitch(1);
    await tts.setSpeechRate(0.6);

    await tts.speak(text);
  }

  static void voiceControllerInput(selectedLanguage, text)async  {
    print("voiceControllerInput cagrıldı");
    speak(selectedLanguage, text);
  }

 static void voiceControllerOutput(selectedLanguage, text) {
    print("voiceControllerOutput cagrıldı");
    speak(selectedLanguage, text);
  }
}

//*************** MENU ICON ****************************************************
class MenuIconController {
  static void menuIconController(scaffoldkey) {
    print("menuIconController cagrıldı");
    scaffoldkey.currentState.openDrawer();
  }
}
