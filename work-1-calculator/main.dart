import 'dart:io';

void main() {
  int? choice;
  double firstNum;
  double secondNum;
  print("\n*** Welcome to My Calculator Program ***");
  while (choice != 5) {
    Menu();
    try {
      choice = int.parse(stdin.readLineSync()!);
      if (choice == 5) {
        exit(1);
      }
      stdout.write("enter the first number : ");
      firstNum = double.parse(stdin.readLineSync()!);
      stdout.write("enter the second number : ");
      secondNum = double.parse(stdin.readLineSync()!);
      while (choice == 4 && secondNum == 0) {
        stdout.write("Please enter a valid number (Not Zero): ");
        secondNum = double.parse(stdin.readLineSync()!);
      }

      switch (choice) {
        case (1):
          stdout.write("\n $firstNum + $secondNum = ");
          print(addition(firstNum, secondNum).toString() + "\n");
          break;
        case (2):
          stdout.write("\n $firstNum - $secondNum = ");
          print(
              subtraction(firstNum: firstNum, secondNum: secondNum).toString() +
                  "\n");
          break;
        case (3):
          stdout.write("\n $firstNum * $secondNum = ");
          print(addition(firstNum, secondNum).toString() + "\n");
          break;
        case (4):
          stdout.write("\n $firstNum / $secondNum = ");
          print(division(firstNum, secondNum: secondNum).toString() + "\n");
          break;
        default:
          break;
      }
    } catch (e) {
      print("\n Sorry, you can entry just number char \n");
    }
  }
}

double addition(double firstNum, double secondNum) {
  return firstNum + secondNum;
}

double subtraction({required double firstNum, required double secondNum}) {
  return firstNum - secondNum;
}

double multiplication([double firstNum = 0, double secondNum = 0]) {
  return firstNum * secondNum;
}

double division(double firstNum, {required double secondNum}) {
  return firstNum / secondNum;
}

void Menu() {
  print("""
  1 - addition
  2 - subtraction
  3 - multiplication
  4 - division
  5 - exit
  """);
  stdout.write("Please choose one : ");
}
