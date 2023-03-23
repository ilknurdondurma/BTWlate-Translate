// ignore_for_file: prefer_const_constructors

import 'package:btwlate/ui/helper/uiColorsHelper.dart';
import 'package:btwlate/ui/helper/uiSizeHelper.dart';
import 'package:btwlate/ui/helper/uiTextHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator/translator.dart';
//**************** INPUT LANG POPUP ********************************************
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
//**************** OUTPUT LANG POPUP *******************************************
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
//****************** TRANSALTE BUTTON ******************************************
class TransalateButtonController extends GetxController {
  static RxString responseTranslate = "".obs;

  static Future<String> translateButtonController(String word, String language1, String language2) async {
    if (word.isEmpty) {
      word = UITextHelper.errorEmpty;
    }
    print("translateButtonController called");
    final translator = GoogleTranslator();
    // Show CircularProgressIndicator
    Get.dialog(
      Center(
        child: SpinKitWanderingCubes(
          color: Colors.white,
          size: 150,
          duration: Duration(milliseconds: 250),
        ),
      ),
    );
    String translatedText = await translator.translate(word, from: language1, to: language2).then((s) {
      responseTranslate.value = s.text;
      print(s);
      return responseTranslate.value;
    });
    // Wait for 0.5 seconds
    await Future.delayed(Duration(milliseconds: 500 ));
    // Hide CircularProgressIndicator
    Get.back();
    return translatedText;
  }
}














//****************** İN BOX ICONS **********************************************
abstract class InBoxIconsController extends StatefulWidget{

// ! hata baslangıç************************

  static final box = GetStorage();
  @override
    static void favoriteController(String textKey, String textValue) {
      print("favoriteController cagrıldı");
      // List<dynamic> favorites = box.read('favorites') ?? [];
      // favorites.add({"kelime": textKey, "anlami": textValue});
      // box.write('favorites', favorites);
      // Fluttertoast.showToast(
      //
      //     msg: UITextHelper.likeText,
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.grey,
      //     textColor: Colors.white,
      //     fontSize: 16.0
      // );
    }
  // static List<Map<dynamic, dynamic>> get favoritesList =>
  //     (box.read<List<Map<dynamic, dynamic>>>('favorites') ?? []);


// ! hata biitiş***************************












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
  static void voiceControllerInput(){
    print("voiceControllerInput cagrıldı");
  }
  static void voiceControllerOutput(){
    print("voiceControllerOutput cagrıldı");
  }
}
//*************** MENU ICON ****************************************************
class MenuIconController{
  static void menuIconController(scaffoldkey){
    print("menuIconController cagrıldı");
    scaffoldkey.currentState.openDrawer();
  }
}