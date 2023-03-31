import 'package:btwlate/ui/helper/ui_size_helper.dart';
import 'package:btwlate/ui/helper/ui_space_helper.dart';
import 'package:btwlate/ui/helper/ui_text_helper.dart';
import 'package:btwlate/ui/styles/myWidgets/myContainerWidget.dart';
import 'package:btwlate/ui/styles/myWidgets/myGeneralWidget.dart';
import 'package:btwlate/ui/styles/styles/decoration_styles.dart';
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
                iconChild: const Icon(Icons.add,color: UIColorsHelper.lightHeaderBackground,),
                height: UISpaceHelper.dynamicHeight(context, UISizeHelper.smallHeaderHeightLogin),
                headerIconFunc:()=>null,
                child: Text(UITextHelper.signIn,style: UITextStyles.pagesHeaderStyle),
            ),
            Container(
              height: UISpaceHelper.dynamicHeight(context, UISizeHelper.containerLogin),
              decoration: UIDecorationStyles.smallHeaderContainerStyle,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height:UISpaceHelper.dynamicHeight(context, 0.1)),
                  Text(UITextHelper.signHeading,style: UITextStyles.loginPageStyle,),
                  SizedBox(height:UISpaceHelper.dynamicHeight(context, 0.05)),
                  //buttons
                  GestureDetector(
                    onTap:()=>GoogleSign.loginButtonGoogle(),
                    child: MyContainerButton(
                        dynamicwidth: UISizeHelper.loginButtonsWidth,
                        dynamicheight: UISizeHelper.loginButtonsHeight,
                        decoration: UIDecorationStyles.loginPageButtonsStyles,
                        padding: UISizeHelper.loginButtonsPadding,
                        children: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.g_mobiledata_outlined,size: UISizeHelper.inBoxIconsSize,color: UIColorsHelper.lightLoginPageButtonsIconColor,),
                            SizedBox(width:UISpaceHelper.dynamicHeight(context, 0.1)),
                            Text(UITextHelper.signInGoogle,style: UITextStyles.loginButtonsStyle),
                            SizedBox(width:UISpaceHelper.dynamicHeight(context, 0.1)),

                          ],
                        )
                    ),
                  ),
                  SizedBox(height:UISpaceHelper.dynamicHeight(context, 0.01)),
                  MyContainerButton(
                      dynamicwidth: UISizeHelper.loginButtonsWidth,
                      dynamicheight: UISizeHelper.loginButtonsHeight,
                      decoration: UIDecorationStyles.loginPageButtonsStyles,
                      padding: UISizeHelper.loginButtonsPadding,
                      children: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.facebook,size: UISizeHelper.inBoxIconsSize,color: UIColorsHelper.lightLoginPageButtonsIconColor,),
                          SizedBox(width:UISpaceHelper.dynamicHeight(context, 0.1)),
                          Text(UITextHelper.signInFacebook,style: UITextStyles.loginButtonsStyle),
                          SizedBox(width:UISpaceHelper.dynamicHeight(context, 0.1)),

                        ],
                      )
                  ),
                  SizedBox(height:UISpaceHelper.dynamicHeight(context, 0.01)),
                  MyContainerButton(
                      dynamicwidth: UISizeHelper.loginButtonsWidth,
                      dynamicheight: UISizeHelper.loginButtonsHeight,
                      decoration: UIDecorationStyles.loginPageButtonsStyles,
                      padding: UISizeHelper.loginButtonsPadding,
                      children: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.mail,size: UISizeHelper.inBoxIconsSize,color: UIColorsHelper.lightLoginPageButtonsIconColor,),
                          SizedBox(width:UISpaceHelper.dynamicHeight(context, 0.1)),
                          Text(UITextHelper.signInEmail,style: UITextStyles.loginButtonsStyle),
                          SizedBox(width:UISpaceHelper.dynamicHeight(context, 0.1)),

                        ],
                      )
                  ),
                  SizedBox(height:UISpaceHelper.dynamicHeight(context, 0.20)),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(UITextHelper.privacyPolicy,style: UITextStyles.loginPageTermsStyle,),
                  ),

                ],
              ),
            )

          ],
        ),
      ),

    );
  }
}



//
// onPressed: ()async{
// UserCredential? userCredential = await GoogleSign.signInWithGoogle();
// if (userCredential != null) {
// Get.offAll(TranslatePage());
// }
// }