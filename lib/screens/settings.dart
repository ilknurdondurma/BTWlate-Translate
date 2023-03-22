import 'package:btwlate/screens/translate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/helper/uiTextHelper.dart';
import '../ui/styles/myWidgets/myGeneralWidget.dart';
import '../ui/styles/styles/textStyles.dart';

class settingsPage extends StatefulWidget {
  const settingsPage({Key? key}) : super(key: key);

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              GeneralThemeWidgetStyle(
                  child: Text(UITextHelper.settingsHeader,style: UITextStyles.PagesHeaderStyle,),
                  iconChild: Icon(Icons.arrow_back_ios),
                  headerIconFunc: ()=>Get.offAndToNamed(TranslatePage().toString())
              ),
            ],
          )),
    );
  }
}
