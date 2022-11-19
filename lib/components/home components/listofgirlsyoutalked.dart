import 'package:chat_new/components/home%20components/heartButton.dart';
import 'package:chat_new/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:chat_new/model/user_model.dart';

class ListOfGirlsYouTalked extends StatefulWidget {
  ListOfGirlsYouTalked({Key? key}) : super(key: key);

  @override
  State<ListOfGirlsYouTalked> createState() => _ListOfGirlsYouTalkedState();
}

UserService _service = UserService();
bool? isLoading;

List<UsersModelKisiler?> users = [];

class _ListOfGirlsYouTalkedState extends State<ListOfGirlsYouTalked> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      width: 350,
      child: isLoading == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : isLoading == true
              ? ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          height: 205,
                          width: 300,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(26),
                            child: Image.network(
                                users[index]!.imagePath.toString()),
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 40, top: 15),
                                  child: Text(
                                    //"${users.length}",
                                    "${users[index]!.name! + users[index]!.surname!}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
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
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 13),
                                      ),
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(left: 5),
                                        width: 25,
                                        height: 25,
                                        child: Image.asset(
                                            "assets/locationiconn.png"))
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
                    );
                  },
                )
              : const Center(
                  child: Text("Bir sorun oluştu.."),
                ),
    );
  }
}
