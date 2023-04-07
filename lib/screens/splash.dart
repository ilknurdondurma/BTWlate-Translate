import 'package:btwlate/screens/translate.dart';
import 'package:btwlate/ui/helper/constants/ui_colors_helper.dart';
import 'package:btwlate/ui/helper/constants/ui_text_helper.dart';
import 'package:btwlate/ui/styles/styles/text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  final FirebaseAuth _auth = FirebaseAuth.instance;



  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 2),
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TranslatePage(
                name: _auth.currentUser?.displayName ?? _auth.currentUser?.email.toString(),
                photo: _auth.currentUser?.photoURL??"https://yt3.ggpht.com/ytc/AKedOLS5ajMs0W8nbRxMvKohv2vA1K7bjjhMjvvryNV9dg=s900-c-k-c0x00ffffff-no-rj",), // google ile giris yaplmişsa onceden
              ),));

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(begin: const Offset(0, 0.0), end: const Offset(0, -2))
        .animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutBack,
        reverseCurve: Curves.easeInOutBack));
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UIColorsHelper.splashBackgroundColor,
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


