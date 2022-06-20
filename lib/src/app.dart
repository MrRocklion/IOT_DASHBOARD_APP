import 'package:iot_firebase_dashboard/src/views/homePage.dart';
import 'package:iot_firebase_dashboard/src/views/infoPage.dart';
import 'package:flutter/material.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
      theme: ThemeData.light(),
    );
  }
}
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    homePage(),
    infoPage(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('MECDEVS',style: TextStyle(
            color: Colors.indigo,
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold

        ),
        )),
        elevation: 10,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child:_widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome_mosaic),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Informacion',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        elevation: 20,
        onTap: _onItemTapped,
      ),
    );
  }
}
