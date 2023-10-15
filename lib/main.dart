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
        title: const Text('Fit for Life'),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
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

  const DetailsPage(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
      ),
      body: Center(
        child: Text('Date: $name'),
      ),
    );
  }
}

class TrackingElement extends StatefulWidget {

  const TrackingElement({Key? key, required this.color, required this.iconData, required this.unit, required this.maximum}): super(key: key);
  final Color color;
  final IconData iconData;
  final String unit;
  final double maximum;

  @override
  State<TrackingElement> createState() => _TrackingElementState();
}

class _TrackingElementState extends State<TrackingElement> {

  int zahler = 0;
  void _incrementCounter() {
    setState(() {
      if (!(zahler >= widget.maximum)) {
        zahler++;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _incrementCounter,
      child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0,32.0,0,32.0),
                child:

                Row(children: <Widget>[
                  Icon(widget.iconData, color: Colors.blue, size: 30),
                  Text(
                    ("$zahler / ${widget.maximum.toInt()} ${widget.unit}"),
                    style: const TextStyle(color: Colors.deepOrange, fontSize: 35),
                  ),
                ],)
            ),

            LinearProgressIndicator(
              minHeight: 10,
              value: zahler/widget.maximum,
              color: widget.color,
            )
          ],
          ),);
    }
}