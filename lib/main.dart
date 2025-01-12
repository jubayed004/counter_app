import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

int count = 0;

increment() async {
 SharedPreferences preferences =await SharedPreferences.getInstance();
   count++;
   setState(() {
   });

   ///countvalues modde save hoia thakbe.....amra jode kono kiso onno screen niye jai tokhon save hoia thakbe oi values golo
 ///count modde joto sonkha ache sei goloi jeeno ai khne store hoi......
   preferences.setInt("countValues", count);
}

decrement() async {
 SharedPreferences preferences =await SharedPreferences.getInstance();
   count--;
   setState(() {
     ///countvalues modde save hoia thakbe.....amra jode kono kiso onno screen niye jai tokhon save hoia thakbe oi values golo
     ///count modde joto sonkha ache sei goloi jeeno ai khne store hoi......

     preferences.setInt("countValues", count);
   });

}
@override
  void initState() {
  action();
    super.initState();
  }

action() async {
  SharedPreferences preferences =await SharedPreferences.getInstance();
  int? countValues = preferences.getInt("countValues");
  count = countValues!;
  setState(() {

  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        centerTitle: true,
        title: Text("Counter App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 50,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.cyanAccent.shade100,
                    borderRadius: BorderRadius.circular(20)),
                child: CircularPercentIndicator(
                  center:Center( child: Text(count.toString(),
                    style: TextStyle(fontSize: 50,fontWeight: FontWeight.w700),)) ,
                  lineWidth: 10,
                    circularStrokeCap: CircularStrokeCap.round,
                    percent: (count/100),
                    progressColor: Colors.red.shade900,
                    backgroundColor: Colors.cyanAccent.shade400,
                    radius: 100)
              ),
            ),
            SizedBox(
              height: 10
            ),
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        decrement();

                      },
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.cyanAccent.shade100,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                               )),
                        child: Icon(FontAwesomeIcons.minus,size: 44,),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){

                      increment()
;                      },
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.cyanAccent.shade100,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                               )),
                        child: Icon(FontAwesomeIcons.plus,size: 44,) ,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
