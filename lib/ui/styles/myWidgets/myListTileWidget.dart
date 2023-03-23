import 'package:flutter/material.dart';

import '../../helper/uiSizeHelper.dart';
import '../styles/decorationStyles.dart';
import '../styles/textStyles.dart';
import 'myIconButtonWidget.dart';

class ListTileContainer extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final double size;
  final Function() onPressed;

  const ListTileContainer({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    required this.size,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: UIDecorationStyles.settingsListTileContainerStyle,
      height: UISizeHelper.listTileHeight,
      child: GestureDetector(
        onTap: ()=>onPressed(),
        child: ListTile(
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text,style: UITextStyles.settingsPageStyle,),
                MyIconButtonWidget(icon: icon, color: color, size: size, onPressed: ()=>onPressed())
              ],
            ),
          ),
        ),
      ),
    );
  }
}