import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sungel_app/products/achievement/achivement_button.dart';

class Achievement extends StatefulWidget {
  const Achievement({Key? key}) : super(key: key);

  @override
  State<Achievement> createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {
  int visitCount = 0;
  int closingCount = 0;
  int appointmentCount = 0;
  int prospectCount = 0;
  int absenceCount = 0;
  int intercomCount = 0;
  int frontCount = 0;
  int doorstepCount = 0;
  int calculationCount = 0;

  void visitIncrementCount() {
    setState(() {
      visitCount++;
    });
  }

  void visitDecrementCount() {
    setState(() {
      visitCount--;
    });
  }

  void closingIncrementCount() {
    setState(() {
      closingCount++;
    });
  }

  void closingDecrementCount() {
    setState(() {
      closingCount--;
    });
  }

  void appointmentIncrementCount() {
    setState(() {
      appointmentCount++;
    });
  }

  void appointmentDecrementCount() {
    setState(() {
      appointmentCount--;
    });
  }

  void prospectIncrementCount() {
    setState(() {
      prospectCount++;
    });
  }

  void prospectDecrementCount() {
    setState(() {
      prospectCount--;
    });
  }

  void absenceIncrementCount() {
    setState(() {
      absenceCount++;
    });
  }

  void absenceDecrementCount() {
    setState(() {
      absenceCount--;
    });
  }

  void intercomIncrementCount() {
    setState(() {
      intercomCount++;
    });
  }

  void intercomDecrementCount() {
    setState(() {
      intercomCount--;
    });
  }

  void frontIncrementCount() {
    setState(() {
      frontCount++;
    });
  }

  void frontDecrementCount() {
    setState(() {
      frontCount--;
    });
  }

  void doorstepIncrementCount() {
    setState(() {
      doorstepCount++;
    });
  }

  void doorstepDecrementCount() {
    setState(() {
      doorstepCount--;
    });
  }

  void calculationIncrementCount() {
    setState(() {
      calculationCount++;
    });
  }

  void calculationDecrementCount() {
    setState(() {
      calculationCount--;
    });
  }

  Future<List<Map<String, dynamic>>> getClosing() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('sungel')
        .doc('v1')
        .collection('achievement')
        .doc('uid')
        .collection('${DateTime.now().year}_${DateTime.now().month}')
        .get();
    return snapshot.docs.map((e) => e.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            AchievementButton(
              title: '訪問件数',
              countValue: visitCount,
              onIncrement: visitIncrementCount,
              onDecrement: visitDecrementCount,
            ),
            const SizedBox(
              height: 12,
            ),
            AchievementButton(
              title: '成約',
              countValue: closingCount,
              onIncrement: closingIncrementCount,
              onDecrement: closingDecrementCount,
            ),
            const SizedBox(
              height: 12,
            ),
            AchievementButton(
              title: 'アポ',
              countValue: appointmentCount,
              onIncrement: appointmentIncrementCount,
              onDecrement: appointmentDecrementCount,
            ),
            const SizedBox(
              height: 12,
            ),
            AchievementButton(
              title: '見込み',
              countValue: prospectCount,
              onIncrement: prospectIncrementCount,
              onDecrement: prospectDecrementCount,
            ),
            const SizedBox(
              height: 12,
            ),
            AchievementButton(
              title: '留守',
              countValue: absenceCount,
              onIncrement: absenceIncrementCount,
              onDecrement: absenceDecrementCount,
            ),
            const SizedBox(
              height: 12,
            ),
            AchievementButton(
              title: 'インターホンキック',
              countValue: intercomCount,
              onIncrement: intercomIncrementCount,
              onDecrement: intercomDecrementCount,
            ),
            const SizedBox(
              height: 12,
            ),
            AchievementButton(
              title: 'ドアキック',
              countValue: frontCount,
              onIncrement: frontIncrementCount,
              onDecrement: frontDecrementCount,
            ),
            const SizedBox(
              height: 12,
            ),
            AchievementButton(
              title: 'ドアイン',
              countValue: doorstepCount,
              onIncrement: doorstepIncrementCount,
              onDecrement: doorstepDecrementCount,
            ),
            const SizedBox(
              height: 12,
            ),
            AchievementButton(
              title: '試算表',
              countValue: calculationCount,
              onIncrement: calculationIncrementCount,
              onDecrement: calculationDecrementCount,
            ),
            const SizedBox(height: 20),
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
                                .collection('achievement')
                                .doc('uid')
                                .collection(
                                    '${DateTime.now().year}_${DateTime.now().month}')
                                .doc()
                                .set({
                              'achievementDate': Timestamp.now(),
                              'visit': visitCount,
                              'closing': closingCount,
                              'appointment': appointmentCount,
                              'prospect': prospectCount,
                              'absence': absenceCount,
                              'intercom': intercomCount,
                              'front': frontCount,
                              'doorstep': doorstepCount,
                              'calculation': calculationCount,
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
                padding: EdgeInsets.fromLTRB(24, 4, 24, 4),
                child: Text(
                  '確定',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            FutureBuilder(
              future: getClosing(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  final error = snapshot.error;
                  return Text(
                    '$error',
                    style: const TextStyle(
                      fontSize: 60,
                    ),
                  );
                } else if (snapshot.hasData) {
                  final result = snapshot.data;
                  var appointmentData = 0;
                  var closingData = 0;
                  var visitData = 0;
                  if (result != null) {
                    for (var item in result) {
                      var appointment = item['appointment'];
                      var closing = item['closing'];
                      var visit = item['visit'];
                      if (appointment is int) {
                        appointmentData += appointment;
                      }
                      if (closing is int) {
                        closingData += closing;
                      }
                      if (visit is int) {
                        visitData += visit;
                      }
                    }
                  }
                  return Card(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 0),
                              child: Text(
                                '今月成約件数',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              '$closingData件',
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 0),
                              child: Text(
                                '今月アポ件数',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              '$appointmentData件',
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 0),
                              child: Text(
                                '今月訪問件数',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              '$visitData件',
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                } else {
                  return const Text(
                    "しばらくお待ち下さい",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
