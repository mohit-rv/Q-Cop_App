import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qcop/screens/qa_screens/qa_category_check_points_screen.dart';
import 'package:qcop/screens/qa_screens/qa_category_screen.dart';

class QACategoryMainScreen extends StatefulWidget {
  const QACategoryMainScreen({super.key});

  @override
  State<QACategoryMainScreen> createState() => _QACategoryMainScreenState();
}

class _QACategoryMainScreenState extends State<QACategoryMainScreen> {

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
        body: isOnCheckPointScreen ? QACheckPointsScreen() : QACategoryScreen(onChange: onChange,),
      ),
    );
  }
}
