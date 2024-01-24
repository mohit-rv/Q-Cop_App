import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../resources/resources.dart';
import 'package:pie_chart/pie_chart.dart' as pie;

class DLRTowerScreen extends StatefulWidget {
//  final List<Map<String, dynamic>> recgridList2;
  final String rectitle1;
  DLRTowerScreen({required this.rectitle1});

  @override
  State<DLRTowerScreen> createState() => _DLRTowerScreenState();
}

class _DLRTowerScreenState extends State<DLRTowerScreen> {

  final betweenSpace = 0.2;     //space between bars
  BarChartGroupData genrateGroupData(
      int x,double plates,double quickWorkout,double cycle){
    return BarChartGroupData(
        x: x,
        groupVertically: true,
      barRods: [
        BarChartRodData(
            fromY:0,
            toY: plates,
            color: Colors.blue,
            width: 14
        ),
        BarChartRodData(
            fromY:plates+betweenSpace,
            toY: plates + betweenSpace+ quickWorkout,
            color: Color(0xFFF10000),
            width: 14
        ),
        BarChartRodData(
            fromY: plates+betweenSpace+quickWorkout+betweenSpace,
            toY: plates+betweenSpace+quickWorkout+betweenSpace+cycle,
            color: Color(0xFFE26FA9),
            width: 14
        ),

      ]
    );
  }


  List<Color> colorList = [
    Color(0xFF02EC00),
    Colors.black.withOpacity(0.05)
  ];

  List<Color> colorList2 = [
    Color(0xFF0000F1),
    Colors.black.withOpacity(0.05)
  ];

  List<Color> colorList3 = [
    Color(0xFFF10000),
    Colors.black.withOpacity(0.05)
  ];

  List<Color> colorList4 = [
    Color(0xFFE26FA9),
    Colors.black.withOpacity(0.05)
  ];

  List<Color> colorList5 = [
    Color(0xFFEBA10F),
    Colors.black.withOpacity(0.05)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
          //  textValue(),
          Text(
            '${widget.rectitle1}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'Poppins Semibold',
              fontWeight: FontWeight.w600,
              height: 0.11,
            ),
          ),

            Image(image: AssetImage(Resources.arrowIcon),height: 18,width: 18,),

