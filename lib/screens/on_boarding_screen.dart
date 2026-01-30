import 'package:bmi/core/theme/app_colors.dart';
import 'package:bmi/screens/calculate_screen.dart';
import 'package:bmi/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/Dukan_diet_1_.png',
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Know Your Body Better,\nGet Your BMI Score in Less Than a Minute!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'It takes just 30 seconds - and your health is worth it!',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                    Spacer(),
                    Divider(color: Colors.white54),
                    Spacer(),
                    CustomButton(
                      width: width,
                      height: height,
                      txt: 'Get Started',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CalculateScreen();
                            },
                          ),
                        );
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
