import 'package:bmi/models/bmi_model.dart';
import 'package:bmi/screens/result_screen.dart';
import 'package:bmi/widgets/counter_card.dart';
import 'package:bmi/widgets/custom_button.dart';
import 'package:bmi/widgets/custom_text_field.dart';
import 'package:bmi/widgets/date_textfield.dart';
import 'package:bmi/widgets/gender_card.dart';
import 'package:bmi/widgets/label.dart';
import 'package:flutter/material.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  int height = 170;
  int weight = 70;
  int selectedGender = 0;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF2FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    "BMI",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Label(text: "Name"),
                CustomTextField(controller: nameController ),
                const SizedBox(height: 16),
                Label(text: "Birth Date"),
                DateTextfield(dateController: dateController),
                const SizedBox(height: 20),
                Label(text: "Choose Gender"),
                const SizedBox(height: 12),
                Row(
                  children: [
                    GenderCard(
                      imagePath: 'assets/images/male.png',
                      isSelected: selectedGender == 1,
                      onTap: () => setState(() => selectedGender = 1),
                    ),
                    const SizedBox(width: 12),
                    GenderCard(
                      imagePath: 'assets/images/female.png',
                      isSelected: selectedGender == 2,
                      onTap: () => setState(() => selectedGender = 2),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Label(text: "Your Height (cm)"),
                CounterCard(
                  value: height,
                  onMinus: () => setState(() => height--),
                  onPlus: () => setState(() => height++),
                ),
                const SizedBox(height: 16),
                Label(text: "Your Weight (kg)"),
                CounterCard(
                  value: weight,
                  onMinus: () => setState(() => weight--),
                  onPlus: () => setState(() => weight++),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  txt: "Calculate BMI",
                  onPressed: () {
                    if (nameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter your name'),
                        ),
                      );
                      return;
                    }
                    if (dateController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter your birth date'),
                        ),
                      );
                      return;
                    }
                    final bmiData = BmiData(
                      name: nameController.text,
                      birthDate: dateController.text,
                      gender: selectedGender,
                      height: height,
                      weight: weight,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ResultScreen(bmiData: bmiData);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
