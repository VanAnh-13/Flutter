import 'dart:io';

bool checkLeapYear(int year) {
  if (year % 4 == 0) {
    if (year % 100 == 0) {
      if (year % 400 == 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  return false;
}

void main() {
  print('Enter a number you wanna check: ');
  int year = int.parse(stdin.readLineSync()!);
  print('$year is ${checkLeapYear(year) ? '' : 'not'} a leap year !');
}
