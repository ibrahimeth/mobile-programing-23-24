import 'package:eticaret/product.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-Ticaret',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Login Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _controllerPassword.dispose();
    _controllerEmail.dispose();
    _pageController.dispose();
    super.dispose();
  }
  List<Offset?> points = [];
  String? userName;
  @override
  Widget build(BuildContext context) {
    SnackBar mySnackbar(String text){
      return SnackBar(
        backgroundColor: Colors.blue,
        duration: const Duration(milliseconds: 400),
        content: Text(
            text,
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
          title: Text(
              userName ?? "HELLO",
            style: const TextStyle(
              color: Colors.white
            ),
          ),
          foregroundColor: Colors.white,
        backgroundColor: Color(0XFF251E2D),
      ),
      drawer: userName != null  ? Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0XFF251E2D),
              ),
              child: Text(
                "My Homework 21060671",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
            ListTile(
              title: const Text('My Basket'),
              onTap: () {
                _pageController.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.linear);
                Navigator.of(context).pop();

              },
            ),ListTile(
              title: const Text('Market'),
              onTap: () {
                _pageController.animateToPage(1, duration: Duration(milliseconds: 400), curve: Curves.linear);
                Navigator.of(context).pop();

              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                setState(() {
                  userName = null;

                });
                Navigator.of(context).pop();
                _pageController.jumpToPage(0);
              },
            ),
          ],
        ),
      ): null,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          loginPage(),
          marketPage(),
          BasketPage(),
        ],
      )
    );
  }
  Widget loginPage(){
    SnackBar mySnackbar(String text){
      return SnackBar(
        backgroundColor: Colors.blue,
        duration: Duration(milliseconds: 400),
        content: Text(
          text,
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                height: 500,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/flutter-banner.png",
                        height: 130,
                      ),
                      TextFormField(
                        controller: _controllerEmail,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter some text";
                          }
                          return null;
                        },
                        onEditingComplete: () {
                          setState(() {});
                          ScaffoldMessenger.of(context).showSnackBar(mySnackbar(_controllerEmail.text));
                        },
                        decoration: const InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        controller: _controllerPassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter some text";
                          }
                          return null;
                        },
                        onEditingComplete: () {
                          setState(() {
                            ScaffoldMessenger.of(context).showSnackBar(mySnackbar(_controllerPassword.text));
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          print("Forgot Password");
                        },
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              userName = _controllerEmail.text;
                            });
                            _pageController.animateToPage(1, duration: const Duration(milliseconds: 400), curve: Curves.linear);
                          }
                        },
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.all(15),
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print("New User tapped.");
            },
            child: const Text(
              "New User? Create Account",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Product> productList = [
    Product("Python Course", 150.99, "python.png"),
    Product("Java Course", 450.99, "java.png"),
    Product("Dart Course", 250.99, "dart.png"),
    Product("Ruby Course", 22.90, "ruby.png"),
    Product("C Course", 100.75, "c.png"),
    Product("Go Course", 95.05, "go.png"),
    Product("CSS Course", 175.90, "css.png"),
    Product("HTML Course", 120.0, "html.png"),
  ];
  List <Product> basketList = [

  ];
  Widget marketPage(){
    SnackBar myySnackbar(String text){
      return SnackBar(
        backgroundColor: Color(0XFF251E2D),
        duration: Duration(milliseconds: 400),
        content: Text(
          text,
        ),
      );
    }

    Size size = MediaQuery.of(context).size;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: size.width * .05,
          mainAxisSpacing: size.height * .015,
          childAspectRatio: 1
      ),
      itemCount: productList.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Color(0XFFD9D9D9),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(horizontal: size.width * .03,vertical: size.height * 0.004),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/${productList[index].imageName}",
                width: size.width * .33,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productList[index].productname.toString(),
                    style: const TextStyle(
                      fontSize: 17
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(myySnackbar("${productList[index].productname} Product has been added the basket"));
                      setState(() {
                        basketList.add(productList[index]);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0XFF251E2D)
                      ),
                      child: const Icon(
                        Icons.shopping_basket_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
  Widget BasketPage(){
    return basketList.isEmpty
    ?const Center(
      child: Text(
        "Your Basket is Empty"
      ),
    )
    :ListView.builder(
      itemCount: basketList.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 3),
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(11)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/${basketList[index].imageName}",
                    width: 50,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Expanded(
                        child: Text(
                          basketList[index].productname.toString(),
                          maxLines: 1,
                          style: const TextStyle(
                              height: 1,
                              overflow: TextOverflow.ellipsis
                          ),
                        )
                    ),
                  ),
                  Text("${basketList[index].amount} TL"),
                ],
              ),
            ),
            Positioned(
              top: 5,
              right: 25,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    basketList.removeAt(index);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: const Icon(
                      Icons.delete,
                    color: Colors.red,
                    size: 16,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
