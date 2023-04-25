import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class HomePaceChart extends StatefulWidget {
  const HomePaceChart({Key? key}) : super(key: key);

  @override
  State<HomePaceChart> createState() => _HomePaceChart();
}

class _HomePaceChart extends State<HomePaceChart> {
  late FlTitlesData _titles;
  final TextStyle _labelStyle =
  const TextStyle(fontSize: 12, fontWeight: FontWeight.w800);
  final TextStyle _titleStyle =
  const TextStyle(fontSize: 24, fontWeight: FontWeight.w800);

  void _initChartTitle() {
    _titles = FlTitlesData(
      topTitles: AxisTitles(
          axisNameWidget: Text(
            '売上ペース',
            style: _titleStyle,
          ),
          axisNameSize: 48),
      rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          )),
      bottomTitles: AxisTitles(
        sideTitles: _bottomTitles(),
        axisNameWidget: Container(
          alignment: Alignment.centerRight,
          child: Text(
            "日",
            style: _labelStyle,
          ),
        ),
      ),
      leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) => Text(
              value.toInt().toString(),
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          axisNameWidget: Text(
            "売上(百万円)",
            style: _labelStyle,
          ),
          axisNameSize: 32),
    );
  }

  SideTitles _bottomTitles() => SideTitles(
      showTitles: true,
      reservedSize: 28,
      interval: 7,
      getTitlesWidget: (month, meta) {
        const style = TextStyle(
          color: Color(0xff72719b),
          fontWeight: FontWeight.bold,
          fontSize: 12,
        );
        String text;

        if (month.toInt() < 1 || month.toInt() > 31) {
          text = "";
        } else {
          text = "${month.toInt()}";
        }

        return SideTitleWidget(
          axisSide: meta.axisSide,
          space: 10,
          child: Text(
            text,
            style: style,
          ),
        );
      });

  @override
  void initState() {
    super.initState();
    _initChartTitle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8, right: 32),
              height: 350,
              width: double.infinity,
              child: LineChart(LineChartData(
                  backgroundColor: Colors.grey[200],
                  titlesData: _titles,
                  minX: 1,
                  maxX: 31,
                  minY: 0,
                  maxY: 20,
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      color: Colors.red[400],
                      barWidth: 4,
                      dotData: FlDotData(show: false),
                      spots: const [
                        FlSpot(1, 1.1),
                        FlSpot(2, 1.1),
                        FlSpot(3, 2.2),
                        FlSpot(4, 2.2),
                        FlSpot(5, 2.2),
                        FlSpot(6, 2.2),
                        FlSpot(7, 2.2),
                        FlSpot(8, 2.2),
                        FlSpot(9, 2.2),
                        FlSpot(10, 2.2),
                        FlSpot(11, 2.2),
                        FlSpot(12, 2.2),
                      ],
                    ),
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}