// Import paket-paket yang diperlukan
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

// Widget untuk menampilkan teks status pesanan dengan warna yang sesuai
class OrderStatusColor extends StatelessWidget {
  final String orderStatus;

  OrderStatusColor({required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    Color textColor;

    // Atur warna teks berdasarkan nilai order status
    switch (orderStatus.toLowerCase()) {
      case 'on queue':
        textColor = Colors.blue;
        break;
      case 'process':
        textColor = Colors.yellow;
        break;
      case 'delivery':
        textColor = Colors.orange;
        break;
      case 'complete':
        textColor = Colors.green;
        break;
      default:
        textColor = Colors.black;
        break;
    }

    return Text(
      orderStatus,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// Halaman untuk menampilkan riwayat pesanan pengguna
class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dapatkan informasi pengguna yang sedang login
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user?.uid)
            .collection('orderHistory')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<DocumentSnapshot> orderDocs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: orderDocs.length,
            itemBuilder: (context, index) {
              var orderItem = orderDocs[index];
              String orderId = orderItem.id;
              Timestamp orderDate = orderItem['orderDate'] as Timestamp;
              String orderStatus = orderItem['orderStatus'];
              double totalHarga = orderItem['totalHarga'];
              List<dynamic> products = orderItem['products'];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: Text('Order ID: $orderId'),
                    subtitle: OrderStatusColor(orderStatus: orderStatus), // Gunakan OrderStatusColor di sini
                    onTap: () {
                      // Menampilkan pop-up dengan detail lengkap pesanan
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Order Details'),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Order Date: ${orderDate.toDate()}'),
                                Text('Order Status: $orderStatus'),
                                Text('Total Price: Rp ${NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0).format(totalHarga)}'),
                                Text(''),
                                // Iterasi melalui produk dalam pesanan dan menampilkan detailnya
                                for (var product in products)
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [                                    
                                      Text('Product Name: ${product['productName']}'),
                                      Text('Cup Size: ${product['cupSize']}'),
                                      Text('Hot/Cold: ${product['hotCold']}'),
                                      Text('Less Ice: ${product['lessIce']}'),
                                      Text('Less Sugar: ${product['lessSugar']}'),
                                      Text('Quantity: ${product['quantity']}'),
                                      Text(''),
                                    ],
                                  ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
