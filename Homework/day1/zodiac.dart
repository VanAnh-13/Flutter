import 'dart:io';

String astrologicalSignNames(int day, String month) {
  const months = [
    'jan',
    'feb',
    'mar',
    'apr',
    'may',
    'jun',
    'jul',
    'aug',
    'sep',
    'oct',
    'nov',
    'dec'
  ];
  const days = [20, 19, 20, 20, 20, 21, 22, 22, 21, 22, 22, 21];
  const signs = [
    'Aquarius',
    'Pisces',
    'Aries',
    'Taurus',
    'Gemini',
    'Cancer',
    'Leo',
    'Virgo',
    'Libra',
    'Scorpio',
    'Sagittarius',
    'Capricorn'
  ];

  final monthIndex = months.indexOf(month);
  if (monthIndex < 0) {
    return 'Invalid month';
  }

  if (day < 1 || day > 31) {
    return 'Invalid day';
  }

  if (day <= days[monthIndex]) {
    if (monthIndex == 0) {
      return signs[signs.length - 1];
    }
    return signs[monthIndex - 1];
  } else {
    return signs[monthIndex];
  }
}

void main() {
  print('Enter your day: ');
  int day = int.parse(stdin.readLineSync()!);
  print('Enter your month: ');
  String month = stdin.readLineSync()!.toLowerCase();
  print(astrologicalSignNames(day, month));
}
