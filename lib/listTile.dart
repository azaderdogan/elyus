/*import 'package:chat_new/data/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListTile extends StatefulWidget {
   ListTile({Key? key}) : super(key: key);

  @override
  State<ListTile> createState() => _ListTileState();
}

class _ListTileState extends State<ListTile> {
  @override
  Widget build(BuildContext context) {

  return Card(
                          child: ListTile(
                            title: Text(
                              users[index].name ?? '',
                              style: const TextStyle(color: Colors.black),
                            ),
                            subtitle: Text(users[index].description ?? '',
                                style: const TextStyle(
                                    color: Colors.black, height: 2.0)),
                            trailing: IconButton(
                              icon: Icon(
                                iconChange
                                    ? Icons.favorite_border
                                    : Icons.favorite,
                              ),
                              color: Colors.red,
                              onPressed: () {
                                setState(() {
                                  iconChange = !iconChange;
                                });
                              },
                            ),
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(users[index].url_image ?? ''),
                              /*child: Image.network(
                              users[index].url_image ?? '',
                              width: 50,
                              height: 50,
                            ),*/
                            ),
                            contentPadding: EdgeInsets.all(10),
                            //dense: true,
                            onTap: () {},
                          ),
                        )
    
  }
}
*/