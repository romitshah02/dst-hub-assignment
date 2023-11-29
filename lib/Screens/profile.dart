// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:dst/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  double time = 0;

  void getImage(BuildContext context) async {
    final XFile? file =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (file == null) {
      return;
    }

    Provider.of<UserProvider>(context).user.image = file;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(top: 50),
                  child: GestureDetector(
                    onTap: () {
                      getImage(context);
                    },
                    child: user.image == null
                        ? const Icon(
                            Icons.add_circle_outline,
                            size: 30,
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              File(user.image!.path),
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Full name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.blue)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.black))),
                  initialValue: user.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  onChanged: (value) {
                    user.name = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Total Hours : ${user.totalhours.floor().toString()}',
                  style: const TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
