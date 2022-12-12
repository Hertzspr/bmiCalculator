import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmi/constants/constants.dart';

class BMIDataScreen extends StatefulWidget {
  const BMIDataScreen({Key? key}) : super(key: key);

  @override
  State<BMIDataScreen> createState() => _BMIDataScreenState();
}

class _BMIDataScreenState extends State<BMIDataScreen> {

  int height = 100;
  int weight = 60;
  int age = 20;
  String? gender;

  // double calculateBMI(){
  //   double heightM = height /100;
  //   double bmi = weight / (heightM * heightM);
  //   return bmi;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        gender = 'male';
                        setState(() {});
                      },
                      child: BMICard(
                        borderColor: (gender == 'male') ? Colors.white : primaryColor,
                        child: const GenderIconText(
                          icon: Icons.male,
                          title: 'Male',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        gender = 'female';
                        setState(() {});
                      },
                      child: BMICard(
                        borderColor: (gender == 'female') ? Colors.white : primaryColor,
                        child: const GenderIconText(
                          title: 'Female',
                          icon: Icons.female,
                        ),
                      ),
                    )
                  ),
                ],
              )),
          Expanded(
              child: BMICard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: labelTextStyle!.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          height.toString(),
                          style: numberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: labelTextStyle,
                        )
                      ],
                    ),
                    Slider(
                        value: height.toDouble(),
                        min: 50,
                        max: 300,
                        thumbColor: Colors.red,
                        activeColor: Colors.white54,
                        onChanged: (value){
                          height = value.toInt();
                          setState(() {});
                        })

                  ],
                ),
              )),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: BMICard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Weight',
                            style: labelTextStyle,
                          ),
                          Text('$weight',
                            style: numberTextStyle,
                          ),
                          const SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed:(){
                                  weight -= 1;
                                  setState(() {
                                  });
                                },
                                elevation: 0,
                                shape: const CircleBorder(),
                                fillColor: const Color(0xff212747),
                                constraints: const BoxConstraints.tightFor(
                                  width: 40,
                                  height: 40
                                ),
                                  child: const Icon(Icons.remove,
                                  color: Colors.white,),
                              ),
                              const SizedBox(width: 20,),
                              RawMaterialButton(
                                onPressed:(){
                                  weight += 1;
                                  setState(() {
                                  });
                                },
                                elevation: 0,
                                shape: const CircleBorder(),
                                fillColor: const Color(0xff212747),
                                constraints: const BoxConstraints.tightFor(
                                    width: 40,
                                    height: 40
                                ),
                                child: const Icon(Icons.add,
                                  color: Colors.white,),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: BMICard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Age',
                            style: labelTextStyle,
                          ),
                          Text('$age',
                            style: numberTextStyle,
                          ),
                          const SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed:(){
                                  age -= 1;
                                  setState(() {
                                  });
                                },
                                elevation: 0,
                                shape: const CircleBorder(),
                                fillColor: const Color(0xff212747),
                                constraints: const BoxConstraints.tightFor(
                                    width: 40,
                                    height: 40
                                ),
                                child: const Icon(Icons.remove,
                                  color: Colors.white,),
                              ),
                              const SizedBox(width: 20,),
                              RawMaterialButton(
                                onPressed:(){
                                  age += 1;
                                  setState(() {
                                  });
                                },
                                elevation: 0,
                                shape: const CircleBorder(),
                                fillColor: const Color(0xff212747),
                                constraints: const BoxConstraints.tightFor(
                                    width: 40,
                                    height: 40
                                ),
                                child: const Icon(Icons.add,
                                  color: Colors.white,),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          GestureDetector(
            onTap: (){
              final bmiCalculator =
                BmiCalculator(height: height, weight: weight);
              bmiCalculator.calculateBMI();

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context){
                    return BMIResultScreen(
                      bmi: bmiCalculator.bmi!,
                    );
                  }),
                ),
              );
            },
            child: Container(
              color: const Color(0xffec3c66),
              height: 50,
              child: const Center(
                child: Text(
                  'Calculate BMI',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class BMICard extends StatelessWidget {
  const BMICard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff272a4e),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: borderColor!
        ),
      ),
      margin: const EdgeInsets.all(10),
      child: child,
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Icon(
        icon,
        size: 80,
        color: Colors.white,
      ),
      const SizedBox(height: 10),
      Text(
        title,
        style: labelTextStyle,
      ),
    ],);
  }
}
