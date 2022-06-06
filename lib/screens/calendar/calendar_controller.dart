import 'package:flutter_application/screens/calendar/calendar_model.dart';

import 'calendar_view.dart';

class CalendarImplmentation extends CalendarController {

  CalendarImplmentation({
    CalendarModel? model,
  })  : 
        super(model ??
            const CalendarModel(
              username: ''
            ));
}
