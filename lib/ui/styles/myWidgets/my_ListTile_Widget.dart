import 'package:flutter/material.dart';

import '../../helper/constants/ui_size_helper.dart';
import '../styles/text_styles.dart';
import 'my_Icon_Button_Widget.dart';

class MyListTileContainer extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final double size;
  final Function() onPressed;
  final Decoration containerDecoration;


  const MyListTileContainer({super.key,
    required this.text,
    required this.icon,
    required this.color,
    required this.size,
    required this.onPressed,
    required this.containerDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerDecoration,
      height: UISizeHelper.listTileHeight,
      child: GestureDetector(
        onTap: ()=>onPressed(),
        child: ListTile(
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text,style: UITextStyles.settingsPageStyle,),
                MyIconButtonWidget(icon: icon, color: color, size: size, onPressed: ()=>onPressed()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}