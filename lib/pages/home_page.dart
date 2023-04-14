import 'package:flutter/material.dart';
import 'package:praktikum_pbm/pages/register_page.dart';


class HomePage extends StatefulWidget {
  // const HomePage({super.key});
  final String username2;
  HomePage({required this.username2});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double hasil = 0;

  void hitungBmi() {
    double tinggi = double.parse(_TinggiController.text);
    double berat = double.parse(_BeratController.text);
    hasil = berat / ((tinggi / 100) * (tinggi / 100));
  }

  validate() {
    if (_TinggiController.text != '' && _BeratController.text != '') {
      hitungBmi();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text('Tolong isi semua formnya!')));
    }
  }

  final TextEditingController _TinggiController = TextEditingController();
  final TextEditingController _BeratController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //TODO : bikin tampilan UI
        appBar: AppBar(title: Text("hitung BMI anda")),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 100.0, left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  child: Text(
                    "selamat Datang $Username",
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: Text(
                    hasil.toString(),
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
                TextField(
                  controller: _TinggiController,
                  decoration: InputDecoration(
                    labelText: 'Tinggi Badan (cm)',
                    hintText: 'Masukkan Tinggi Badan (cm)',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _BeratController,
                  decoration: InputDecoration(
                    labelText: 'Berat Badan (kg)',
                    hintText: 'Masukkan Berat Badan (kg)',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      validate();
                    });
                  },
                  child: Text('Hitung BMI'),
                ),
              ],
            ),
          ),
        ));
  }
}