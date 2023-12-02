import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class OrderPageAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<DocumentSnapshot> userDocs = snapshot.data!.docs;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30), // Ruang kosong di bagian atas
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Orders', // Judul halaman
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: userDocs.length,
                  itemBuilder: (context, userIndex) {
                    var userItem = userDocs[userIndex];
                    String userId = userItem.id;
                    String userName = userItem['name'];

                    return StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc(userId)
                          .collection('orderHistory')
                          .snapshots(),
                      builder: (context, orderSnapshot) {
                        if (!orderSnapshot.hasData) {
                          return Container();
                        }

                        List<DocumentSnapshot> orderDocs =
                            orderSnapshot.data!.docs;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: orderDocs.length,
                              itemBuilder: (context, orderIndex) {
                                var orderItem = orderDocs[orderIndex];
                                String orderId = orderItem.id;
                                String orderStatus = orderItem['orderStatus'];
                                List<dynamic> products = orderItem['products'];

                                Color statusColor = Colors.black;
                                switch (orderStatus) {
                                  case 'On Queue':
                                    statusColor = Colors.blue;
                                    break;
                                  case 'Process':
                                    statusColor = Colors.yellow;
                                    break;
                                  case 'Delivery':
                                    statusColor = Colors.orange;
                                    break;
                                  case 'Complete':
                                    statusColor = Colors.green;
                                    break;
                                }

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Card(
                                    child: ListTile(
                                      title: Text('Order ID: $orderId'),
                                      subtitle: Text(
                                        '$orderStatus',
                                        style: TextStyle(
                                          color: statusColor,
                                        ),
                                      ),
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Order Details'),
                                              content: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'User ID: $userId',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(height: 2),
                                                  Text(
                                                    'Name: $userName',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  for (var product in products)
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            'Product Name: ${product['productName']}'),
                                                        Text(
                                                            'Cup Size: ${product['cupSize']}'),
                                                        Text(
                                                            'Hot/Cold: ${product['hotCold']}'),
                                                        Text(
                                                            'Less Ice: ${product['lessIce']}'),
                                                        Text(
                                                            'Less Sugar: ${product['lessSugar']}'),
                                                        Text(
                                                            'Quantity: ${product['quantity']}'),
                                                        Divider(),
                                                      ],
                                                    ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      trailing: ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title:
                                                    Text('Update Order Status'),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        updateOrderStatus(
                                                            userId,
                                                            orderId,
                                                            'On Queue');
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('On Queue'),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        updateOrderStatus(
                                                            userId,
                                                            orderId,
                                                            'Process');
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('Process'),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        updateOrderStatus(
                                                            userId,
                                                            orderId,
                                                            'Delivery');
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('Delivery'),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        updateOrderStatus(
                                                            userId,
                                                            orderId,
                                                            'Complete');
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('Complete'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Text('Update Status'),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // Metode untuk memperbarui status pesanan
  void updateOrderStatus(String userId, String orderId, String newStatus) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('orderHistory')
        .doc(orderId)
        .update({'orderStatus': newStatus}).then((_) {
      print('Status pesanan berhasil diperbarui');
    }).catchError((error) {
      print('Error: $error');
    });
  }
}
