import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTabs(),
    );
  }
}

class MyTabs extends StatefulWidget {
  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    Tab1(),
    Tab2(),
    Tab3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fit for Life'),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Runtime',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Kcal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.water),
            label: 'drinks',
          ),
        ],
      ),
    );
  }
}

class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = List.generate(
      30,
          (index) {
        final date = DateTime.now().subtract(Duration(days: index));
        final formattedDate = DateFormat.yMMMd().format(date);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
            ),
            child: ListTile(
              title: Text(formattedDate),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(formattedDate)));
              },
            ),
          ),
        );
      },
    );

    return ListView(
      children: items,
    );
  }
}

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = List.generate(
      30,
          (index) {
        final date = DateTime.now().subtract(Duration(days: index));
        final formattedDate = DateFormat.yMMMd().format(date);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              title: Text(formattedDate),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(formattedDate)));
              },
            ),
          ),
        );
      },
    );

    return ListView(
      children: items,
    );
  }
}

class Tab3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = List.generate(
      30,
          (index) {
        final date = DateTime.now().subtract(Duration(days: index));
        final formattedDate = DateFormat.yMMMd().format(date);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
            ),
            child: ListTile(
              title: Text(formattedDate),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(formattedDate)));
              },
            ),
          ),
        );
      },
    );

    return ListView(
      children: items,
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String name;

  DetailsPage(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Page'),
      ),
      body: Center(
        child: Text('Date: $name'),
      ),
    );
  }
}