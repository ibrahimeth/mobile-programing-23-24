/*
Write a dart program to create a class Camera with private properties 
[id, brand, color, prize]. Create a getter and setter to get and set values. 
Also, create 3 objects of it and print all details.
*/
class Camera {
  int? _id;
  String? _brand;
  String? _color;
  int? _prize;

  int get id => this.id;
  String get brand => this.brand;
  String get color => this.color;
  int get prize => this.prize;

  set id(int? id) => this._id = id;
  set brand(String? brand) => this._brand = brand;
  set color(String? color) => this._color = color;
  set prize(int? prize) => this._prize = prize;

  printDetails() {
    print("-----------------Camera Details----------------");
    print("ID => ${_id}");
    print("BRAND => ${_brand}");
    print("COLOR => ${_color}");
    print("PRIZE => ${_prize}");
  }
}

void main() {
  Camera myCam = Camera();
  myCam.id = 1;
  myCam.color = "white";
  myCam.brand = "Samsung";
  myCam.prize = 50000;

  Camera myCam2 = Camera();
  myCam2.id = 2;
  myCam2.color = "black";
  myCam2.brand = "Cano";
  myCam2.prize = 45000;

  Camera myCam3 = Camera();
  myCam3.id = 3;
  myCam3.color = "Pink";
  myCam3.brand = "Vestel";
  myCam3.prize = 30000;

  myCam.printDetails();
  myCam2.printDetails();
  myCam3.printDetails();
}
