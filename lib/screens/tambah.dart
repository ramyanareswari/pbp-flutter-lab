import 'package:counter_7/drawer.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/screens/data.dart';
import 'package:flutter/material.dart';


class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _MyFormPageState();
}

class Budget {
  String judul="";
  int nominal=0;
  String jenis="";
  DateTime? tanggal;

  static List<Budget> budgets = [];

  Budget(this.judul, this.nominal,  this.jenis, this.tanggal);
}

class _MyFormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  int _nominal = 0;
  String? _jenisBudget;
  DateTime tanggal = DateTime.now();
  

  List<String> _listPemasukan = ['Pemasukan', 'Pengeluaran'];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ), // Menambahkan drawer menu
      drawer: const AppDrawer(),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Untuk input judul
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Beli Sate Pacil",
                      labelText: "Judul",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // TODO Implement onChanged dan onSaved
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                
                //Input nominal
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Contoh: 15000",
                      labelText: "Nominal",
                      icon: const Icon(Icons.numbers),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // TODO Implement onChanged dan onSaved
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        if (value!='') {
                          _nominal = int.parse(value!);
                        }
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        if (value!='') {
                          _nominal = int.parse(value!);
                        }
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      } 
                      return null;
                    },
                  ),
                ),
                // Dropdown untuk jenis
                Container(
                  width: 164.0,
                  child: Column(
                    children: [
                    DropdownButtonFormField<String>(
                      hint: const Text("Pilih Jenis"),
                      value: _jenisBudget,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: _listPemasukan.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _jenisBudget = newValue!;
                        });
                      },
                    ),
                    ],
                  ),
                ),


                const SizedBox(height: 20.0),
                ListTile(
                  title: Text(tanggal.toString()),
                  leading: TextButton.icon(
                      icon: const Icon(Icons.calendar_today),
                      label: const Text("Masukkan Tanggal"),
                  
                  onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      ).then((tanggal) {

                        //panggil variabel _dateTime.
                        setState(() {
                          this.tanggal = tanggal!;
                        });
                      });
                    },
                  )
                ),    
                      
                const SizedBox(
                  height: 20.0,
                ),
                // TODO Atur ukuran button biar gedean dikit
                // Button untuk submit
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: 
                      MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Budget currentBudget =
                          Budget(_judul, _nominal, _jenisBudget!, tanggal);
                      Budget.budgets.add(currentBudget);
                      _formKey.currentState?.reset();
                    }
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}