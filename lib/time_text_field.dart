import 'package:flutter/material.dart';
import 'package:flutter_application_1/text_field_decoration.dart';

class TimeTextField extends StatefulWidget {
  final String labelText;
  final String? initialValue;

  const TimeTextField({super.key, required this.labelText, this.initialValue});

  @override
  State<TimeTextField> createState() => _TimeTextFieldState();
}

class _TimeTextFieldState extends State<TimeTextField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.initialValue ?? '');
  }

  Future<void> _selectTime() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      final hour = pickedTime.hour.toString().padLeft(2, '0');
      final minute = pickedTime.minute.toString().padLeft(2, '0');

      controller.text = '$hour:$minute';
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(fontSize: 11),
      decoration:
          TextFieldDecoration.standard(
            isDense: true,
            labelText: widget.labelText,
            suffixIcon: IconButton(
              onPressed: _selectTime,
              icon: const Icon(Icons.av_timer),
            ),
          ).copyWith(
            suffixIconConstraints: const BoxConstraints(
              minWidth: 35,
              minHeight: 35,
            ),
          ),
    );
  }
}
