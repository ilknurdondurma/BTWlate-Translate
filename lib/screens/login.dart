import 'package:btwlate/screens/translate.dart';
import 'package:btwlate/ui/helper/uiSizeHelper.dart';
import 'package:btwlate/ui/helper/uiSpaceHelper.dart';
import 'package:btwlate/ui/helper/uiTextHelper.dart';
import 'package:btwlate/ui/styles/myWidgets/myGeneralWidget.dart';
import 'package:btwlate/ui/styles/styles/decorationStyles.dart';
import 'package:btwlate/ui/styles/styles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../ui/helper/uiColorsHelper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn().then((value) {print("giriş babsarili");});
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TranslatePage()),
      );
    } catch (error) {
      print(error);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColorsHelper.light_Background,
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
                    Text(UITextHelper.signIn,style: UITextStyles.PagesHeaderStyle,),
                    ElevatedButton(onPressed: _handleSignIn, child: Text("sign google"))
                  ],
                )
            ),

          ],
        ),
      ),

    );
  }
}

