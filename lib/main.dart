import 'package:flutter/material.dart';
import 'package:pie_chart_widget/widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final int _hot = 35;
  final int _warm = 35;
  final int _cold = 90;
  final int total = 160;

  Widget _count(int type){
    int percentage = ((type/total)*100).floor() as int;
    return Row(
      children: [
        Text(type.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(width: 10,),
        Text('$percentage%',style: TextStyle(fontWeight: FontWeight.w300),),
      ],
    );
  }

  Widget _types(Color color,String type){

    return Row(
      children: [
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle,color: color),
          width: 10,
          height: 10,
        ),
        SizedBox(width: 10,),
        Text(type),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Container(
          width: double.infinity,
        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Prospect by Status',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  RingPieChart(
                    values: [_hot,_warm,_cold],
                    colors: [Colors.red,Colors.yellow,Colors.blue],
                    width: 10,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(total.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        Text('Total Prospects',style: TextStyle(fontWeight: FontWeight.w400),),
                      ],
                    ),
                  )
                ],
              ),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _types(Colors.red, 'Hot'),
                  SizedBox(height: 10,),
                  _types(Colors.yellow, 'Warm'),
                  SizedBox(height: 10,),
                  _types(Colors.blue, 'Cold'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _count(_hot),
                  SizedBox(height: 10,),
                  _count(_warm),
                  SizedBox(height: 10,),
                  _count(_cold)
                ],
              )
              ],
            )
          ],
                ),
      ),
      ),
    );
  }
}