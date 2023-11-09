// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

class LihatData extends StatefulWidget {
  const LihatData({super.key});

  @override
  State<LihatData> createState() => _LihatDataState();
}

class _LihatDataState extends State<LihatData> {
  final TextEditingController _ctrlNama = TextEditingController();
  final TextEditingController _ctrlUsia = TextEditingController();
  
  final notifEdit = SnackBar(
    content: Text(
      "Data Berhasil Diubah.",
      style: TextStyle(color: Colors.black),
    ),
    duration: Duration(seconds: 3),
    padding: EdgeInsets.all(10),
    backgroundColor: Color.fromARGB(255, 228, 174, 245),
  );

  final notifHapus = SnackBar(
    content: Text(
      "Data Berhasil Dihapus.",
      style: TextStyle(color: Colors.black),
    ),
    duration: Duration(seconds: 3),
    padding: EdgeInsets.all(10),
    backgroundColor: Color.fromARGB(255, 228, 174, 245),
  );

  Future<dynamic> editData(BuildContext context, String judul, String konten) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Data"),
          content: Container(
            height: 140,
            child: Column(
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
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(notifEdit);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> hapusData(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Hapus Data"),
          content: Text("Anda yakin ingin menghapus data ini ?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(notifHapus);
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  ListTile DataTile(String nama, String usia) {
    return ListTile(
      title: Text("Nama : " + nama),
      subtitle: Text("Usia : " + usia + " tahun"),
      onTap: () {
        editData(context, "judul", "konten");
      },
      tileColor: Color.fromARGB(255, 222, 193, 238),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      leading: IconButton(
        onPressed: () {
          hapusData(context);
        },
        icon: Icon(Icons.delete),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Halaman Tampil Data"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                DataTile("Ucup", "26"),
                SizedBox(height: 10),
                DataTile("Gilang", "32"),
                SizedBox(height: 10),
                DataTile("Tegar", "29"),
                SizedBox(height: 10),
                DataTile("Nanda", "25"),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
