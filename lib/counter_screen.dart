import 'package:flutter/material.dart';

// 1- constructor
//2- init state
//3- build
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}
int count = 0;
class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    printName();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: ()
              {
                setState(() {

                });
                count--;
                print(count);
              },
              icon: Icon(Icons.remove, size: 50, color: Colors.blue),
            ),
            SizedBox(width: 20.0),
            Text(
              '$count',
              style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 20.0),
            IconButton(
              onPressed: () {
                setState(() {

                });
                count++;
                print(count);
              },
              icon: Icon(Icons.add, size: 50, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

void printName()
{
  print('Aly Fadhel');
}
