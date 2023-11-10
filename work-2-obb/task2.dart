/*
Write a dart program to create a class House with properties [id, name, prize]. 
Create a constructor of it and create 3 objects of it. Add them to the list and 
print all details.
*/
class House {
  int? id;
  String? name;
  int? prize;

  House(this.id, this.name, this.prize);

  printDetails() {
    print("-----------------House Details----------------");
    print("ID => $id");
    print("NAME => $name");
    print("PRIZE  => $prize");
  }
}

void main() {
  House house1 = House(1, "Black Castle", 500000);
  House house2 = House(2, "Stormveil Castle", 100000);
  House house3 = House(3, "Morne Castle", 1000000);

  house1.printDetails();
  house2.printDetails();
  house3.printDetails();
}
