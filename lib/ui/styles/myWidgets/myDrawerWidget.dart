import 'package:btwlate/screens/settings.dart';
import 'package:btwlate/ui/helper/ui_colors_helper.dart';
import 'package:btwlate/ui/helper/ui_size_helper.dart';
import 'package:btwlate/ui/helper/ui_text_helper.dart';
import 'package:btwlate/ui/styles/styles/text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../screens/favorites.dart';


class DrawerWidget extends StatelessWidget {
  final String name;
  DrawerWidget({
    super.key,
    required this.name
  });
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(color: UIColorsHelper.lightDrawerHeader),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(radius: UISizeHelper.drawerAvatarRadius,),
                Text(name,style: UITextStyles.drawerHeaderTextStyle),
                Row(
                  children: [
                    Text("@testnick",style: UITextStyles.drawerHeaderTextStyle),
                    // MyIconButtonWidget(
                    //     icon: Icons.edit,
                    //     color: UIColorsHelper.light_body_IconColor,
                    //     size: UISizeHelper.inBoxIconsSize,
                    //     onPressed: ()=>{})
                  ],
                )
              ],
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