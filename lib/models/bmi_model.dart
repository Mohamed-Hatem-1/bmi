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
  final parts = birthDate.split('/');
  if (parts.length != 3) return 0;

  final day = int.tryParse(parts[0]) ?? 1;
  final month = int.tryParse(parts[1]) ?? 1;
  final year = int.tryParse(parts[2]) ?? 0;

  final birth = DateTime(year, month, day);
  final today = DateTime.now();

  int age = today.year - birth.year;

  if (today.month < birth.month ||
      (today.month == birth.month && today.day < birth.day)) {
    age--;
  }

  return age;
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
