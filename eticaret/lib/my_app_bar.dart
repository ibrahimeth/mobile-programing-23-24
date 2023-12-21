import 'package:flutter/material.dart';

class myAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const myAppBar({Key? key, required this.title}) : super(key: key);
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * .02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0XFF251E2D)
        ),
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                  title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
