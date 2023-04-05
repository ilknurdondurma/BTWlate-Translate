import 'package:btwlate/screens/translate.dart';
import 'package:btwlate/ui/styles/myWidgets/my_spinkit_Widget.dart';

import '../auth/email_sign.dart';

class EmailSignPageController{
  static void signUpButton(emailController,passwordController){
    MySpinkit();
    EmailSign.signUpWithEmailAndPassword(emailController, passwordController);

  }
}