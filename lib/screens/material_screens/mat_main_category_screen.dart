import 'package:flutter/material.dart';
import 'package:qcop/screens/material_screens/mat_check_points_screen.dart';

import 'mat_category_screen.dart';

class MatCategoryMainScreen extends StatefulWidget {
  const MatCategoryMainScreen({super.key});

  @override
  State<MatCategoryMainScreen> createState() => _MatCategoryMainScreenState();
}

class _MatCategoryMainScreenState extends State<MatCategoryMainScreen> {

  var isOnCheckPointScreen = false;

  late ValueChanged<bool> onChange;

  @override
  void initState() {

    onChange = (value) {
      setState(() {
        isOnCheckPointScreen = value;
      });
    };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {

        if (isOnCheckPointScreen) {
          setState(() {
            isOnCheckPointScreen = false;
          });

          return false;
        } else {

          return true;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: isOnCheckPointScreen ? MatCheckPointsScreen() : MatCategoryScreen(onChange: onChange),
      ),
    );
  }
}
