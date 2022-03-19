import 'package:flutter/material.dart';
import 'timeline.dart';
import 'meal.dart';

class PatientHome extends StatefulWidget {
  @override
  State<PatientHome> createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      extendBodyBehindAppBar: false,
      appBar: _buildAppBar(context, 'SomeBody'),
      body: ListView(padding: const EdgeInsets.only(top: 0), children: <Widget>[
        const FetusInfo(dayCount: 156, name: 'SomeBody'),
        EventTimeline(),
        const SizedBox(
          height: 15,
        ),
        DietSection()
      ]),
    );
  }

  PreferredSizeWidget _buildAppBar(context, String name) {
    return AppBar(
      title: Row(children: [
        Text(
          'Hello, ',
          style: TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.5)),
        ),
        Text(
          name,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8)),
        ),
      ]),
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: <Widget>[
        IconButton(
          onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          },
          icon: Icon(
            Icons.search,
            color: Colors.pink[700],
          ),
        )
      ],
    );
  }
}

class FetusInfo extends StatelessWidget {
  final int dayCount;
  final String name;

  const FetusInfo({required this.dayCount, required this.name});

  @override
  Widget build(BuildContext context) {
    final int weekCount = dayCount ~/ 7 + 1;
    final String imagePath = 'assets/fetus/week ($weekCount).jpg';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(20)), image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fitHeight)),
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Day',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      '$dayCount',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Week',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      '$weekCount',
                      style: const TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            )
          ])),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  List doctorsList = []; // connect with the doctor's id API

  @override
  List<Widget>? buildActions(BuildContext context) {
    // action for search bar
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // leading icon for search bar
    return IconButton(
        onPressed: () {
          close(context, '/home');
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on selection
    // return doctor's personal page
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for anything
    final suggestionList = doctorsList.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context); // call buildResults
        },
        leading: const Icon(Icons.medical_services),
        title: RichText(
            text: TextSpan(text: suggestionList[index].substring(0, query.length), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold), children: [
          TextSpan(text: suggestionList[index].substring(query.length), style: const TextStyle(color: Colors.grey))
        ])),
      ),
      itemCount: suggestionList.length,
    );
  }
}
