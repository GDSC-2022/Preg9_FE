import 'package:flutter/material.dart';

class PatientMePage extends StatefulWidget {
  @override
  State<PatientMePage> createState() => _PatientMePageState();
}

class _PatientMePageState extends State<PatientMePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Stack(
            fit: StackFit.passthrough,
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(backgroundImage: AssetImage('assets/avatar.jpg'), backgroundColor: Colors.transparent, radius: 60),
              Positioned(
                right: -16,
                bottom: 0,
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: CircleBorder(side: BorderSide(color: Colors.white, width: 2)),
                      backgroundColor: Colors.grey[300],
                    ),
                    onPressed: () {},
                    child: Icon(Icons.camera_alt_outlined, color: Colors.black.withOpacity(0.8)),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          Text('SomeBody', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email),
              Text(
                'SomeBody@gmail.com',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone),
              Text(
                '123-456-789',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Card(
                child: ListTile(
                  tileColor: Colors.pink,
                  title: const Center(
                      child: Text(
                    'MESSAGE',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                  onTap: () {},
                ),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Card(
                child: ListTile(
                  tileColor: Colors.pink,
                  title: const Center(
                      child: Text(
                    'VIDEO CALL',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                  onTap: () {},
                ),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Card(
                child: ListTile(
                  tileColor: Colors.pink,
                  title: const Center(
                      child: Text(
                    'MEDICAL RECORD',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                  onTap: () {},
                ),
              ))
        ],
      ),
    );
  }
}
