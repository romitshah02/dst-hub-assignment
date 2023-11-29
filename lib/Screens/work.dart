import 'package:dst/Screens/add_work.dart';
import 'package:dst/data.dart';
import 'package:flutter/material.dart';

class WorkProfile extends StatefulWidget {
  const WorkProfile({super.key});

  @override
  State<WorkProfile> createState() => _WorkProfileState();
}

class _WorkProfileState extends State<WorkProfile> {
  void addWork(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const AddWork(),
    ).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                addWork(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: work.isEmpty
          ? const Center(
              child: Text('No Work Done'),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: work.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: const EdgeInsets.all(10),
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue[200]),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                work[index].title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              work[index].time.floor().toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ));
                },
              ),
            ),
    );
  }
}
