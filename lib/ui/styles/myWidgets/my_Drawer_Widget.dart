import 'package:btwlate/screens/settings.dart';
import 'package:btwlate/ui/helper/ui_colors_helper.dart';
import 'package:btwlate/ui/helper/ui_size_helper.dart';
import 'package:btwlate/ui/helper/ui_text_helper.dart';
import 'package:btwlate/ui/styles/myWidgets/my_Textfield_Widet.dart';
import 'package:btwlate/ui/styles/styles/text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../screens/favorites.dart';
import 'my_Icon_Button_Widget.dart';


class DrawerWidget extends StatelessWidget {
  final String name;
  final String photo;
  DrawerWidget({
    super.key,
    required this.name,
    required this.photo
  });
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController saveController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(color: UIColorsHelper.lightDrawerHeader),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(backgroundImage: NetworkImage(photo),radius: UISizeHelper.drawerAvatarRadius,),
                  Text(name,style: UITextStyles.drawerHeaderTextStyle),
                  Row(
                    children: [
                      Text("@${name}",style: UITextStyles.drawerHeaderTextStyle),
                       MyIconButtonWidget(
                           icon: Icons.edit,
                          color: UIColorsHelper.lightBodyIconColor,
                          size: UISizeHelper.inBoxIconsSize,
                          onPressed: ()=>{print("click edit nickname")})
                    ],
                  )
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(UITextHelper.favorites,style: UITextStyles.drawerBodyTextStyle,),
            onTap: ()=>Get.to(()=> const FavoritesPage()),
          ),
          ListTile(
            title: Text(UITextHelper.settings,style: UITextStyles.drawerBodyTextStyle,),
            onTap: ()=>Get.to(()=>const SettingsPage()),
          ),

        ],
      ),
    );
  }
  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Opacity(
          opacity: 0.9,
          child: AlertDialog(
            icon: const Icon(Icons.cloud_outlined),
            actionsAlignment: MainAxisAlignment.start,
            title: const Text(UITextHelper.showDialogHeader),
            actions: <Widget>[
              GestureDetector(
                child: Column(
                  children: [
                    MyTextFieldWidget(
                        controller: saveController,
                        color: UIColorsHelper.lightHeaderBackground,
                        hintText: "@nickname",
                        fieldRadius: 25,
                        inputType: TextInputType.,
                        prefixIcon: prefixIcon,
                        obsecure: obsecure),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.save),
                        Text(UITextHelper.okShowDialog, textAlign: TextAlign.center),
                      ],
                    ),
                  ],
                ),
                onTap: ()async {

                },

              ),
            ],
          ),
        );
      },
    );
  }
}