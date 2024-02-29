import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qcop/resources/resources.dart';
import 'package:qcop/screens/download_screen.dart';
import 'package:qcop/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../local_database/models/qa_level1_model.dart';
import 'dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
//when checkbox is selected true by default then we want to perform opertion from 2nd time how can we do that

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;
  String project = "";
  bool isListDownloaded = false;
  bool isListNotDownloaded = false;
  List<QAlevel1Model> level1List = [];


  void checkLoginStatus() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    bool downloadedStatus = prefs.getBool('isListDownloaded') ?? false;
    print('splash data: $downloadedStatus');
    // setState(() {
    //   isListDownloaded = downloadedStatus;
    //   print('checking downloading status');
    // });
    if(isLoggedIn) {
     if(downloadedStatus) {
       print('isLoggedIn: $isLoggedIn, downloadedStatus: $downloadedStatus');
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
     } else {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DownloadScreen(projectname: project)));
     }
    }
    else {
      print('not log in');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

void check() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool downloadedStatus = prefs.getBool('isListDownloaded') ?? false;

  setState(() {
    isListDownloaded = downloadedStatus;
  });
  if(downloadedStatus){
     print('list downloaded');
  }else {
    print('list is not downloaded');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DashboardScreen()),
    );
  }
}

  @override
  void initState() {

    Future.delayed(Duration(seconds: 3), () {
      checkLoginStatus();
     // Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (_) => LoginScreen()));
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
