import 'dart:math';

List<int> intNumber() {
  return List<int>.generate(100, (_) => new Random().nextInt(1000));
}

Set<int> setNumber(List<int> intNumber) {
  return Set.from(intNumber);
}

bool isPrime(int number) {
  if (number <= 1) return false;

  for (int i = 2; i < sqrt(number); i++) {
    if (number % i == 0) return false;
  }

  return true;
}

List<int> primeNumber(Set<int> numberSet) {
  List<int> listNumber = [];
  for (int i in numberSet) {
    if (isPrime(i)) {
      listNumber.add(i);
    }
  }

  return listNumber;
}

void pronuncation(List<int> numberPrime) {
  Map<int, String> pronumciation = {
    1: 'một',
    2: 'hai',
    3: 'ba',
    4: 'bốn',
    5: 'năm',
    6: 'sáu',
    7: 'bảy',
    8: 'tám',
    9: 'chín',
    10: 'mười',
    11: 'mười một',
    12: 'mười hai',
    13: 'mười ba',
    14: 'mười bốn',
    15: 'mười lăm',
    16: 'mười sáu',
    17: 'mười bảy',
    18: 'mười tám',
    19: 'mười chín',
    20: 'hai mươi',
  };

  for (int i = 21; i < 1000; i++) {
    String numberWords = '';

    if (i < 100) {
      int tens = i ~/ 10;
      int words = i % 10;

      numberWords += (pronumciation[tens]! + ' mươi');
      if (words > 0) numberWords += ' ' + pronumciation[words]!;
    } else {
      int hundreds = i ~/ 100;
      int tens = (i % 100) ~/ 10;
      int ones = (i % 100) % 10;

      numberWords += pronumciation[hundreds]! + " trăm ";

      if (tens > 0) numberWords += pronumciation[tens]! + ' mươi';
      if (ones > 0) numberWords += ' ' + pronumciation[ones]!;
    }

    pronumciation[i] = numberWords;
  }

  Map<int, String> pro = {};

  for (int i in numberPrime) {
    pro[i] = pronumciation[i]!;
  }

  print(pro);
}

void main() {
  print('List random number: ');
  List<int> randomNumber = intNumber();
  print(randomNumber.join(" "));
  print('Set number: ');
  Set<int> numberSet = setNumber(randomNumber);
  print(numberSet.join(" "));
  print("List prime number: ");
  List<int> primeNumber1 = primeNumber(numberSet);
  print(primeNumber1.join(" "));
  pronuncation(primeNumber1);
}
