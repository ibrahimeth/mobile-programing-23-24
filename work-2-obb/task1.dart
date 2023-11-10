/*
Write a dart program to create a class Laptop with properties [id, name, ram] 
and create 3 objects of it and print all details.
*/

class Laptop {
  int? id;
  String? name;
  int? ram;

  printDetails() {
    print("-----------------Laptop Details----------------");
    print("ID => $id");
    print("NAME => $name");
    print("RAM => $ram");
  }
}

void main() {
  Laptop firstLaptop = Laptop();
  Laptop secondLaptop = Laptop();
  Laptop thirdLaptop = Laptop();

  firstLaptop.id = 1;
  firstLaptop.name = "Monster";
  firstLaptop.ram = 16;

  secondLaptop.id = 2;
  secondLaptop.name = "Asus";
  secondLaptop.ram = 32;

  thirdLaptop.id = 3;
  thirdLaptop.name = "Hp";
  thirdLaptop.ram = 8;

  firstLaptop.printDetails();
  secondLaptop.printDetails();
  thirdLaptop.printDetails();
}
