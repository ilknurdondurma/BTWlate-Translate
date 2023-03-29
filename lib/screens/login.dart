import 'package:btwlate/ui/helper/ui_size_helper.dart';
import 'package:btwlate/ui/helper/ui_space_helper.dart';
import 'package:btwlate/ui/helper/ui_text_helper.dart';
import 'package:btwlate/ui/styles/myWidgets/myGeneralWidget.dart';
import 'package:btwlate/ui/styles/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../auth/google_sign.dart';
import '../ui/helper/ui_colors_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColorsHelper.lightBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GeneralThemeWidgetStyle(
                iconChild: const Icon(Icons.add),
                height: UISpaceHelper.dynamicHeight(context, UISizeHelper.smallHeaderHeightLogin),
                headerIconFunc:()=>null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(UITextHelper.signIn,style: UITextStyles.pagesHeaderStyle,),
                    ElevatedButton(onPressed: ()=>GoogleSign.signInWithGoogle(), child: const Text("sign google"))
                  ],
                )
            ),

          ],
        ),
      ),

    );
  }
}

