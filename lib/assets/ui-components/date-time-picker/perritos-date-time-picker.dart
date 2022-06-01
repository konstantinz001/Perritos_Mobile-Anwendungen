import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';

class PerritosDateTimePicker extends StatefulWidget {
  const PerritosDateTimePicker({Key? key}) : super(key: key);

  @override
  _PerritosDateTimePickerState createState() => _PerritosDateTimePickerState();
}

class _PerritosDateTimePickerState extends State<PerritosDateTimePicker> {
  late double _height;
  late double _width;

  String? _setTime, _setDate;

  late String _hour, _minute, _time;

  late String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = const TimeOfDay(hour: 00, minute: 00);

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101),
        locale: const Locale.fromSubtags(languageCode: 'de'));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd('de').format(selectedDate);
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
    }
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {
            _selectDate(context);
          },
          child: Container(
            width: 100,
            child: TextFormField(
              style: perritosDoublePica,
              textAlign: TextAlign.center,
              enabled: false,
              keyboardType: TextInputType.text,
              controller: _dateController,
              onSaved: (String? val) {
                _setDate = val;
              },
              decoration: InputDecoration(
                  disabledBorder:
                      const UnderlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.only(top: 0.0),
                  filled: true,
                  fillColor:
                      PerritosColor.perritosGoldFusion.color.withOpacity(0.1)),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            _selectTime(context);
          },
          child: Container(
            width: 100,
            child: TextFormField(
              style: perritosDoublePica,
              textAlign: TextAlign.center,
              onSaved: (String? val) {
                _setTime = val;
              },
              enabled: false,
              keyboardType: TextInputType.text,
              controller: _timeController,
              decoration: InputDecoration(
                  disabledBorder:
                      const UnderlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.only(top: 0.0),
                  filled: true,
                  fillColor:
                      PerritosColor.perritosGoldFusion.color.withOpacity(0.1)),
            ),
          ),
        ),
      ],
    );
  }
}
