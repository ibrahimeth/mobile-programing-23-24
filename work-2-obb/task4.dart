/*
Write a dart program to create a class Animal with properties [id, name, color].
Create another class called Cat and extends it from Animal. Add new properties
sound in String. Create an object of a Cat and print all details.
*/
class Animal {
  int? id;
  String? name;
  String? color;
}

class Cat extends Animal {
  String? sound;

  printDetails() {
    print("-----------------Cat Details----------------");
    print("ID => $id");
    print("NAME => $name");
    print("COLOR => $color");
    print("SOUND => $sound");
  }
}

void main() {
  Cat myCat = Cat();
  myCat.id = 1;
  myCat.name = "Tekir";
  myCat.color = "White";
  myCat.sound = "Miavv";
  myCat.printDetails();
}
