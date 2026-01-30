import 'package:bmi/core/theme/app_colors.dart';
import 'package:bmi/models/bmi_model.dart';
import 'package:bmi/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final BmiData bmiData;

  const ResultScreen({super.key, required this.bmiData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: AppColors.primary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bmiData.name,
                        style: TextStyle(
                          fontSize: bmiData.name.length > 12 ? 18 : 24,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'A ${bmiData.getAge()} years old ${bmiData.genderString}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 25),
                          Column(
                            children: [
                              Text(
                                bmiData.bmi.toStringAsFixed(1),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'BMI Calc',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                '${bmiData.height} cm',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Height',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 35,
                            child: VerticalDivider(
                              color: Colors.white,
                              thickness: 2,
                              width: 32,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                '${bmiData.weight} kg',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Weight',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset('assets/images/body.png'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Color(0xFF01502E),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bmiData.bmiStatus,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Text(
                    bmiData.bmi < 18.5
                        ? 'Your BMI is underweight'
                        : bmiData.bmi >= 18.5 && bmiData.bmi < 25
                        ? 'Your BMI is normal'
                        : bmiData.bmi >= 25 && bmiData.bmi < 30
                        ? 'Your BMI is overweight'
                        : 'Your BMI is in the obesity range',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            CustomButton(
              txt: 'Calculate BMI Again',
              onPressed: () {
                Navigator.pop(context);
              },
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ],
        ),
      ),
    );
  }
}
