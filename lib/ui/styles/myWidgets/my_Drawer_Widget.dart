import 'package:btwlate/screens/settings.dart';
import 'package:btwlate/ui/helper/constants/ui_colors_helper.dart';
import 'package:btwlate/ui/helper/constants/ui_size_helper.dart';
import 'package:btwlate/ui/helper/constants/ui_text_helper.dart';
import 'package:btwlate/ui/styles/myWidgets/my_Textfield_Widet.dart';
import 'package:btwlate/ui/styles/styles/text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../screens/favorites.dart';
import '../../helper/constants/ui_space_helper.dart';
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
      backgroundColor: UIColorsHelper.drawerBodyBackground,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration:  BoxDecoration(color: UIColorsHelper.drawerHeaderBackground),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:UISpaceHelper.dynamicHeight(context, 0.02)),
                  CircleAvatar(backgroundImage: NetworkImage(photo),radius: UISizeHelper.drawerAvatarRadius,),
                  SizedBox(height:UISpaceHelper.dynamicHeight(context, 0.02)),
                  Text(name,style: UITextStyles.drawerHeaderTextStyle),
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
}