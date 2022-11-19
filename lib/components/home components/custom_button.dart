import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.backgroundImage})
      : super(key: key);
  final String backgroundImage;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print("go button pressed"),
      child: Container(
        height: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage(backgroundImage),
          ),
        ),
        child: Text(
          'Go',
          style:
              Theme.of(context).textTheme.button!.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
