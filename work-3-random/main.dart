/*
Write a function named generateRandom() in dart that randomly returns 100 or
null. Also, assign a return value of the function to a variable named status 
that can’t be null. Give status a default value of 0, if generateRandom() 
function returns null.
*/
import 'dart:math';

void main() {
  int status = generateRandom();
  print("Status value is ${status}");
}

int generateRandom() {
  Random random = Random();
  int randomly = random.nextInt(2);
  print(randomly);
  if (randomly == 0) {
    return 100;
  } else {
    return 0;
  }
}
