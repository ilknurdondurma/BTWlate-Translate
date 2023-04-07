import 'package:btwlate/ui/styles/myWidgets/my_spinkit_widget.dart';

import '../auth/email_sign.dart';

class EmailSignPageController{
  static void signUpButton(emailController,passwordController){
    const MySpinkit();
    EmailSign.signUpWithEmailAndPassword(emailController, passwordController);

  }
}