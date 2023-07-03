import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';



class EditSalesPage extends StatefulWidget {
  const EditSalesPage({Key? key, required this.item}) : super(key: key);
  final Map<String, dynamic> item;

  @override
  State<EditSalesPage> createState() => _EditSalesPageState();
}

const String MIN_DATETIME = '2010-05-12 10:47:00';
const String MAX_DATETIME = '2030-11-25 22:45:10';
const String INIT_DATETIME = '2019-05-17 18:13:15';

class _EditSalesPageState extends State<EditSalesPage> {
  // TODO(柊太): initStateでコントローラーに入れる
  var nameController = TextEditingController();
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
  final bool _showTitle = true;

  final String _format = 'yyyy-MMMM-dd';
  final TextEditingController _formatCtrl = TextEditingController();

  final DateTimePickerLocale _locale = DateTimePickerLocale.en_us;
  DateTime? _dateTime;

  final List<String> commodity = [
    '太陽光',
    '蓄電池',
    'オール電化',
    'IH',
    'エコキュート',
  ];
  List<String> selectedCommodity = [];

  @override
  void initState() {
    super.initState();
    nameController.text = widget.item['name'] ?? '';
    addressController.text = widget.item['address'] ?? '';
    salesController.text = widget.item['sales'] ?? '';
    apController.text = widget.item['appointer'] ?? '';
    clController.text = widget.item['closer'] ?? '';
    investigationController.text = widget.item['investigation'] ?? '';
    constructionController.text = widget.item['construction'] ?? '';
    contractController.text = widget.item['contract'] ?? '';
    selectedCommodity = List<String>.from(widget.item['commodity'] ?? []);
    _formatCtrl.text = _format;
    _dateTime = DateTime.parse(INIT_DATETIME);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        toolbarHeight: 80,
        title: const Text(
          '編集',
          style: TextStyle(
              color: Colors.indigoAccent,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 56,
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
                        items: commodity
                            .map((e) => MultiSelectItem<String>(e, e))
                            .toList(),
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
                          DatePicker.showDatePicker(
                            context,
                            onMonthChangeStartWithFirstDate: true,
                            pickerTheme: DateTimePickerTheme(
                              showTitle: _showTitle,
                              confirm: const Text('custom Done', style: TextStyle(color: Colors.red)),
                            ),
                            minDateTime: DateTime.parse(MIN_DATETIME),
                            maxDateTime: DateTime.parse(MAX_DATETIME),
                            initialDateTime: _dateTime,
                            dateFormat: _format,
                            locale: _locale,
                            onChange: (dateTime, List<int> index) {
                              setState(() {
                                _dateTime = dateTime;
                              });
                            },
                            onConfirm: (dateTime, List<int> index) {
                              setState(() {
                                _dateTime = dateTime;
                              });
                            },
                          );
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
                          DatePicker.showDatePicker(
                            context,
                            onMonthChangeStartWithFirstDate: true,
                            pickerTheme: DateTimePickerTheme(
                              showTitle: _showTitle,
                              confirm: const Text('custom Done', style: TextStyle(color: Colors.red)),
                            ),
                            minDateTime: DateTime.parse(MIN_DATETIME),
                            maxDateTime: DateTime.parse(MAX_DATETIME),
                            initialDateTime: _dateTime,
                            dateFormat: _format,
                            locale: _locale,
                            onChange: (dateTime, List<int> index) {
                              setState(() {
                                _dateTime = dateTime;
                              });
                            },
                            onConfirm: (dateTime, List<int> index) {
                              setState(() {
                                _dateTime = dateTime;
                              });
                            },
                          );
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
                          DatePicker.showDatePicker(
                            context,
                            onMonthChangeStartWithFirstDate: true,
                            pickerTheme: DateTimePickerTheme(
                              showTitle: _showTitle,
                              confirm: const Text('custom Done', style: TextStyle(color: Colors.red)),
                            ),
                            minDateTime: DateTime.parse(MIN_DATETIME),
                            maxDateTime: DateTime.parse(MAX_DATETIME),
                            initialDateTime: _dateTime,
                            dateFormat: _format,
                            locale: _locale,
                            onChange: (dateTime, List<int> index) {
                              setState(() {
                                _dateTime = dateTime;
                              });
                            },
                            onConfirm: (dateTime, List<int> index) {
                              setState(() {
                                _dateTime = dateTime;
                              });
                            },
                          );
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
                                        .update({
                                      'salesDate': Timestamp.now(),
                                      'name': nameController.text,
                                      'address': addressController.text,
                                      'sales': salesController.text,
                                      'appointer': apController.text,
                                      'closer': clController.text,
                                      'commodity': selectedCommodity,
                                      'construction':
                                          constructionController.text,
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
      ),
    );
  }
}
