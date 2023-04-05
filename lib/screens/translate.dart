import 'package:btwlate/auth/firebase/firebase_controller.dart';
import 'package:btwlate/auth/google_sign.dart';
import 'package:btwlate/screens/login.dart';
import 'package:btwlate/ui/helper/ui_text_helper.dart';
import 'package:btwlate/ui/styles/myWidgets/my_Icon_Button_Widget.dart';
import 'package:btwlate/ui/styles/styles/text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:btwlate/ui/helper/ui_size_helper.dart';
import 'package:btwlate/ui/helper/ui_space_helper.dart';
import 'package:btwlate/ui/styles/styles/decoration_styles.dart';
import 'package:get/get.dart';
import '../controller/translate_page_controller.dart';
import '../ui/helper/ui_colors_helper.dart';
import '../ui/styles/myWidgets/my_Container_Widget.dart';
import '../ui/styles/myWidgets/my_Drawer_Widget.dart';
import '../ui/styles/myWidgets/my_General_Widget.dart';

// ignore: must_be_immutable
class TranslatePage extends StatefulWidget {
  final String? name; //Sign google name surname

  InBoxIconsController inBoxIconsController = InBoxIconsController();

  TranslatePage({super.key, this.name});
  String initialLang1 = "tr";
  String initialLang2 = "en";

  @override
  State<TranslatePage> createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  @override
  void initState(){
    super.initState();
    if (FirebaseAuth.instance.currentUser == null){
      print("kullanici yok oyuzden logine yonlendirildi !");
      GoogleSign.logOutGoogleAccount();
      Get.offAll(LoginPage());
    }
    widget.name;
  }

