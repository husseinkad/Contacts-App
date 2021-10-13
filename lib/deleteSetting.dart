// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                child: Image.asset('images/3.png',
                scale: 2,),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text('Delete Personal Information',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white),
                  textAlign: TextAlign.center),
              const Text('Are you sure you want to delete all personal data?',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Cancel'),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.grey),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        )),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text('Delete'),
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.red),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          )))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}