import 'dart:io';

void pascalTriangle(int number) {
  List<List<int>> pascal = [];

  for(int i = 0; i < number; i++) {
    List<int> rows = List<int>.filled(i + 1, 0);
    rows[0]= rows[i] = 1;

    for(int j = 1; j < i; j++){
      rows[j] = pascal[i - 1][j - 1] + pascal[i - 1][j];
    }

    pascal.add(rows);
  }

  for(int i = 0; i < pascal.length; i++){
    print(" " * (number - i) + pascal[i].join(" "));
  }
}

void main(){
  print('Enter number row triangle: ');
  pascalTriangle(int.parse(stdin.readLineSync()!));
}