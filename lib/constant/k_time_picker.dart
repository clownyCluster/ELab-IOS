import 'package:flutter/material.dart';

import 'ui_helpers.dart';


class KTimePicker extends StatefulWidget {
  final Function(TimeOfDay) onTimePicked;
  const KTimePicker({required this.onTimePicked, Key? key}) : super(key: key);
  @override
  _KTimePickerState createState() => _KTimePickerState();
}

class _KTimePickerState extends State<KTimePicker> {
  TextEditingController timeController = TextEditingController();
  late TimeOfDay selectedTime;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      var now = TimeOfDay.now();
      var time = TimeOfDay(hour: now.hour, minute: 0);
      selectedTime = time;
      timeController.text = time.format(context);
      widget.onTimePicked(time);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());
        TimeOfDay? pickedTime =
            await showTimePicker(context: context, initialTime: selectedTime);

        if (pickedTime == null) return;

        timeController.text = pickedTime.format(context);
        selectedTime = pickedTime;

        widget.onTimePicked(pickedTime);
      },
      child: TextField(
        controller: timeController,
        enabled: false,
        decoration: const InputDecoration(
          contentPadding: sXPadding,
          suffixIcon: Icon(Icons.access_time_outlined),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black12,
            ),
          ),
        ),
      ),
    );
  }
}
