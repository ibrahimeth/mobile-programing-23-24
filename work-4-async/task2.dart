/*
Write a Dart program that takes a list of integers as input, multiplies each 
integer by 2 asynchronously, and then prints the modified list.
*/
Future<List<int>> multiplies(List<int> intList) async {
  List<int> modifiedListPre = [];
  for (int element in intList) {
    modifiedListPre.add(await multipleWith2(element));
  }
  return modifiedListPre;
}

Future<int> multipleWith2(int number) async {
  return number * 2;
}

void main() {
  List<int> myList = [0, 2, 4, 9, 11];
  print("Şimdiki Listemiz => $myList");
  Future<List<int>> modifiedList = multiplies(myList);
  modifiedList.then((value) => print("Sonraki listemiz => $value"));
}
