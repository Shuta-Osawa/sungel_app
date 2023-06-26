import 'package:flutter/material.dart';

import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';

class DatePickerBottomSheet extends StatefulWidget {
  const DatePickerBottomSheet({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DatePickerBottomSheetState();
}

const String MIN_DATETIME = '2010-05-12';
const String MAX_DATETIME = '2030-11-25';
const String INIT_DATETIME = '2021-08-31';

class _DatePickerBottomSheetState extends State<DatePickerBottomSheet> {
  bool? _showTitle = true;

  DateTimePickerLocale? _locale = DateTimePickerLocale.en_us;
  final List<DateTimePickerLocale> _locales = DateTimePickerLocale.values;

  String _format = 'yyyy-MMMM-dd';
  final TextEditingController _formatCtrl = TextEditingController();

  DateTime? _dateTime;

  @override
  void initState() {
    super.initState();
    _formatCtrl.text = _format;
    _dateTime = DateTime.parse(INIT_DATETIME);
  }

  @override
  Widget build(BuildContext context) {
    // create locale radio list
    List<Widget> radios = [];
    for (var locale in _locales) {
      radios.add(Container(
        margin: const EdgeInsets.only(right: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Radio(
              value: locale,
              groupValue: _locale,
              onChanged: (dynamic value) {
                setState(() {
                  _locale = value;
                });
              },
            ),
            Text(locale
                .toString()
                .substring(locale.toString().indexOf('.') + 1)),
          ],
        ),
      ));
    }

    TextStyle hintTextStyle =
    Theme.of(context).textTheme.titleMedium!.apply(color: const Color(0xFF999999));
    return Scaffold(
      appBar: AppBar(title: const Text('DatePicker Bottom Sheet')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // min datetime hint
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 115.0,
                    child: Text('min DateTime:', style: hintTextStyle),
                  ),
                  Text(MIN_DATETIME,
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),

            // max datetime hint
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                      width: 115.0,
                      child: Text('max DateTime:', style: hintTextStyle)),
                  Text(MAX_DATETIME,
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),

            // init datetime hint
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                      width: 115.0,
                      child: Text('init DateTime:', style: hintTextStyle)),
                  Text(INIT_DATETIME,
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),

            // show title widget checkbox
            Row(
              children: <Widget>[
                const Text('show title'),
                Checkbox(
                  value: _showTitle,
                  onChanged: (value) {
                    setState(() {
                      _showTitle = value;
                    });
                  },
                )
              ],
            ),

            // date format input field
            TextField(
              controller: _formatCtrl,
              keyboardType: TextInputType.url,
              decoration: const InputDecoration(
                labelText: 'Date Format',
                hintText: 'yyyy-MM-dd',
                hintStyle: TextStyle(color: Colors.black26),
              ),
              onChanged: (value) {
                _format = value;
              },
            ),

            // locale check radio group
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Locale: '),
                  Wrap(direction: Axis.horizontal, children: radios)
                ],
              ),
            ),

            // selected date
            Container(
              margin: const EdgeInsets.only(top: 40.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Selected Date:',
                      style: Theme.of(context).textTheme.titleMedium),
                  Container(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      '${_dateTime!.year}-${_dateTime!.month.toString().padLeft(2, '0')}-${_dateTime!.day.toString().padLeft(2, '0')}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // display DatePicker floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: _showDatePicker,
        tooltip: 'Show DatePicker',
        child: const Icon(Icons.date_range),
      ),
    );
  }

  /// Display date picker.
  void _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      onMonthChangeStartWithFirstDate: true,
      pickerTheme: DateTimePickerTheme(
        showTitle: _showTitle!,
        confirm: const Text('custom Done', style: TextStyle(color: Colors.red)),
      ),
      minDateTime: DateTime.parse(MIN_DATETIME),
      maxDateTime: DateTime.parse(MAX_DATETIME),
      initialDateTime: _dateTime,
      dateFormat: _format,
      locale: _locale!,
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
  }
}