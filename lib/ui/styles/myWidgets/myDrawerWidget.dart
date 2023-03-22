import 'package:btwlate/screens/settings.dart';
import 'package:btwlate/ui/helper/uiColorsHelper.dart';
import 'package:btwlate/ui/helper/uiSizeHelper.dart';
import 'package:btwlate/ui/helper/uiTextHelper.dart';
import 'package:btwlate/ui/styles/myWidgets/myIconButtonWidget.dart';
import 'package:btwlate/ui/styles/styles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../screens/favorites.dart';

class drawerWidget extends StatelessWidget {
  const drawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(color: UIColorsHelper.light_Drawer_header),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(radius: UISizeHelper.drawerAvatarRadius,),
                Text("NAME SURNAME",style: UITextStyles.drawerHeaderTextStyle),
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
            onTap: ()=>Get.to(()=>const favoritesPage()),
          ),
          ListTile(
            title: Text(UITextHelper.settings,style: UITextStyles.drawerBodyTextStyle,),
            onTap: ()=>Get.to(()=>const settingsPage()),
          ),

        ],
      ),
    );
  }
}