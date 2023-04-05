

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MySpinkit extends StatelessWidget {
  const MySpinkit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitWanderingCubes(
        color: Colors.white,
        size: 150,
        duration: Duration(milliseconds: 250),
      ),
    );
  }
}