import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qcop/resources/resources.dart';
import 'package:qcop/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    Future.delayed(Duration(seconds: 3), () {

      Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (_) => LoginScreen()));

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      body: Stack(
        children: [
          const Image(
              image: AssetImage(Resources.splashScreen),
              fit: BoxFit.contain,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                    image: AssetImage(Resources.qcopImg)
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40, top: 8),
                  child: const Text(
                    "India's best & first construction management software",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF0B3C88),
                      fontSize: 14,
                      fontFamily: 'PTSerif Bold',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
