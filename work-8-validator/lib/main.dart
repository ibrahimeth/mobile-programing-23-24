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
      title: 'work-7',
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _controllerPassword.dispose();
    _controllerEmail.dispose();
    super.dispose();
  }
  List<Offset?> points = [];

  @override
  Widget build(BuildContext context) {
    SnackBar mySnackbar(String text){
      return SnackBar(
        backgroundColor: Colors.blue,
        duration: Duration(milliseconds: 700),
        content: Text(
            text,
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
      body:Padding(
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
      ),
    );
  }

}