  final TextEditingController _textEditingController=TextEditingController();
  final responseTranslateController=Get.put(TranslateButtonController());
  final scaffoldkey = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldkey,
        backgroundColor: UIColorsHelper.lightBackground,
        body: ScaffoldMessenger(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //generalHeader
                GeneralThemeWidgetStyle(
                  iconChild: const Icon(Icons.menu),
                  height: UISpaceHelper.dynamicHeight(context, UISizeHelper.smallHeaderHeight),
                  headerIconFunc: ()=>MenuIconController.menuIconController(scaffoldkey),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(widget.initialLang1, style: UITextStyles.translatePageCompanentStyle),
                      InputLangController(
                        onSelected: (selectedValue) {
                          setState(() {
                            widget.initialLang1 = selectedValue;
                          });
                        },
                      ),
                      MyIconButtonWidget(
                          icon: Icons.swap_horiz,
                          color: UIColorsHelper.lightBodyIconColor,
                          size: UISizeHelper.iconChangeLangSize,
                          onPressed: () {
                           setState(() {
                             String temp=widget.initialLang2;
                             widget.initialLang2=widget.initialLang1;
                             widget.initialLang1=temp;
                           });
                          },
                      ),
                      Text(widget.initialLang2, style: UITextStyles.translatePageCompanentStyle),
                      OutputLangController(
                        onSelected: (selectedValue) {
                          setState(() {
                            widget.initialLang2 = selectedValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                //seperator gh_t1
                SizedBox(
                  height: UISpaceHelper.dynamicHeight(
                      context, UISizeHelper.seperateHeight_gh_t1),
                ),
                //translateBox1
                Container(
                  alignment: Alignment.center,
                  //translate Box un genişlik ve yukseklik oranları
                  width: UISpaceHelper.dynamicWidth(
                      context, UISizeHelper.translateBox1Width),
                  height: UISpaceHelper.dynamicHeight(
                      context, UISizeHelper.translateBox1Height),
                  decoration: UIDecorationStyles.translateBoxContainerStyle,

                  // in translateBox1 Icons
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // copy and close ıcon
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MyIconButtonWidget(
                                icon: Icons.copy,
                                color: UIColorsHelper.lightBodyIconColor,
                                size: UISizeHelper.inBoxIconsSize,
                                onPressed: ()=>InBoxIconsController.copyController(_textEditingController.text,context)),
                            MyIconButtonWidget(
                                icon: Icons.close,
                                color: UIColorsHelper.lightBodyIconColor,
                                size: UISizeHelper.inBoxIconsSize,
                                onPressed: ()=>_textEditingController.clear()),
                          ],




                        ),
                        // textfield
                        TextField(
                          controller: _textEditingController,
                          decoration: const InputDecoration(
                            alignLabelWithHint: true,
                            hintText: UITextHelper.hintText,
                            hoverColor: Colors.red,
                            border: UnderlineInputBorder(),

                          ),
                          maxLines: null,
                        ),
                        //like and sound ıcon
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MyIconButtonWidget(
                                icon: Icons.favorite_border,
                                color: UIColorsHelper.lightBodyIconColor,
                                size: UISizeHelper.inBoxIconsSize,
                                onPressed: ()=>FireBaseController.addFavoriteController(_textEditingController.text,TranslateButtonController.responseTranslate.value)),
                            MyIconButtonWidget(
                                icon: Icons.volume_up_outlined,
                                color: UIColorsHelper.lightBodyIconColor,
                                size: UISizeHelper.inBoxIconsSize,
                                onPressed: () => widget.inBoxIconsController.voiceControllerInput(widget.initialLang1,_textEditingController.text)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                //seperator t1-tb
                SizedBox(
                  height: UISpaceHelper.dynamicHeight(
                      context, UISizeHelper.seperateHeight_t1_tb),
                ),
                //transalte button
                GestureDetector(
                  onTap: ()async{
                    await TranslateButtonController.translateButtonController(_textEditingController.text,widget.initialLang1, widget.initialLang2);
                  },
                  child: MyContainerButton(
                    dynamicwidth: UISizeHelper.translateButtonWidth,
                    dynamicheight: UISizeHelper.translateButtonHeight,
                    decoration: UIDecorationStyles.translateButtonContainerStyle,
                    padding: UISizeHelper.translateButtonPadding,
                    children: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(UITextHelper.translateButton,style: UITextStyles.translatePageButtonStyle,),
                        const Icon(Icons.send,color: UIColorsHelper.translateButtonItemColor,size: UISizeHelper.iconTranslateSize,)
                      ],
                    ),
                  ),
                ),
                //seperator t1-t2
                SizedBox(
                  height: UISpaceHelper.dynamicHeight(
                      context, UISizeHelper.seperateHeight_t1_t2),
                ),
                //trasnslate box 2
                Container(
                  //translate Box un genişlik ve yukseklik oranları
                  width: UISpaceHelper.dynamicWidth(
                      context, UISizeHelper.translateBox1Width),
                  height: UISpaceHelper.dynamicHeight(
                      context, UISizeHelper.translateBox1Height),
                  decoration: UIDecorationStyles.translateBoxContainerStyle,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                          MyIconButtonWidget(
                              icon: Icons.copy,
                              color: UIColorsHelper.lightBodyIconColor,
                              size: UISizeHelper.inBoxIconsSize,
                              onPressed: () => InBoxIconsController.copyController(TranslateButtonController.responseTranslate.value,context)),
                          MyIconButtonWidget(
                              icon: Icons.volume_up_outlined,
                              color: UIColorsHelper.lightBodyIconColor,
                              size: UISizeHelper.inBoxIconsSize,
                              onPressed: () => widget.inBoxIconsController.voiceControllerOutput(widget.initialLang2, TranslateButtonController.responseTranslate.value)),
                        ],),
                        const SizedBox(height: 15,),
                        Obx(()=>SelectableText(
                          key: const GlobalObjectKey('outputText'),
                          maxLines: null,
                          TranslateButtonController.responseTranslate.value,
                          textAlign: TextAlign.start,
                          style: UITextStyles.translatePageResponseTextStyle,
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: DrawerWidget(name:widget.name!),
      ),
    );
  }
}




