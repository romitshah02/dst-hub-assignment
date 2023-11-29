import 'package:dst/data.dart';
import 'package:dst/model/work.dart';
import 'package:dst/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddWork extends StatefulWidget {
  const AddWork({super.key});

  @override
  State<AddWork> createState() => _AddWorkState();
}

class _AddWorkState extends State<AddWork> {
  final _formKey = GlobalKey<FormState>();
  final workTitle = TextEditingController();
  final workTime = TextEditingController();

  @override
  void dispose() {
    workTime.dispose();
    workTitle.dispose();
    super.dispose();
  }

  void onSubmit(BuildContext context) async {
    final validate = _formKey.currentState!.validate();
    if (!validate) {
      return;
    }

    work.add(Work(title: workTitle.text, time: double.parse(workTime.text)));
    final user = Provider.of<UserProvider>(context, listen: false).user;
    user.totalhours += double.parse(workTime.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15)
                    .copyWith(top: 10),
                child: TextFormField(
                  controller: workTitle,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Work Title';
                    }
                    return null;
                  },
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: 'Enter work',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: TextFormField(
                        controller: workTime,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              double.tryParse(value) == null) {
                            return 'Enter Time';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Hours',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: IconButton(
                        onPressed: () {
                          onSubmit(context);
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          size: 40,
                        )),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
