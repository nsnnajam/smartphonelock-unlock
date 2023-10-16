// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lockapp/controller/provider.dart';

import 'package:provider/provider.dart';

class Getdata extends StatefulWidget {
  const Getdata({Key? key}) : super(key: key);

  @override
  State<Getdata> createState() => _GetdataState();
}

class _GetdataState extends State<Getdata> {
  TextEditingController nameController = TextEditingController();
  TextEditingController roomnameController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<MyProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Add Device for lock",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.devices_other),
                    suffixIconColor: Colors.blue,
                    hintText: "Device Name",
                    border: OutlineInputBorder()),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Device Name Require";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: roomnameController,
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.room),
                    suffixIconColor: Colors.blue,
                    hintText: "Room Name",
                    border: OutlineInputBorder()),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Room Name Required";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: 170,
                child: ElevatedButton(
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      countProvider.adduser(
                          nameController.text.toString(),
                          roomnameController.text.toString(),
                          statusController.text.toString());
                      Navigator.of(context).pop();

                      Fluttertoast.showToast(
                          msg: "Device Added",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 18.0);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
