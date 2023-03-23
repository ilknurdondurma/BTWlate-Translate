import 'package:btwlate/controller/translatePageController.dart';
import 'package:btwlate/screens/translate.dart';
import 'package:btwlate/ui/helper/uiTextHelper.dart';
import 'package:btwlate/ui/styles/myWidgets/myGeneralWidget.dart';
import 'package:btwlate/ui/styles/styles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../ui/helper/uiColorsHelper.dart';

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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColorsHelper.light_Background,
      body: SingleChildScrollView(
          child: Column(
            children: [
              GeneralThemeWidgetStyle(
                  child: Text(UITextHelper.favoritesHeader,style: UITextStyles.PagesHeaderStyle,),
                  iconChild: Icon(Icons.arrow_back_ios),
                  headerIconFunc: ()=>Get.to(()=>TranslatePage())
              ),





    // ! hata baslangıç**************************

              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemCount: InBoxIconsController.favoritesList.length,
              //   itemBuilder: (BuildContext context, int index) {
              //     Map favorite = InBoxIconsController.favoritesList[index];
              //     return ListTile(
              //       title: Text(favorite['kelime']!),
              //       subtitle: Text(favorite['anlami']!),
              //     );
              //   },
              // ),
              //
    //! hata bitiş**********************









            ],
          )),
    );
  }
}
