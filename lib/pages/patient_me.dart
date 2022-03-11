import 'package:flutter/material.dart';

class PatientMePage extends StatefulWidget {
  @override
  State<PatientMePage> createState() => _PatientMePageState();
}

class _PatientMePageState extends State<PatientMePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Column(
        children: [
          // Stack(
          //   fit: StackFit.expand,
          //   clipBehavior: Clip.none,
          //   children: [
          //     CircleAvatar(
          //       backgroundImage: AssetImage("assets/avatar.jpg"),
          //       radius: 50,
          //     ),
          //     Positioned(
          //       right: -16,
          //       bottom: 0,
          //       child: SizedBox(
          //         height: 46,
          //         width: 46,
          //         child: TextButton(
          //           style: TextButton.styleFrom(
          //             shape:
          //                 CircleBorder(side: BorderSide(color: Colors.white)),
          //             primary: Colors.white,
          //             backgroundColor: Color(0xFFF5F6F9),
          //           ),
          //           onPressed: () {},
          //           child: Icon(Icons.camera_alt),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
          const SizedBox(
            height: 20,
          ),
          Text('SomeBody',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Card(
                child: ListTile(
                  title: const Text('Send Message'),
                  onTap: () {},
                ),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Card(
                child: ListTile(
                  tileColor: Colors.pink,
                  hoverColor: Colors.pink.withOpacity(0.5),
                  title: const Text(
                    'Video Call',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onTap: () {},
                ),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Card(
                child: ListTile(
                  title: const Text('Check Medical Records'),
                  onTap: () {},
                ),
              ))
        ],
      ),
    );
  }
}
