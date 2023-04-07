import 'package:btwlate/auth/firebase/firebase_controller.dart';
import 'package:btwlate/ui/helper/constants/ui_size_helper.dart';
import 'package:btwlate/ui/helper/constants/ui_text_helper.dart';
import 'package:btwlate/ui/styles/myWidgets/my_general_widget.dart';
import 'package:btwlate/ui/styles/myWidgets/my_listtile_widget.dart';
import 'package:btwlate/ui/styles/styles/text_styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/helper/constants/ui_colors_helper.dart';
import '../ui/helper/constants/ui_space_helper.dart';
import '../ui/styles/styles/decoration_styles.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColorsHelper.scaffoldBackground,
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
              headerIconFunc: () =>
                  Get.back(),
              height: UISpaceHelper.dynamicHeight(
                  context, UISizeHelper.smallHeaderHeight),
              child: Text(
                UITextHelper.favoritesHeader,
                style: UITextStyles.pagesHeaderStyle,
              ),
            ),
            SizedBox(
              height: UISpaceHelper.dynamicHeight(context, 1),
              child: FutureBuilder<DocumentSnapshot>(
                future: FireBaseController.getFavoritesController(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
                  List<String> fieldList = [];
                  data.forEach((key, value) {
                    fieldList.add('$key   :   $value');
                  });
                  return ListView.builder(
                    itemCount: fieldList.length,
                    itemBuilder: (BuildContext context, int index) {
                      String field = fieldList[index];
                      return Dismissible(
                        direction: DismissDirection.endToStart,
                        key: Key(field[index]),
                        onDismissed: (direction)  {
                          FireBaseController.deleteFavoriteController(field);
                        },
                        background: Container(color: Colors.red),
                        child:MyListTileContainer(
                          containerDecoration: UIDecorationStyles.settingsListTileContainerStyle,
                          color: UIColorsHelper.deleteIconColor,
                          icon: Icons.keyboard_double_arrow_left_outlined,
                          onPressed: ()=>{
                              setState(() {
                              FireBaseController.deleteFavoriteController(field);
                              })
                          },
                          size: UISizeHelper.inBoxIconsSize,
                          text: field,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}