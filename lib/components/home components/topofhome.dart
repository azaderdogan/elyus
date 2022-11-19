import 'package:flutter/material.dart';

class TopOfTheHome extends StatelessWidget {
  const TopOfTheHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 10, left: 20),
            child: Column(
              children: [sideBar(), sideBar(), sideBar()],
            )),
        const Padding(
          padding: EdgeInsets.only(left: 62, top: 40, bottom: 20),
          child: Text(
            "Girls you've \n talked before!",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontFamily: "Calisto"),
          ),
        )
      ],
    );
  }

  sideBar() {
    return Column(
      children: [
        Container(
          width: 36,
          height: 5,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
        ),
        SizedBox(
          height: 3,
        ),
      ],
    );
  }
}
