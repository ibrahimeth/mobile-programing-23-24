/*
Write a Dart program that takes in two integers as input, waits for 3 seconds, 
and then prints the sum of the two numbers.
*/
import 'dart:io';

void doubleSum(int a, int b) {
  sleep(Duration(seconds: 3));
  print((a + b).toString());
}

void main() {
  print("5 ve 10 sayısı fonksiyon girdisi girildi 3 saniye bekliyoruz.");
  doubleSum(5, 10);
}
