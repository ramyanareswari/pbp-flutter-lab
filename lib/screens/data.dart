import 'package:counter_7/main.dart';
import 'package:counter_7/screens/tambah.dart';
import 'package:flutter/material.dart';

class BudgetDataPage extends StatefulWidget {
  const BudgetDataPage({super.key});

  @override
  State<BudgetDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<BudgetDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Budget'),
      ), // Menambahkan drawer menu
      drawer: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const FormPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Route menu ke halaman data
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => const BudgetDataPage()),
                );
              },
            ),
          ],
        ),
      ),

      body: Card(
        child: ListView.builder(
            itemCount: Budget.budgets.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 3,
                margin: const EdgeInsets.all(8),
                child: 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // Text Judul
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: 
                          Text(
                            Budget.budgets[index].judul,
                            style: const TextStyle(
                              fontSize: 22.0,
                            ),
                          ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: 
                              Text(
                                Budget.budgets[index].nominal.toString(),
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                            ),
                          ),
                          
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: 
                            Text(
                              Budget.budgets[index].jenis,
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: 
                            Text(
                              Budget.budgets[index].tanggal.toString(),
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              );
            }),
      ),
    );
  }
}