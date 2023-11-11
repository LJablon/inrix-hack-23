import 'package:flutter/material.dart';
import 'package:app/models/event.dart';
import 'package:app/widgets/tickets_list_widget.dart';
import 'package:app/widgets/bottom_navbar_widget.dart';

class FindPage extends StatefulWidget {
  const FindPage({super.key});

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  // Dummy data
  final List<Event> events = [
    Event(
        name: "yourmomshouse",
        address: "111 El Camino",
        date: DateTime(1),
        url:
            "https://docs.google.com/document/d/1lwh_GXFqQ8O2bEwrHyw_koGDYNGQE4NGFVCEsYzbarU/edit#heading=h.1ak8pstirwpq",
        imageUrl: ""),
    Event(
        name: "yourmomshouse",
        address: "111 El Camino",
        date: DateTime(1),
        url:
            "https://docs.google.com/document/d/1lwh_GXFqQ8O2bEwrHyw_koGDYNGQE4NGFVCEsYzbarU/edit#heading=h.1ak8pstirwpq",
        imageUrl: ""),
    Event(
        name: "yourmomshouse",
        address: "111 El Camino",
        date: DateTime(1),
        url:
            "https://docs.google.com/document/d/1lwh_GXFqQ8O2bEwrHyw_koGDYNGQE4NGFVCEsYzbarU/edit#heading=h.1ak8pstirwpq",
        imageUrl: ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Title'),
      ),
      body: TicketsList(events: events),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const BottomNavBar(
        selectedIndex: 0,
      ),
    );
  }
}
