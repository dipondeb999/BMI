import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          'BMI',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    'Check Your Health With BMI',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 10, left: 10, right: 10),
                  child: TextField(
                    controller: wtController,
                    decoration: const InputDecoration(
                      label: Text('Enter Your Weight (in kg)'),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.line_weight,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: ftController,
                    decoration: const InputDecoration(
                      label: Text('Enter Your Height (in feet)'),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.height,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: inController,
                    decoration: const InputDecoration(
                      label: Text('Enter Your Height (in inch)'),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.height,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 80),
                  child: ElevatedButton(
                      onPressed: (){
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inController.text.toString();
                        if (wt != "" && ft != "" && inch != "") {
                          // Calculate
                          var iwt = int.parse(wt);
                          var ift = int.parse(ft);
                          var iInch = int.parse(inch);

                          // Calculate
                          var tInch = (ift * 12) + iInch;
                          var tcm = tInch * 2.54; //tInch
                          var tM = tcm / 100;
                          var bmi = iwt / (tM * tM);

                          // Calculate
                          var msg = "";
                          if (bmi > 25) {
                            msg = "You're Over Weight!!😒";
                          } else if (bmi < 18) {
                            msg = "You're UnderWeight!!🤷‍♀️";
                          } else {
                            msg = "You're Healthy!!😍";
                          }
                          //
                          setState(() {
                            result =
                            "$msg \n Your BMI Health Is : ${bmi.toStringAsFixed(2)}";
                          });
                        } else {
                          setState(() {
                            result = 'Please Required all Blanks!!';
                          });
                        }
                        wtController.clear();
                        ftController.clear();
                        inController.clear();
                      },
                      child: const Text(
                        'Check',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 44),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.green,
                    ),
                  ),
                  child: Text(
                    result,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
