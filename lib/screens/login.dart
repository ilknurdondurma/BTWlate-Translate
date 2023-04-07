import 'package:btwlate/auth/facebook_sign.dart';
import 'package:btwlate/ui/helper/constants/ui_size_helper.dart';
import 'package:btwlate/ui/helper/constants/ui_space_helper.dart';
import 'package:btwlate/ui/helper/constants/ui_text_helper.dart';
import 'package:btwlate/ui/styles/myWidgets/my_container_widget.dart';
import 'package:btwlate/ui/styles/myWidgets/my_general_widget.dart';
import 'package:btwlate/ui/styles/styles/decoration_styles.dart';
import 'package:btwlate/ui/styles/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth/google_sign.dart';
import '../ui/helper/constants/ui_colors_helper.dart';
import 'email_sign.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColorsHelper.scaffoldBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyGeneralWidget(
                iconChild:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.add,color: UIColorsHelper.headerBackground,),
                  ],
                ),
                height: UISpaceHelper.dynamicHeight(context, UISizeHelper.smallHeaderHeightLogin),
                headerIconFunc:()=>null,
                child: Text(UITextHelper.signIn,style: UITextStyles.pagesHeaderStyle),
            ),
            Container(
              width:  UISpaceHelper.dynamicWidth(context,UISizeHelper.loginContainerWidth),
              height: UISpaceHelper.dynamicHeight(context, UISizeHelper.loginContainerHeight),
              decoration: UIDecorationStyles.smallHeaderContainerStyle,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height:UISpaceHelper.dynamicHeight(context, 0.1)),
                  Text(UITextHelper.signHeading,style: UITextStyles.loginPageStyle,),
                  SizedBox(height:UISpaceHelper.dynamicHeight(context, 0.05)),
                  //buttons
                  GestureDetector(
                    onTap:()=>GoogleSign.logInWithGoogle(),
                    child: MyContainerWidget(
                        dynamicWidth: UISizeHelper.loginButtonsWidth,
                        dynamicHeight: UISizeHelper.loginButtonsHeight,
                        decoration: UIDecorationStyles.loginPageButtonsStyles,
                        padding: UISizeHelper.loginButtonsPadding,
                        children: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.g_translate,size: UISizeHelper.inBoxIconsSize,color: UIColorsHelper.signUpButtonsItemsColor,),
                              Text(UITextHelper.signInGoogle,style: UITextStyles.loginButtonsStyle,textAlign: TextAlign.center,),

                            ],
                          ),
                        )
                    ),
                  ),
                  SizedBox(height:UISpaceHelper.dynamicHeight(context, 0.01)),
                  GestureDetector(
                    onTap: ()=>FacebookSign.signUpWithFacebook(),
                    child: MyContainerWidget(
                        dynamicWidth: UISizeHelper.loginButtonsWidth,
                        dynamicHeight: UISizeHelper.loginButtonsHeight,
                        decoration: UIDecorationStyles.loginPageButtonsStyles,
                        padding: UISizeHelper.loginButtonsPadding,
                        children: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.facebook,size: UISizeHelper.inBoxIconsSize,color: UIColorsHelper.signUpButtonsItemsColor,),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(UITextHelper.signInFacebook,style: UITextStyles.loginButtonsStyle,textAlign: TextAlign.center),
                              ),

                            ],
                          ),
                        )
                    ),
                  ),
                  SizedBox(height:UISpaceHelper.dynamicHeight(context, 0.01)),
                  GestureDetector(
                    onTap: ()=>Get.to(()=>EmailSignPage()),
                    child: MyContainerWidget(
                        dynamicWidth: UISizeHelper.loginButtonsWidth,
                        dynamicHeight: UISizeHelper.loginButtonsHeight,
                        decoration: UIDecorationStyles.loginPageButtonsStyles,
                        padding: UISizeHelper.loginButtonsPadding,
                        children: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.mail,size: UISizeHelper.inBoxIconsSize,color: UIColorsHelper.signUpButtonsItemsColor,),
                              Text(UITextHelper.signInEmail,style: UITextStyles.loginButtonsStyle,textAlign: TextAlign.center),

                            ],
                          ),
                        )
                    ),
                  ),
                  SizedBox(height:UISpaceHelper.dynamicHeight(context, 0.20)),
                  Text(UITextHelper.privacyPolicy,style: UITextStyles.loginPageTermsStyle,),

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