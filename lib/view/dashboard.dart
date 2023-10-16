// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lockapp/getuser.dart';
import 'package:lockapp/controller/provider.dart';
import 'package:lockapp/widget.dart';
import 'package:provider/provider.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({super.key});

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<MyProvider>(context, listen: false);

    return Scaffold(
        backgroundColor: Colors.blue,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Getdata()));
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "Smart Phone Lock & Unlock",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(child: Consumer<MyProvider>(
                builder: (context, value, child) {
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1.08,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemCount: value.item.length,
                      itemBuilder: (context, index) {
                        var data = value.item[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: InkWell(
                            onDoubleTap: () {
                              value.removelist(data);
                            },
                            child: Container(
                              height: 210,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Image.network(
                                      "https://picsum.photos/200/300",
                                      height: 80,
                                      width: 80,
                                    ),
                                  ),
                                  myText(data.itemName, Colors.blue, 16,
                                      FontWeight.bold),
                                  myText(data.roomName, Colors.blue, 14,
                                      FontWeight.bold),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return CupertinoAlertDialog(
                                                  title: const Text(
                                                      'Please Confirm'),
                                                  content: const Text(
                                                      'Are you sure to remove'),
                                                  actions: [
                                                    // The "Yes" button
                                                    CupertinoDialogAction(
                                                      onPressed: () {
                                                        countProvider
                                                            .removelist(data);
                                                        Navigator.of(context)
                                                            .pop();
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "Device Deleted",
                                                            toastLength: Toast
                                                                .LENGTH_SHORT,
                                                            gravity:
                                                                ToastGravity
                                                                    .CENTER,
                                                            timeInSecForIosWeb:
                                                                1,
                                                            backgroundColor:
                                                                Colors.red,
                                                            textColor:
                                                                Colors.white,
                                                            fontSize: 18.0);
                                                      },
                                                      isDefaultAction: true,
                                                      isDestructiveAction: true,
                                                      child: const Text('Yes'),
                                                    ),
                                                    // The "No" button
                                                    CupertinoDialogAction(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      isDefaultAction: false,
                                                      isDestructiveAction:
                                                          false,
                                                      child: const Text('No'),
                                                    )
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.blue,
                                          )),
                                      SwitchExample(),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ))
            ],
          ),
        ));
  }
}
