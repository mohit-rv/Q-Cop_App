import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:qcop/resources/resources.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class NotSettingScreen extends StatefulWidget {
  const NotSettingScreen({super.key});

  @override
  State<NotSettingScreen> createState() => _NotSettingScreenState();
}

class _NotSettingScreenState extends State<NotSettingScreen> {

  bool value = false;
  bool theme = false;
  final valuet = ValueNotifier<bool>(false);   //advance switch

  @override
  void initState() {
    valuet.addListener(() {
      setState(() {
        if(valuet.value){
          theme=true;
        }else{theme=false;}
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        elevation: 8,
        title: Text(
          '        Notifiaction Setings',
          style: TextStyle(
            color: Color(0xFF191D31),
            fontSize: 18,
            fontFamily: 'Poppins Semibold',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        flexibleSpace: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 20, left: 24, right: 24),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 46,
                  height: 46,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 8, right: 8),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFF3F3F3),
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Image(
                    image: AssetImage(Resources.backIcon),
                    width: 12,
                    height: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: 327,
            height: 56,
            margin: EdgeInsets.all(18),
            decoration: ShapeDecoration(
              color: Color(0xFFDDEAFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              )
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 18),
                  child: Text(
                    'In App',
                    style: TextStyle(
                      color: Color(0xFF191D31),
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0.10,
                    ),
                  ),
                ),

                //
                // Container(
                //   margin: EdgeInsets.only(right: 12),
                //   child: Transform.scale(
                //     scale: 1,
                //     child: CupertinoSwitch(
                //
                //          value: value,
                //          onChanged: (onChanged) {
                //             setState(() {
                //               value = onChanged;
                //             });
                //      },
                //
                //       activeColor: Color(0xFF0C3C89),
                //        trackColor: Colors.grey,
                //       // inactiveTrackColor: ,
                //      ),
                //   ),
                // ),


              // LiteRollingSwitch(
              //   value: true,
              //  width: 150,
              //   textOn: 'active',
              //   textOff: 'inactive',
              //   colorOn: Color(0xFF0C3C89),
              //   colorOff: Colors.blueGrey,
              //   iconOn: Icons.lightbulb_outline,
              //   iconOff: Icons.power_settings_new,
              //   animationDuration: const Duration(milliseconds: 300),
              //   onChanged: (bool state) {
              //     print('turned ${(state) ? 'on' : 'off'}');
              //   }, onTap: (){
              //
              // }, onDoubleTap: (){}, onSwipe: (){},
              //
              // ),

                Container(
                  margin: EdgeInsets.only(right: 18),
                  child: AdvancedSwitch(
                    controller: valuet,
                    enabled: true,
                    width: 38,
                    height: 20,
                    borderRadius: BorderRadius.circular(120),
              //    inactiveColor: ,
                    activeColor: Color(0xFF0C3C89),
                  ),
                )
                


              ],
            ),
          )
        ],
      ),
    );
  }
}
