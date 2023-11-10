/*
Write a dart program to create an enum class for gender [male, female, others]
and print all values.
*/
enum gender {
  male,
  female,
  others,
}

void main() {
  for (gender temp in gender.values) {
    print(temp);
  }
}
