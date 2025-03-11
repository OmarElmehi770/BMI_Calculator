import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bmi_Calculator extends StatefulWidget {
  const Bmi_Calculator({super.key});

  @override
  State<Bmi_Calculator> createState() => _Bmi_CalculatorState();
}

double height = 140;
int age = 20;
int weight = 65;
bool ismale = true;
double? calculation;

class _Bmi_CalculatorState extends State<Bmi_Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            spacing: 15,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        ismale = !ismale;
                      });
                    },
                    child: Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                        color: ismale ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            size: 90,
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        ismale = !ismale;
                      });
                    },
                    child: Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                        color: ismale ? Colors.grey : Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            size: 90,
                          ),
                          Text(
                            "Female",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Height",
                      style: TextStyle(fontSize: 30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toStringAsFixed(0),
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        Text("cm"),
                      ],
                    ),
                    Slider(
                      value: height,
                      onChanged: (val) {
                        setState(
                          () {
                            height = val;
                          },
                        );
                      },
                      max: 220,
                      min: 80,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 170,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: TextStyle(
                            fontSize: 35,
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: Icon(
                                  FontAwesomeIcons.minus,
                                  size: 30,
                                ),
                              color: Colors.black,
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: Icon(
                                  FontAwesomeIcons.add,
                                  size: 30,
                                ),
                              color: Colors.black,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 170,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weight",
                          style: TextStyle(
                            fontSize: 35,
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: Icon(
                                  FontAwesomeIcons.minus,
                                  size: 30,
                                  color: Colors.black,
                                ),
                              color: Colors.black,
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              icon: Icon(
                                FontAwesomeIcons.add,
                                size: 30,
                                color: Colors.black,
                              ),
                              color: Colors.black,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  double calculation =
                      (weight / ((height / 100) * (height / 100)));
                  AwesomeDialog(
                    context: context,
                    dialogType: calculation > 30
                        ? DialogType.warning
                        : DialogType.success,
                    borderSide: BorderSide(
                      color:
                          calculation > 30 ? Colors.orangeAccent : Colors.green,
                      width: 3,
                    ),
                    animType: AnimType.bottomSlide,
                    title: 'Your BMI',
                    body: Center(
                      child: Column(
                        children: [
                          Text('Your BMI'),
                          Text(
                            "${calculation.toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 30),
                          ),
                          Text("Your Age : $age "),
                          Text("Your Weight : $weight Kg"),
                          Text("Your height : ${height.toStringAsFixed(0)} cm"),
                          Text(
                            calculation < 18.5
                                ? "you are Under Weight "
                                : calculation < 24.9
                                    ? "you are Normal"
                                    : calculation < 29.9
                                        ? "you are Over weight"
                                        : calculation < 34.9
                                            ? "you are Obese"
                                            : "you are Extremely Obese",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    btnOkOnPress: () {},
                  ).show();
                },
                child: Text("Calculate"),
                //color: Colors.blue,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(double.infinity, 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
