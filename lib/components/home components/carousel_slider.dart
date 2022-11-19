import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:chat_new/model/user_model.dart';
import 'package:chat_new/service/user_service.dart';
import 'package:chat_new/components/home components/listofgirlsyoutalked.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'custom_button.dart';
import 'heartButton.dart';

class CarouselSliderList extends StatelessWidget {
  CarouselSliderList({Key? key, required this.users}) : super(key: key);

  final List<UsersModelKisiler?> users;

  UserService _service = UserService();
  bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: users.length,
        itemBuilder: (context, index, realIndex) => UserCard(
              imagePath: users[index]!.imagePath!,
              fullName: users[index]!.name! + " " + users[index]!.surname!,
              location: users[index]!.location ?? "konumsuz",
            ),
        options: CarouselOptions(
            scrollDirection: Axis.vertical, viewportFraction: 1));
  }
}

class UserCard extends StatelessWidget {
  const UserCard(
      {Key? key,
      required this.imagePath,
      required this.fullName,
      required this.location})
      : super(key: key);
  final String imagePath;
  final String fullName;
  final String location;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 400,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26),
                child: Image.network(imagePath),
              ),
            ),
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fullName,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        location,
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            "assets/locationiconn.png",
                            fit: BoxFit.cover,
                          ))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

  /*  Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        height: 100,
        width: 300,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(26),
          child: Image.network(
            users[1].url_image.toString(),
          ),
        ),
      ),
      Row(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40, top: 15),
                child: Text(
                  users[2].name.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 40,
                    ),
                    child: Text(
                      "Los Angeles",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 5),
                      width: 25,
                      height: 25,
                      child: Image.asset("assets/locationiconn.png"))
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 110),
            child: HeartButton(),
          )
        ],
      ),
      const SizedBox(
        height: 30,
      )
    ],
  ),
  Column(
    children: [
      Container(
        height: 205,
        width: 300,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(26),
          child: Image.network(
            users[3].url_image.toString(),
          ),
        ),
      ),
      Row(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40, top: 15),
                child: Text(
                  users[2].name.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 40,
                    ),
                    child: Text(
                      "Los Angeles",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 5),
                      width: 25,
                      height: 25,
                      child: Image.asset("assets/locationiconn.png"))
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 110),
            child: HeartButton(),
          )
        ],
      ),
      const SizedBox(
        height: 30,
      )
    ],
  ),
 */

