import 'dart:io';

import 'package:chat_new/screens/line_chart.dart';
import 'package:chat_new/screens/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.redAccent.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: _image != null
                ? Image.file(
                    File(_image!.path),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 50,
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          ImagePicker()
                              .pickImage(source: ImageSource.gallery)
                              .then((image) {
                            setState(() {
                              _image = image;
                            });
                          });
                        },
                      ),
                      Text(
                        'Resim Ekle',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.white),
                      )
                    ],
                  ),
          )),
          SizedBox(
            height: 10,
          ),
          Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: _image != null
                    ? Column(
                        children: [
                          //add pie chart PieChartSample2
                          LineChartSample2(), PieChartSample2()
                        ],
                      )
                    : Center(
                        child: Text(
                          'Analiz için resim ekle',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.black),
                        ),
                      ),
              )),
        ],
      ),
    );
  }
}
