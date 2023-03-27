import 'package:btwlate/screens/translate.dart';
import 'package:btwlate/ui/helper/uiSizeHelper.dart';
import 'package:btwlate/ui/helper/uiTextHelper.dart';
import 'package:btwlate/ui/styles/myWidgets/myGeneralWidget.dart';
import 'package:btwlate/ui/styles/styles/textStyles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/helper/uiColorsHelper.dart';
import '../ui/helper/uiSpaceHelper.dart';

class favoritesPage extends StatefulWidget {
  const favoritesPage({Key? key}) : super(key: key);

  @override
  State<favoritesPage> createState() => _favoritesPageState();
}

class _favoritesPageState extends State<favoritesPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  void initState() {
    super.initState();
    // initialize the storage
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
              headerIconFunc: () =>
                  Get.to(() => TranslatePage()),
              height: UISpaceHelper.dynamicHeight(
                  context, UISizeHelper.smallHeaderHeight),
              child: Text(
                UITextHelper.favoritesHeader,
                style: UITextStyles.PagesHeaderStyle,
              ),
            ),
            Container(
              height: UISpaceHelper.dynamicHeight(context, 1),
              child: FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(auth.currentUser?.email)
                    .get(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
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
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(auth.currentUser?.email)
                              .update({field.split('   :   ')[0]: FieldValue.delete()});
                          setState(() {
                            fieldList.removeAt(index);
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