class BmiData {
  final String name;
  final String birthDate;
  final int gender; // 1 = male, 2 = female
  final int height;
  final int weight;

  BmiData({
    required this.name,
    required this.birthDate,
    required this.gender,
    required this.height,
    required this.weight,
  });

  double get bmi => weight / ((height / 100) * (height / 100));

  int getAge() {
    final birthYear = int.tryParse(birthDate.split('-')[0]) ?? 0;
    final currentYear = DateTime.now().year;
    return currentYear - birthYear;
  }

  String get genderString => gender == 1 ? "Male" : "Female";

  String get bmiStatus {
    final value = bmi;
    if (value < 18.5) return "Underweight";
    if (value < 25) return "Normal";
    if (value < 30) return "Overweight";
    return "Obese";
  }
}
