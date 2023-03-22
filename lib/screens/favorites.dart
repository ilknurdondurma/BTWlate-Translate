import 'package:btwlate/screens/translate.dart';
import 'package:btwlate/ui/helper/uiTextHelper.dart';
import 'package:btwlate/ui/styles/myWidgets/myGeneralWidget.dart';
import 'package:btwlate/ui/styles/styles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class favoritesPage extends StatefulWidget {
  const favoritesPage({Key? key}) : super(key: key);

  @override
  State<favoritesPage> createState() => _favoritesPageState();
}

class _favoritesPageState extends State<favoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              GeneralThemeWidgetStyle(
                  child: Text(UITextHelper.favoritesHeader,style: UITextStyles.PagesHeaderStyle,),
                  iconChild: Icon(Icons.arrow_back_ios),
                  headerIconFunc: ()=>Get.offAndToNamed(TranslatePage().toString())
              ),
            ],
          )),
    );
  }
}
