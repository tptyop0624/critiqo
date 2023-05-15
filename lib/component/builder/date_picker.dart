import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _selectedDate;

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2002),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting(Localizations.localeOf(context).toString());
    final year = _selectedDate?.year.toString() ?? '';
    final month = _selectedDate?.month.toString() ?? '';
    final day = _selectedDate?.day.toString() ?? '';
    final weekday = _selectedDate != null
        ? DateFormat('EEEE', Localizations.localeOf(context).languageCode)
            .format(_selectedDate!)
        : '';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _selectedDate == null
            ? Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                padding: const EdgeInsets.all(10),
                child: const Text('선택된 날짜가 없습니다.'))
            : Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                padding: const EdgeInsets.all(10),
                child: Text('$year/$month/$day $weekday')),
        const SizedBox(height: 3),
        ElevatedButton(
          onPressed: _selectDate,
          child: const Text('날짜선택'),
        ),
      ],
    );
  }
}
