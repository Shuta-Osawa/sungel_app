import 'package:flutter/material.dart';
import 'package:sungel_app/products/achievement/achivement_button.dart';

class Achievement extends StatefulWidget {
  const Achievement({Key? key}) : super(key: key);

  @override
  State<Achievement> createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            AchievementButton(title: '訪問件数', countValue: '0', onPressed: () {}),
            const SizedBox(
              height: 12,
            ),
            AchievementButton(title: '成約', countValue: '0', onPressed: () {}),
            const SizedBox(
              height: 12,
            ),
            AchievementButton(title: 'アポ', countValue: '0', onPressed: () {}),
            const SizedBox(
              height: 12,
            ),
            AchievementButton(title: '見込み', countValue: '0', onPressed: () {}),
            const SizedBox(
              height: 12,
            ),
            AchievementButton(title: '留守', countValue: '0', onPressed: () {}),
            const SizedBox(
              height: 12,
            ),
            AchievementButton(
                title: 'インターホンキック', countValue: '0', onPressed: () {}),
            const SizedBox(
              height: 12,
            ),
            AchievementButton(
                title: 'ドアキック', countValue: '0', onPressed: () {}),
            const SizedBox(
              height: 12,
            ),
            AchievementButton(title: 'ドアイン', countValue: '0', onPressed: () {}),
            const SizedBox(
              height: 12,
            ),
            AchievementButton(title: '試算表', countValue: '0', onPressed: () {}),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => {},
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
            Card(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                        child: Text(
                          '今月成約件数',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '3件',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                        child: Text(
                          '今月アポ件数',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '5件',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                        child: Text(
                          '今月訪問件数',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '40件',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
