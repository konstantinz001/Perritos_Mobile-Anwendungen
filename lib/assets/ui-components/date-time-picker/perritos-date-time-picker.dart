import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PerritosDateTimePicker extends StatefulWidget {
  PerritosDateTimePicker(
      {Key? key,
      required this.onSubmitDate,
      required this.onSubmitTime,
      required this.initDate,
      required this.initTime
      })
      : super(key: key);

  final Function(DateTime) onSubmitDate;
  final Function(TimeOfDay) onSubmitTime;

  DateTime initDate;
  TimeOfDay initTime;

  @override
  _PerritosDateTimePickerState createState() => _PerritosDateTimePickerState();
}

class _PerritosDateTimePickerState extends State<PerritosDateTimePicker> {
  late double _height;
  late double _width;

  String? _setTime, _setDate;

  late String _hour, _minute, _time;

  late String dateTime;

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.initDate,
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(2015),
      lastDate: DateTime(2101),
      builder: (BuildContext? context, Widget? child) {
        return Theme(
          data: ThemeData(
              primaryColor: PerritosColor.perritosCharcoal.color,
              colorScheme: ColorScheme.light(
                  primary: PerritosColor.perritosBurntSienna.color),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
              fontFamily: GoogleFonts.pompiere().fontFamily),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        widget.initDate = picked;
        widget.onSubmitDate(widget.initDate);
        _dateController.text = DateFormat.yMd('de').format(widget.initDate);
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: widget.initTime,
      builder: (BuildContext? context, Widget? child) {
        return Theme(
          data: ThemeData(
              primaryColor: PerritosColor.perritosCharcoal.color,
              colorScheme: ColorScheme.light(
                  primary: PerritosColor.perritosBurntSienna.color),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
              fontFamily: GoogleFonts.pompiere().fontFamily),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        widget.initTime = picked;
        widget.onSubmitTime(widget.initTime);
        _timeController.text = DateFormat.Hm('de').format(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            widget.initTime.hour,
            widget.initTime.minute));
      });
    }
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd('de').format(widget.initDate);
    _timeController.text =  DateFormat.Hm('de').format(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            widget.initTime.hour,
            widget.initTime.minute));
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
          child: IntrinsicWidth(
            child: TextFormField(
              style: perritosParagon,
              textAlign: TextAlign.start,
              enabled: false,
              keyboardType: TextInputType.text,
              controller: _dateController,
              onSaved: (String? val) {
                _setDate = val;
              },
              decoration: InputDecoration(
                  disabledBorder:
                      const UnderlineInputBorder(borderSide: BorderSide.none),
                  contentPadding:
                      const EdgeInsets.only(top: 0.0, right: 10, left: 10),
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
          child: IntrinsicWidth(
            child: TextFormField(
              style: perritosParagon,
              textAlign: TextAlign.start,
              onSaved: (String? val) {
                _setTime = val;
              },
              enabled: false,
              keyboardType: TextInputType.text,
              controller: _timeController,
              decoration: InputDecoration(
                  disabledBorder:
                      const UnderlineInputBorder(borderSide: BorderSide.none),
                  contentPadding:
                      const EdgeInsets.only(top: 0.0, right: 10, left: 10),
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
