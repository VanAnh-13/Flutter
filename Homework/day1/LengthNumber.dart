import 'dart:io';

void main() {
  print("Enter number: ");
  int input = int.parse(stdin.readLineSync()!);
  print(input.toString().length);
}