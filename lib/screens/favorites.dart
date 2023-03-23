import 'package:btwlate/controller/translatePageController.dart';
import 'package:btwlate/screens/translate.dart';
import 'package:btwlate/ui/helper/uiSizeHelper.dart';
import 'package:btwlate/ui/helper/uiTextHelper.dart';
import 'package:btwlate/ui/styles/myWidgets/myGeneralWidget.dart';
import 'package:btwlate/ui/styles/myWidgets/myIconButtonWidget.dart';
import 'package:btwlate/ui/styles/styles/decorationStyles.dart';
import 'package:btwlate/ui/styles/styles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../ui/helper/uiColorsHelper.dart';
import '../ui/helper/uiSpaceHelper.dart';

class favoritesPage extends StatefulWidget {
  const favoritesPage({Key? key}) : super(key: key);

  @override
  State<favoritesPage> createState() => _favoritesPageState();
}

class _favoritesPageState extends State<favoritesPage> {
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    box.initStorage; // initialize the storage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColorsHelper.light_Background,
      body: SingleChildScrollView(
          child: Column(
        children: [
          GeneralThemeWidgetStyle(
              iconChild: const Icon(Icons.arrow_back_ios),
              headerIconFunc: () => Get.to(() => TranslatePage()),
              height: UISpaceHelper.dynamicHeight(context, UISizeHelper.smallHeaderHeight),
              child: Text(
                UITextHelper.favoritesHeader,
                style: UITextStyles.PagesHeaderStyle,
              )),

          // ! hata baslangıç**************************

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: InBoxIconsController.favoritesList.length,
            itemBuilder: (BuildContext context, int index) {
              Map favorite = InBoxIconsController.favoritesList[index];
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  setState(() {
                    InBoxIconsController.favoritesList.removeAt(index);
                  });
                },
                background: Container(
                  color: Colors.red,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                  ),
                ),
                direction: DismissDirection.endToStart,
                child: Container(
                  decoration: UIDecorationStyles.settingsListTileContainerStyle,
                  child: ListTile(
                    title: Text(favorite['kelime']!),
                    subtitle: Text(favorite['anlami']!),
                    trailing: MyIconButtonWidget(
                      color: UIColorsHelper.light_settingsIconColor,
                      size: UISizeHelper.iconSelectLang1Size,
                      onPressed: (){
                        setState(() {
                          InBoxIconsController.favoritesList.removeAt(index);
                        });
                      },
                      icon: Icons.delete,
                    ),
                  ),
                ),
              );
            },
          ),
          //
          //! hata bitiş**********************
        ],
      )),
    );
  }
}
