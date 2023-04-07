import 'package:btwlate/controller/email_sign_page_controller.dart';
import 'package:btwlate/ui/helper/constants/ui_colors_helper.dart';
import 'package:btwlate/ui/helper/constants/ui_size_helper.dart';
import 'package:btwlate/ui/helper/constants/ui_space_helper.dart';
import 'package:btwlate/ui/helper/constants/ui_text_helper.dart';
import 'package:btwlate/ui/styles/myWidgets/my_container_widget.dart';
import 'package:btwlate/ui/styles/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/styles/myWidgets/my_general_widget.dart';
import '../ui/styles/myWidgets/my_textfield_widet.dart';
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
              iconChild:  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.arrow_back_ios),
                ],
              ),
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
                      color: UIColorsHelper.headerBackground,
                      hintText: UITextHelper.fieldEmail,
                      fieldRadius: UISizeHelper.myFieldRadius,
                      inputType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email_outlined),
                      obsecure: false,

                    ),
                    SizedBox(height: UISpaceHelper.dynamicHeight(context, 0.05),),
                    MyTextFieldWidget(
                      controller: passwordController,
                      color: UIColorsHelper.headerBackground,
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
                        dynamicWidth: UISizeHelper.translateButtonWidth,
                        dynamicHeight: UISizeHelper.translateButtonHeight,
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


