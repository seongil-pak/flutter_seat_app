import 'package:flutter/material.dart';
import 'package:flutter_seat_app/seat_bottom.dart';
import 'package:flutter_seat_app/seat_select_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SeatPage(),
    );
  }
}

class SeatPage extends StatefulWidget {
  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  int? selectedRow;
  int? selectedCol;

  void onSelected(int row, int col) {
    setState(() {
      selectedRow = row;
      selectedCol = col;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seats'),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          SeatSelectBox(selectedCol, selectedRow, onSelected),
          SeatBottom(selectedCol, selectedRow),
        ],
      ),
    );
  }
}
