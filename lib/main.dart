import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Flutter akan menjalankan fungsi main() pertama kali, yang nantinya akan menjalankan runApp() dan memanggil MyApp()
void main() {
  runApp(const MyApp());
}

// Class yang menampilkan komponen Flutter ke layar atau dikenal dengan Widgets
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 7 Ramya',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Program Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_counter % 2 == 0) ...[
                const Text(
                  "GENAP",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ] else ...[
                const Text(
                  "GANJIL",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],

            Text(
              '$_counter',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontStyle: FontStyle.italic
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                _counter <= 0
                    ? const Text("")
                    : FloatingActionButton(
                        onPressed: _decrementCounter,
                        tooltip: 'Decrement',
                        child: const Icon(Icons.remove),
                      ),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                )
              ])
    )
  );
  }
}
