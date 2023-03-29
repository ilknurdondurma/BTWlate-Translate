import 'package:btwlate/ui/helper/ui_size_helper.dart';
import 'package:btwlate/ui/helper/ui_text_helper.dart';
import 'package:btwlate/ui/styles/myWidgets/myGeneralWidget.dart';
import 'package:btwlate/ui/styles/styles/text_styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/helper/ui_colors_helper.dart';
import '../ui/helper/ui_space_helper.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColorsHelper.lightBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GeneralThemeWidgetStyle(
              iconChild: const Icon(Icons.arrow_back_ios),
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
              child: FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(auth.currentUser?.email)
                    .get(),
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
                        key: Key(field),
                        onDismissed: (direction) async {
                         setState(() async {
                           await FirebaseFirestore.instance
                               .collection('users')
                               .doc(auth.currentUser?.email)
                               .update({field.split('   :   ')[0]: FieldValue.delete()});
                           setState(() {
                             fieldList.removeAt(index);
                           });
                         });
                        },
                        background: Container(color: Colors.red),
                        child: ListTile(
                          title: Text(field),
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