import 'package:btwlate/screens/translate.dart';
import 'package:btwlate/ui/helper/uiColorsHelper.dart';
import 'package:btwlate/ui/helper/uiTextHelper.dart';
import 'package:btwlate/ui/styles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 2),
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => translatePage()),));

    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(begin: Offset(0, 0.0), end: Offset(0, -2))
        .animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutBack,
        reverseCurve: Curves.easeInOutBack));
  }
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UIColorsHelper.light_Header_Background,
        body: Center(
            child:SlideTransition(
              position: _offsetAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.translate,size: 50,color: UIColorsHelper.splashIconColor,),
                  Text(UITextHelper.btwlate,style: UITextStyles.splashStyle,),
                  Text(UITextHelper.thereDot,style: UITextStyles.splashStyle),
                ],
              )
            )
        ));
  }

}