            Text(
              'Tower',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Poppins Semibold',
                fontWeight: FontWeight.w600,
                height: 0.11,
              ),
            ),
          ],
        ),
        centerTitle: true,
        flexibleSpace: Container(
          color: Color(0xFF0C3C89),
          padding: EdgeInsets.only(right: 24,left: 24,top: 30),
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: (){Navigator.pop(context);},
            child: Image(image: AssetImage(Resources.backIcon),width: 28,
              height: 28,),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xFF0C3C89),
            height: MediaQuery.of(context).size.height,
          ),

          Container(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Text(
                  //   'Activity',
                  //   style: TextStyle(
                  //     color: Colors.yellowAccent,
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  //   const SizedBox(height: 8),
                  // LegendsListWidget(
                  //   legends: [
                  //     Legend('Pilates', pilateColor),
                  //     Legend('Quick workouts', quickWorkoutColor),
                  //     Legend('Cycling', cyclingColor),
                  //   ],
                  // ),
                  // const SizedBox(height: 14),
                  Container(
                    margin: EdgeInsets.only(top: 85,right: 20),
                    child: AspectRatio(
                      aspectRatio: 2,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceBetween,
                          titlesData: FlTitlesData(
                            rightTitles: const AxisTitles(),
                            topTitles: const AxisTitles(),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: bottomTitles,

                                //  reservedSize: 20,
                              ),
                            ),
                          ),
                          barTouchData: BarTouchData(enabled: false),
                          borderData: FlBorderData(show: false),
                          gridData: const FlGridData(show: false),
                          barGroups: [
                            genrateGroupData(0, 3, 4, 4),
                            genrateGroupData(1, 2, 9, 3),
                            genrateGroupData(2, 2.5, 7, 4),
                            genrateGroupData(3, 3.1, 5.9, 3.1),
                            genrateGroupData(4, 2.5, 6.5, 3.4),
                            genrateGroupData(5, 3.5, 5.7, 2.5),
                            // generateGroupData(6, 1.3, 3.2, 2),
                            // generateGroupData(7, 2.3, 3.2, 3),
                            // generateGroupData(8, 2, 4.8, 2.5),
                            // generateGroupData(9, 1.2, 3.2, 2.5),
                            // generateGroupData(10, 1, 4.8, 3),
                            // generateGroupData(11, 2, 4.4, 2.8),
                          ],
                          maxY: 11 + (betweenSpace * 3),
                          // extraLinesData: ExtraLinesData(
                          //   horizontalLines: [
                          //     HorizontalLine(
                          //       y: 3.3,
                          //       color: Colors.white,
                          //       strokeWidth: 1,
                          //       dashArray: [20, 4],
                          //     ),
                          //     HorizontalLine(
                          //       y: 8,
                          //       color: Colors.white,
                          //       strokeWidth: 1,
                          //       dashArray: [20, 4],
                          //     ),
                          //     HorizontalLine(
                          //       y: 11,
                          //       color: Colors.white,
                          //       strokeWidth: 1,
                          //       dashArray: [20, 4],
                          //     ),
                          //   ],
                          // ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.38),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50)
                )
              )
            ),
             child: Column(
               children: [
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height/4,
                        width: MediaQuery.of(context).size.width/3,
                          child: pieChartOne()
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height/4,
                          width: MediaQuery.of(context).size.width/3,
                          child: pieCharttwo()
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height/4,
                        width: MediaQuery.of(context).size.width/3,
                        child: pieChartthree(),
                      ),

                    ],
                  ),
                 Row(
                   children: [
                       Container(
                         height: MediaQuery.of(context).size.height/6,
                         width: MediaQuery.of(context).size.width/3,
                         child: pieChartfour(),
                       ),
                     Container(
                       height: MediaQuery.of(context).size.height/6,
                       width: MediaQuery.of(context).size.width/3,
                       child: pieChartfive(),
                     )
                   ],
                 )
               ],
             ),
          ),
        ],
      ),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'TEST 1';
        break;
      case 1:
        text = 'TEST 2';
        break;
      case 2:
        text = 'TEST 3';
        break;
      case 3:
        text = 'TEST 4';
        break;
      case 4:
        text = 'TEST 5';
        break;
      case 5:
        text = 'TEST 6';
        break;

      default:
        text = '';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: TextStyle(
        // color: Color(0xFF7B8189),
        color: Colors.white,
        fontSize: 10,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        height: 0,
      ),),
    );
  }


  Widget pieChartOne(){
    return pie.PieChart(       //piechart
      dataMap: {
        "closed" : 20,
        "temp" : 4
      },
      animationDuration: Duration(milliseconds: 900),
      //chartLegendSpacing: 5,
      chartRadius: MediaQuery.of(context).size.width / 4,
      colorList: colorList,
      // emptyColor: Color(0xFF02EC00),
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      emptyColor: Colors.white,
      //totalValue: 6,
      ringStrokeWidth: 10,
      centerText: "CLOSED  \n15%",
      centerTextStyle: TextStyle(
        color: Color(0xFF394A5D),
        fontSize: 13,
        fontFamily: 'Mukta',
        fontWeight: FontWeight.w600,
        height: 0,
      ),
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: false,
        //legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: false,
        showChartValues: false,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );
  }


  Widget pieCharttwo(){
    return pie.PieChart(             //piechart
      dataMap: {
        "closed" : 15,
        "temp" : 4

      },
      animationDuration: Duration(milliseconds: 900),
      //chartLegendSpacing: 5,
      chartRadius: MediaQuery.of(context).size.width / 4,
      colorList: colorList2,
      // emptyColor: Color(0xFF02EC00),
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      emptyColor: Colors.white,
      //totalValue: 6,
      ringStrokeWidth: 10,
      centerText: "NEW  \n15%",
      centerTextStyle: TextStyle(
        color: Color(0xFF394A5D),
        fontSize: 13,
        fontFamily: 'Mukta',
        fontWeight: FontWeight.w600,
        height: 0,
      ),
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: false,
        //legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: false,
        showChartValues: false,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );
  }

  Widget pieChartthree(){
    return pie.PieChart(             //piechart
      dataMap: {
        "closed" : 15,
        "temp" : 5

      },
      animationDuration: Duration(milliseconds: 900),
      //chartLegendSpacing: 5,
      chartRadius: MediaQuery.of(context).size.width / 4,
      colorList: colorList3,
      // emptyColor: Color(0xFF02EC00),
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      emptyColor: Colors.white,
      //totalValue: 6,
      ringStrokeWidth: 10,
      centerText: "REOPEN  \n25%",
      centerTextStyle: TextStyle(
        color: Color(0xFF394A5D),
        fontSize: 13,
        fontFamily: 'Mukta',
        fontWeight: FontWeight.w600,
        height: 0,
      ),
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: false,
        //legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: false,
        showChartValues: false,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );
  }


  Widget pieChartfour(){
    return pie.PieChart(             //piechart
      dataMap: {
        "closed" : 15,
        "temp" : 8

      },
      animationDuration: Duration(milliseconds: 900),
      //chartLegendSpacing: 5,
      chartRadius: MediaQuery.of(context).size.width / 4,
      colorList: colorList4,
      // emptyColor: Color(0xFF02EC00),
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      emptyColor: Colors.white,
      //totalValue: 6,
      ringStrokeWidth: 10,
      centerText: "OPEN  \n24%",
      centerTextStyle: TextStyle(
        color: Color(0xFF394A5D),
        fontSize: 13,
        fontFamily: 'Mukta',
        fontWeight: FontWeight.w600,
        height: 0,
      ),
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: false,
        //legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: false,
        showChartValues: false,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );
  }

  Widget pieChartfive(){
    return pie.PieChart(             //piechart
      dataMap: {
        "closed" : 15,
        "temp" : 4

      },
      animationDuration: Duration(milliseconds: 900),
      //chartLegendSpacing: 5,
      chartRadius: MediaQuery.of(context).size.width / 4,
      colorList: colorList5,
      // emptyColor: Color(0xFF02EC00),
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      emptyColor: Colors.white,
      //totalValue: 6,
      ringStrokeWidth: 10,
      centerText: "COMPLETED  \n15%",
      centerTextStyle: TextStyle(
        color: Color(0xFF394A5D),
        fontSize: 13,
        fontFamily: 'Mukta',
        fontWeight: FontWeight.w600,
        height: 0,
      ),
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: false,
        //legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: false,
        showChartValues: false,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );
  }


  //  textValue() {
  //   // Use if, else if, and else to conditionally return different Text widgets
  //   if(widget.recgridList2[0]['title']=='QA'){
  //     return Text(
  //       '${widget.rectitle1}',
  //       style: TextStyle(
  //         color: Colors.white,
  //         fontSize: 15,
  //         fontFamily: 'Poppins Semibold',
  //         fontWeight: FontWeight.w600,
  //         height: 0.11,
  //       ),
  //     );
  //   }else if (widget.recgridList2[1]['title']=='EHS') {
  //     return Text(
  //       '${widget.rectitle2}',
  //       style: TextStyle(
  //         color: Colors.white,
  //         fontSize: 15,
  //         fontFamily: 'Poppins Semibold',
  //         fontWeight: FontWeight.w600,
  //         height: 0.11,
  //       ),
  //     );
  //   } else if(!widget.recgridList2[2]['title']=='SNAG') {
  //     return Text(
  //     '${widget.rectitle3}',
  //   style: TextStyle(
  //   color: Colors.white,
  //   fontSize: 15,
  //   fontFamily: 'Poppins Semibold',
  //   fontWeight: FontWeight.w600,
  //   height: 0,
  //   ),
  //   );
  // } else if(!widget.recgridList2[3]['title']=='NS') {
  //     return Text(
  //       '${widget.rectitle4}',
  //       style: TextStyle(
  //         color: Colors.white,
  //         fontSize: 15,
  //         fontFamily: 'Poppins Semibold',
  //         fontWeight: FontWeight.w600,
  //         height: 0,
  //       ),
  //     );
  //   } else if(!widget.recgridList2[4]['title']=='MAT') {
  //     return Text(
  //       '${widget.rectitle5}',
  //       style: TextStyle(
  //         color: Colors.white,
  //         fontSize: 15,
  //         fontFamily: 'Poppins Semibold',
  //         fontWeight: FontWeight.w600,
  //         height: 0,
  //       ),
  //     );
  //   }
  // }




}
