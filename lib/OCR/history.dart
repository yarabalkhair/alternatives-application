import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';

void main() => runApp(history());

List _elements = <Element>[
  Element(DateTime(2020, 6, 24, 18), 'sugar'),
  Element(DateTime(2020, 6, 24, 9), 'salt'),
  Element(DateTime(2020, 6, 25, 8), 'preservatives'),
  Element(DateTime(2020, 6, 25, 16), 'Clean'),
  Element(DateTime(2020, 6, 25, 20), 'clean'),
  Element(DateTime(2020, 6, 26, 12), 'sugar'),

];

class history extends StatelessWidget {
  var now =DateTime.now();
 // print(now);
  static const routeName = '/history';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'history',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('History'),
        ),
        body: StickyGroupedListView<Element, DateTime>(
          elements: _elements,
          order: StickyGroupedListOrder.ASC,
          groupBy: (Element element) =>
              DateTime(element.date.year, element.date.month, element.date.day),
          groupComparator: (DateTime value1, DateTime value2) =>
              value2.compareTo(value1),
          itemComparator: (Element element1, Element element2) =>
              element1.date.compareTo(element2.date),
          floatingHeader: true,
          groupSeparatorBuilder: (Element element) => Container(
            height: 50,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  border: Border.all(
                    color: Colors.blue[300],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${element.date.day}. ${element.date.month}, ${element.date.year}',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          itemBuilder: (_, Element element) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              elevation: 8.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                child: ListTile(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  //leading: Icon(element.icon),
                  title: Text(element.name),
                  trailing: Text('${element.date.hour}:00'),
                ),

              ),

            );

          },
        ),

        drawer: MainDrawer(),

      ),


    );

  }
}

class Element {
  DateTime date;
  String name;
 // IconData icon;

  Element(this.date, this.name);
}