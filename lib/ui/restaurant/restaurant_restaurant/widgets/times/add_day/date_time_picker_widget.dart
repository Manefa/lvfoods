import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/times/add_day/print_time_component.dart';

class DatetimePickerWidget extends StatefulWidget {
  @override
  _DatetimePickerWidgetState createState() => _DatetimePickerWidgetState();
}

class _DatetimePickerWidgetState extends State<DatetimePickerWidget> {
  DateTime? dateTime;

  String getText() {
    if (dateTime == null) {
      return 'Select DateTime';
    } else {
      return DateFormat('MM/dd/yyyy HH:mm').format(dateTime!);
    }
  }

  @override
  Widget build(BuildContext context) => PrintDateComponent(
    time: getText(),
    onclick: () => pickDateTime(context),
  );

  Future pickDateTime(BuildContext context) async {
    final time = await pickTime(context);
    if (time == null) return;

    setState(() {
      dateTime = DateTime(
        time.hour,
        time.minute,
      );
    });
  }

  Future<TimeOfDay> pickTime(BuildContext context) async {
    final initialTime = TimeOfDay.now();
    final newTime = await showTimePicker(
      context: context,
      initialTime: dateTime != null
          ? TimeOfDay(hour: dateTime!.hour, minute: dateTime!.minute)
          : initialTime,
    );

    if (newTime == null) return TimeOfDay.now();

    return newTime;
  }
}
