import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sungel_app/products/sales/edit_sales_page.dart';

import './date_picker_bottom_sheet.dart';

class Sales extends StatefulWidget {
  const Sales({Key? key}) : super(key: key);

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final salesController = TextEditingController();
  final apController = TextEditingController();
  final clController = TextEditingController();
  final investigationController = TextEditingController();
  final constructionController = TextEditingController();
  final contractController = TextEditingController();
  var salesName = '';
  var salesPrice = '';
  var salesCommodity = '';
  var salesConstruction = '';
  var salesAppointer = '';
  var salesCloser = '';

  Stream<List<Map<String, dynamic>>> getSales() {
    return FirebaseFirestore.instance
        .collection('sungel')
        .doc('v1')
        .collection('sales')
        .doc('uid')
        .collection('${DateTime.now().year}_${DateTime.now().month}')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['docId'] = doc.id;
        return data;
      }).toList();
    });
  }

  dynamic _addNewSales(BuildContext ctx) {
    final List<String> commodity = [
      '太陽光',
      '蓄電池',
      'オール電化',
      'IH',
      'エコキュート',
    ];
    final items = commodity.map((e) => MultiSelectItem<String>(e, e)).toList();
    List<String> selectedCommodity = [];

    showModalBottomSheet(
      context: ctx,
      builder: (ctx) => SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'お客様名',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: addressController,
                    decoration: const InputDecoration(
                      hintText: '住所',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: salesController,
                    decoration: const InputDecoration(
                      hintText: '売上',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: TextField(
                          controller: apController,
                          decoration: const InputDecoration(
                            hintText: 'アポインター',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 4,
                        child: TextField(
                          controller: clController,
                          decoration: const InputDecoration(
                            hintText: 'クローザー',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  MultiSelectDialogField(
                      items: items,
                      title: const Text('商材'),
                      selectedColor: Colors.blue,
                      decoration: BoxDecoration(
                        color: Colors.lightGreenAccent.withOpacity(0.1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      buttonIcon: const Icon(
                        Icons.stars,
                        color: Colors.blue,
                      ),
                      buttonText: const Text(
                        '商材',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      onConfirm: (results) {
                        selectedCommodity = results;
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 28,
                    child: FilledButton.icon(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const DatePickerBottomSheet();
                        }));
                      },
                      label: const Text(
                        '契約日',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      icon: const Icon(Icons.add),
                    ),
                  ),
                  SizedBox(
                    height: 28,
                    child: TextField(
                      controller: constructionController,
                      enabled: false,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 28,
                    child: FilledButton.icon(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const DatePickerBottomSheet();
                        }));
                      },
                      label: const Text(
                        '現調日',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      icon: const Icon(Icons.add),
                    ),
                  ),
                  SizedBox(
                    height: 28,
                    child: TextField(
                      controller: investigationController,
                      enabled: false,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 28,
                    child: FilledButton.icon(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const DatePickerBottomSheet();
                        }));
                      },
                      label: const Text(
                        '工事日',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      icon: const Icon(Icons.add),
                    ),
                  ),
                  SizedBox(
                    height: 28,
                    child: TextField(
                      controller: contractController,
                      enabled: false,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('実績確定'),
                            content: const Text('確定してもよろしいですか？'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('はい'),
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection('sungel')
                                      .doc('v1')
                                      .collection('sales')
                                      .doc('uid')
                                      .collection(
                                          '${DateTime.now().year}_${DateTime.now().month}')
                                      .doc()
                                      .set({
                                    'salesDate': Timestamp.now(),
                                    'name': nameController.text,
                                    'address': addressController.text,
                                    'sales': salesController.text,
                                    'appointer': apController.text,
                                    'closer': clController.text,
                                    'commodity': selectedCommodity,
                                    'construction': constructionController.text,
                                    'investigation':
                                        investigationController.text,
                                    'contract': contractController.text,
                                  });
                                  if (!mounted) return;
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreenAccent,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                      child: Text(
                        '確定',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<String> salesList = <String>[''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: getSales(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Data is still loading
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            final error = snapshot.error;
            return Text(
              '$error',
              style: const TextStyle(
                fontSize: 60,
              ),
            );
          } else if (snapshot.hasData) {
            final result = snapshot.data;
            if (result != null) {
              return ListView.builder(
                itemCount: result.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = result[index];
                  salesName = item['name'];
                  salesPrice = item['sales'];
                  salesCommodity = item['commodity'].toString();
                  salesConstruction = item['construction'];
                  salesAppointer = item['appointer'].toString();
                  salesCloser = item['closer'].toString();
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            Text(
                              '$salesName 様',
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    '$salesPrice円',
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(salesCommodity),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'AP $salesAppointer CL $salesCloser',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(salesConstruction)
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.create,
                                color: Colors.indigo,
                              ),
                              onPressed: () {
                                // TODO(柊太): 編成画面遷移
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditSalesPage(item: item)));
                              },
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('削除'),
                                          content: const Text('本当に削除しますか？'),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('はい'),
                                              onPressed: () async {
                                                if (item['salesDate'] != null) {
                                                  final itemDate =
                                                      (item['salesDate']
                                                              as Timestamp)
                                                          .toDate();
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('sungel')
                                                      .doc('v1')
                                                      .collection('sales')
                                                      .doc('uid')
                                                      .collection(
                                                          '${itemDate.year}_${itemDate.month}')
                                                      .doc(item['docId'])
                                                      .delete();
                                                  if (!mounted) return;
                                                  Navigator.pop(context);
                                                }
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                }),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Text(
                'No data available',
                style: TextStyle(
                  fontSize: 60,
                ),
              );
            }
          } else {
            return const Text(
              'Unhandled state',
              style: TextStyle(
                fontSize: 60,
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewSales(context),
        backgroundColor: Colors.lightGreenAccent,
        child: const Icon(
          Icons.add,
          color: Colors.indigo,
        ),
      ),
    );
  }
}
