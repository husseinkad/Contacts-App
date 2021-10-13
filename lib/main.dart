import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'login.dart';
import 'Contact view.dart';
import 'setting.dart';

void main() {
  runApp(const MyApp());
}



class Contact {
  String image;
  String name;
  String mobileNumber;
  DateTime date;
  bool isIncoming;

  Contact(this.image, this.name, this.mobileNumber, this.date, this.isIncoming);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Contacts App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 2;

  static late List<Widget> _pages;

  _MyHomePageState() {
    _pages = [
      buildContactsList(),
      buildFavoritesGridView(),
      bulidLoginPage(),



      // Text('hello'),

    ];
  }
  Widget buildContactsList() {
    return ListView.builder(
      itemBuilder: (_context, index) {
        return buildContactItem(contacts[index]);
      },
      itemCount: contacts.length,

    );

  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

    });
  }

  var contacts = [

    Contact(

      'https://i.pravatar.cc/300',
      'Ahmed',
      '71766137347',

      DateTime.now().add(
        const Duration(seconds: 3),
      ),
      true,
    ),
    Contact(
      'https://i.pravatar.cc/301',
      'Ali',
      '71766137347',

      DateTime.now().add(
        const Duration(days: 1),
      ),
      false,
    ),
    Contact(
      'https://i.pravatar.cc/302',
      'Kamal',
      '71766137347',
      DateTime.now().add(
        const Duration(days: 3),
      ),
      true,
    ),
    Contact(
      'https://i.pravatar.cc/303',
      'Mohammad',
      '71766137347',
      DateTime.now().add(
        const Duration(days: 5),
      ),
      true,
    ),
    Contact(
      'https://i.pravatar.cc/304',
      'Mohammad',
      '71766137347',
      DateTime.now().add(
        const Duration(days: 5),
      ),
      false,
    ),
    Contact(
      'https://i.pravatar.cc/305',
      'Hussein',
      '71766137347',
      DateTime.now().add(
        const Duration(days: 6),
      ),
      false,
    ),
    Contact(
      'https://i.pravatar.cc/306',
      'Aboud',
      '71766137347',
      DateTime.now().add(
        const Duration(days: 7),
      ),
      false,
    ),
    Contact(
      'https://i.pravatar.cc/307',
      'Osama',
      '71766137347',
      DateTime.now().add(
        const Duration(days: 6),
      ),
      false,
    ),

  ];

  Widget buildFavoritesGridView() {

    return Column(
      children: [
        Text('Favorites'),
        Divider(thickness: 4,),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            children: List.generate(5, (index) {
              var personColor = Color(
                  (math.Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0);
              return Center(
                child: Container(
                  width: 120,
                  height: 120,
                  child: Text(
                    contacts[index].name[0],
                    style: TextStyle(fontSize: 40),
                  ),
                  alignment: Alignment.center,
                  decoration:
                  BoxDecoration(shape: BoxShape.circle, color: personColor),

                ),
              );
            }),
          ),
        ),
      ],
    );
  }


  Widget buildContactItem(Contact _contact) {
    return Card(
        child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => view(contact: _contact, index: 1)),
              );
            },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(_contact.image),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _contact.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_contact.mobileNumber),
                ],
              ),
            ),
            Text(_contact.date
                .toIso8601String()
                .split('T')
                .first),
            Expanded(
              child: Container(),
            ),
            if (_contact.isIncoming)
              Icon(
                Icons.arrow_downward,
                color: Colors.red,
              )
            else
              Icon(
                Icons.arrow_upward,
                color: Colors.green,
              )
          ],
        ),
      ),
        ),
    );
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Setting()),
              );
            },
          )
        ],

      ),
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Recent',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'login',
          ),





        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}




