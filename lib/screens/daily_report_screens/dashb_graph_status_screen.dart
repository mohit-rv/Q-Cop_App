//import 'package:fl_chart_app/presentation/resources/app_resources.dart';
import 'package:fl_chart/fl_chart.dart' as flpie;
import 'package:fl_chart/fl_chart.dart';
// import 'package:fl_chart_app/presentation/widgets/indicator.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:qcop/resources/resources.dart';
import 'package:pie_chart/pie_chart.dart' as pie;

class QAProjectScreen extends StatefulWidget {

  final String rectitle1;
  QAProjectScreen({required this.rectitle1});

  @override
  State<StatefulWidget> createState() => QAProjectScreenState();
}

class QAProjectScreenState extends State<QAProjectScreen> {

  int touchedIndex = -1;

  int key = 0;
  Map<String, double> dataMap = {
    "E": 5,
  };

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
   // var gridLis;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
            "${widget.rectitle1}",
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
              'Project',
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
            //  color: Color(0xFF0000F1),
              color: Color(0xFF0C3C89),
              height: MediaQuery.of(context).size.height,
            ),


            Container(
              margin: EdgeInsets.only(bottom: 400,left: 43),

                child: AspectRatio(
                  aspectRatio: 1,
                  child: flpie.PieChart(      //flpie chart
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        },

                      ),
                      borderData: FlBorderData(
                        show: true,
                      ),


                      startDegreeOffset: 220,

                      sectionsSpace: 5,
                      centerSpaceRadius: 80,
                        centerSpaceColor: Colors.white,
                    //  centerSpaceColor: Colors.white,
                      sections: showingSections(),

                    ),
                  ),
                ),

            ),
            // const Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: <Widget>[
            //     Indicator(
            //       color: AppColors.contentColorBlue,
            //       text: 'First',
            //       isSquare: true,
            //     ),
            //     SizedBox(
            //       height: 4,
            //     ),
            //     Indicator(
            //       color: AppColors.contentColorYellow,
            //       text: 'Second',
            //       isSquare: true,
            //     ),
            //     SizedBox(
            //       height: 4,
            //     ),
            //     Indicator(
            //       color: AppColors.contentColorPurple,
            //       text: 'Third',
            //       isSquare: true,
            //     ),
            //     SizedBox(
            //       height: 4,
            //     ),
            //     // Indicator(
            //     //   color: AppColors.contentColorGreen,
            //     //   text: 'Fourth',
            //     //   isSquare: true,
            //     // ),
            //     SizedBox(
            //       height: 18,
            //     ),
            //   ],
            // ),

            Container(
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
                         width: MediaQuery.of(context).size.width / 3,
                         height:  MediaQuery.of(context).size.height / 4,
                      //   height: 45,
                         child: pieChartOne()
                     ),
                      Container(
                        height: MediaQuery.of(context).size.height /4,
                          width: MediaQuery.of(context).size.width/3,
                          child: pieCharttwo()
                      ),

                     Container(
                         height: MediaQuery.of(context).size.height /4,
                         width: MediaQuery.of(context).size.width/3,
                         child: pieChartthree()
                     ),

                   ],
                 ),

                 Row(
                   children: [
                     Container(
                    //   margin: EdgeInsets.only(botto),
                         height: MediaQuery.of(context).size.height /6,
                         width: MediaQuery.of(context).size.width/3,
                         child: pieChartfour()),
                     Container(
                         height: MediaQuery.of(context).size.height /6,
                         width: MediaQuery.of(context).size.width/3,
                         child: pieChartfive()),

                   ],
                 ),

               ],
             ),
            )

          ],
               ),
       );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(5, (i) {
      final isTouched = i == touchedIndex;
    //  final fontSize = isTouched ? 25.0 : 16.0;
   //   final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.white, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(

         //   borderSide: BorderSide(width: 5,color: Color(0xFF0C3C89),),
            color: Color(0xFF02EC00),
            value: 18,
            title: '14%',
          //  radius: radius,
            titleStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Poppins Semibold',
              fontWeight: FontWeight.w600,
              height: 0.08,
            ),
          );
        case 1:
          return PieChartSectionData(
          //  borderSide: BorderSide(width: 5,color: Color(0xFF0C3C89)),
            color: Color(0xFFE26FA9),
            value: 40,
            title: '24%',
        //    radius: radius,
            titleStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Poppins Semibold',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          );
        case 2:
          return PieChartSectionData(
         //   borderSide: BorderSide(width: 5,color: Color(0xFF0C3C89)),
            color: Color(0xFFEBA10F),
            value: 19,
            title: '15%',
        //    radius: radius,
            titleStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Poppins Semibold',
              fontWeight: FontWeight.w600,
              height: 0.08,
            ),
          );
        case 3:
          return PieChartSectionData(
       //     borderSide: BorderSide(width: 10,color: Color(0xFF0C3C89),),
            color: Color(0xFFF10000),
            value: 48,
            title: '25%',
         //   radius: radius,
            titleStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Poppins Semibold',
              fontWeight: FontWeight.w600,
              height: 0.08,
            ),
          );
        case 4:
          return PieChartSectionData(
            color: Color(0xFF4497C6),
            value: 18,
            title: '15%',
        //    radius: radius,
            titleStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Poppins Semibold',
              fontWeight: FontWeight.w600,
              height: 0.08,
            ),
          );
        default:
          throw Error();
      }
    });
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



}
