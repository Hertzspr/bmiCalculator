import 'package:bmi/constants/constants.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  const BMIResultScreen({Key? key, required this.bmi}) : super(key: key);
  final double bmi;
 // final BmiCalculator? bmiCalculator;

  // String determineBMICategory(double bmiValue){
  //   String category = '';
  //   if (bmiValue < 16.0){
  //     category = underweightSevere;
  //   } else if (bmiValue < 17){
  //     category = underweightModerate;
  //   } else if (bmiValue < 18.5){
  //     category = underweightMild;
  //   } else if (bmiValue < 25){
  //     category = normal;
  //   } else if (bmiValue < 30){
  //     category = overweight;
  //   } else if (bmiValue < 35){
  //     category = obeseI;
  //   } else if (bmiValue < 40.0){
  //     category = obeseII;
  //   } else if (bmiValue > 40.0){
  //     category = obeseIII;
  //   }
  //
  //   return category;
  // }
  //
  // String getHealthDescription(String categoryName){
  //   String desc = "";
  //   switch(categoryName) {
  //     case underweightSevere:
  //     case underweightModerate:
  //     case underweightMild:
  //       desc = 'Possible nutritional deficiency and osteoporosis.';
  //       break;
  //     case normal:
  //       desc = 'Low risk (healthy range).';
  //       break;
  //     case overweight:
  //       desc = 'Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.';
  //       break;
  //     case obeseI:
  //     case obeseII:
  //     case obeseIII:
  //       desc = 'High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.';
  //       break;
  //
  //     default:
  //   }
  //   return desc;
  //
  // }

  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmi);
    bmiCalculator.determineBMICategory();
    bmiCalculator.getHealthDescription();


    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
      ),
      body: Column(children: [
        const Expanded(
          child: Center(
            child: Text('Calculation Result',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
        ),
          ),),
        Expanded(
          flex: 4,
          child: BMICard(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 50.0,
                vertical: 40.0
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Text(bmiCalculator.bmiCategory!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(bmi.toStringAsFixed(1),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  ),
                ),
                Text(bmiCalculator.bmiDescription!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],

              ),
            ),
          ),),
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            color: const Color(0xffec3c66),
            height: 60,
            child: const Center(
              child: Text(
                'Recalculate',
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
