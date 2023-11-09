// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'LihatData.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _ctrlNama = TextEditingController();
  final TextEditingController _ctrlUsia = TextEditingController();
  String? nama = '';
  String? usia = '';

  final notifTambah = SnackBar(
    content: Text(
      "Data Berhasil Ditambah.",
      style: TextStyle(color: Colors.black),
    ),
    duration: Duration(seconds: 3),
    padding: EdgeInsets.all(10),
    backgroundColor: Color.fromARGB(255, 228, 174, 245),
  );

  @override
  void dispose() {
    _ctrlNama.dispose();
    _ctrlUsia.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _ctrlNama.addListener(_printLatestNama);
    _ctrlUsia.addListener(_printLatestUsia);
  }

  void _printLatestNama() {
    print('Nama : ${_ctrlNama.text}');
  }

  void _printLatestUsia() {
    print('Usia : ${_ctrlUsia.text}');
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference dataDiri = firestore.collection("data_diri");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("CRUD Firebase"),
          backgroundColor: Colors.deepPurple,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LihatData(),
                  ),
                );
              },
              child: Text(
                "Lihat Data",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama',
                  ),
                  controller: _ctrlNama,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Usia',
                  ),
                  controller: _ctrlUsia,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    dataDiri.add({
                      'nama': _ctrlNama.text,
                      'usia': int.tryParse(_ctrlUsia.text) ?? -1,
                    });
                    _ctrlNama.text = '';
                    _ctrlUsia.text = '';
                    ScaffoldMessenger.of(context).showSnackBar(notifTambah);
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
