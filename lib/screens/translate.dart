import 'package:btwlate/ui/helper/uiTextHelper.dart';
import 'package:btwlate/ui/styles/myWidgets/myIconButtonWidget.dart';
import 'package:btwlate/ui/styles/styles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:btwlate/ui/helper/uiSizeHelper.dart';
import 'package:btwlate/ui/helper/uiSpaceHelper.dart';
import 'package:btwlate/ui/styles/styles/decorationStyles.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controller/translatePageController.dart';
import '../ui/helper/uiColorsHelper.dart';
import '../ui/styles/myWidgets/myDrawerWidget.dart';
import '../ui/styles/myWidgets/myGeneralWidget.dart';

// ignore: must_be_immutable
class TranslatePage extends StatefulWidget {
  TranslatePage({Key? key}) : super(key: key);
  String initialLang1 = "tr";
  String initialLang2 = "en";

  @override
  State<TranslatePage> createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController _textEditingController=TextEditingController();
  final responseTranslateController=Get.put(TransalateButtonController());
  final scaffoldkey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldkey,
        backgroundColor: UIColorsHelper.light_Background,
        body: ScaffoldMessenger(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //generalHeader
                GeneralThemeWidgetStyle(
                  iconChild: const Icon(Icons.menu),
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
                          color: UIColorsHelper.light_body_IconColor,
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
                                color: UIColorsHelper.light_body_IconColor,
                                size: UISizeHelper.inBoxIconsSize,
                                onPressed: ()=>InBoxIconsController.copyController(_textEditingController.text,context)),
                            MyIconButtonWidget(
                                icon: Icons.close,
                                color: UIColorsHelper.light_body_IconColor,
                                size: UISizeHelper.inBoxIconsSize,
                                onPressed: ()=>_textEditingController.clear()),
                          ],

                        ),
                        // textfield
                        TextField(
                          controller: _textEditingController,
                          decoration: InputDecoration(
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
                                color: UIColorsHelper.light_body_IconColor,
                                size: UISizeHelper.inBoxIconsSize,
                                onPressed: ()=>InBoxIconsController.favoriteController(_textEditingController.text,"${TransalateButtonController.responseTranslate.value}"??"")),
                            MyIconButtonWidget(
                                icon: Icons.volume_up_outlined,
                                color: UIColorsHelper.light_body_IconColor,
                                size: UISizeHelper.inBoxIconsSize,
                                onPressed: InBoxIconsController.voiceControllerInput),
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
                    await TransalateButtonController.translateButtonController(_textEditingController.text,widget.initialLang1, widget.initialLang2);
                  },
                  child: Container(
                      width:UISpaceHelper.dynamicWidth(context,  UISizeHelper.translateButtonWidth,),
                  constraints: const BoxConstraints(
                  minWidth: UISizeHelper.translateButtonWidth,
                  minHeight: UISizeHelper.translateButtonHeight,),
                    decoration: UIDecorationStyles.translateButtonContainerStyle,
                      child: Padding(
                        padding: const EdgeInsets.all(UISizeHelper.translateButtonPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(UITextHelper.translateButton,style: UITextStyles.translatePageButtonStyle,),
                            Icon(Icons.send,color: UIColorsHelper.translateButtonItemColor,size: UISizeHelper.iconTranslateSize,)
                          ],
                        ),
                      )),
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
                              color: UIColorsHelper.light_body_IconColor,
                              size: UISizeHelper.inBoxIconsSize,
                              onPressed: ()=>InBoxIconsController.copyController("${TransalateButtonController.responseTranslate.value}"??"",context)),
                          MyIconButtonWidget(
                              icon: Icons.volume_up_outlined,
                              color: UIColorsHelper.light_body_IconColor,
                              size: UISizeHelper.inBoxIconsSize,
                              onPressed: InBoxIconsController.voiceControllerOutput),
                        ],),
                        SizedBox(height: 15,),
                        Obx(()=>SelectableText(
                          maxLines: null,
                          "${TransalateButtonController.responseTranslate.value}"??"",
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
        drawer: drawerWidget(),
      ),
    );
  }
}


