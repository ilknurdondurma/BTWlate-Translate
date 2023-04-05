import 'package:btwlate/auth/email_sign.dart';
import 'package:btwlate/controller/email_sign_page_controller.dart';
import 'package:btwlate/ui/helper/ui_colors_helper.dart';
import 'package:btwlate/ui/helper/ui_size_helper.dart';
import 'package:btwlate/ui/helper/ui_space_helper.dart';
import 'package:btwlate/ui/helper/ui_text_helper.dart';
import 'package:btwlate/ui/styles/myWidgets/my_Container_Widget.dart';
import 'package:btwlate/ui/styles/myWidgets/my_spinkit_Widget.dart';
import 'package:btwlate/ui/styles/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/styles/myWidgets/my_General_Widget.dart';
import '../ui/styles/myWidgets/my_Textfield_Widet.dart';
import '../ui/styles/styles/decoration_styles.dart';

class EmailSignPage extends StatelessWidget {
   EmailSignPage({Key? key}) : super(key: key);

  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyGeneralWidget(
              iconChild: const Icon(Icons.arrow_back_ios),
              headerIconFunc: ()=>Get.back(),
              height: UISpaceHelper.dynamicHeight(context, UISizeHelper.smallHeaderHeight),
              child: Text(UITextHelper.signEmailHeader,style: UITextStyles.pagesHeaderStyle,),
            ),
            Container(
              width:  UISpaceHelper.dynamicWidth(context,UISizeHelper.loginContainerWidth),
              height: UISpaceHelper.dynamicHeight(context, UISizeHelper.loginContainerHeight),
              decoration: UIDecorationStyles.smallHeaderContainerStyle,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(height: UISpaceHelper.dynamicHeight(context, 0.05),),
                    MyTextFieldWidget(
                      controller: emailController,
                      color: UIColorsHelper.lightHeaderBackground,
                      hintText: UITextHelper.fieldEmail,
                      fieldRadius: UISizeHelper.myFieldRadius,
                      inputType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email_outlined),
                      obsecure: false,

                    ),
                    SizedBox(height: UISpaceHelper.dynamicHeight(context, 0.05),),
                    MyTextFieldWidget(
                      controller: passwordController,
                      color: UIColorsHelper.lightHeaderBackground,
                      hintText: UITextHelper.fieldPassword,
                      fieldRadius: UISizeHelper.myFieldRadius,
                      inputType: TextInputType.visiblePassword,
                      prefixIcon: const Icon(Icons.lock_outline),
                      obsecure: true,

                    ),
                    SizedBox(height: UISpaceHelper.dynamicHeight(context, 0.1),),
                    GestureDetector(
                      onTap: (){
                        EmailSignPageController.signUpButton(emailController.text.toString(), passwordController.text);
                      },
                      child: MyContainerWidget(
                        dynamicwidth: UISizeHelper.translateButtonWidth,
                        dynamicheight: UISizeHelper.translateButtonHeight,
                        decoration: UIDecorationStyles.translateButtonContainerStyle,
                        padding: UISizeHelper.translateButtonPadding,
                        children: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(UITextHelper.signUpLower,style: UITextStyles.translatePageButtonStyle,),
                          ],
                        ),




                      ),
                    ),
                    SizedBox(height: UISpaceHelper.dynamicHeight(context, 0.1),),

                  ],
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}


