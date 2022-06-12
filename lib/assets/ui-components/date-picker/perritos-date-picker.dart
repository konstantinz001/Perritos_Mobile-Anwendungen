import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PerritosDatePicker extends StatefulWidget {
  PerritosDatePicker({
    Key? key,
    required this.onSubmitDate,
    required this.initDate,
  }) : super(key: key);

  final Function(DateTime) onSubmitDate;

  DateTime initDate;

  @override
  _PerritosDatePickerState createState() => _PerritosDatePickerState();
}

class _PerritosDatePickerState extends State<PerritosDatePicker> {
  late double _height;
  late double _width;

  String? _setDate;

  late String dateTime;

  final TextEditingController _dateController = TextEditingController();

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

  @override
  void initState() {
    _dateController.text = DateFormat.yMd('de').format(widget.initDate);
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
      ],
    );
  }
}
