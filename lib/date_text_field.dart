import 'package:flutter/material.dart';
import 'package:flutter_application_1/text_field_decoration.dart';

class DateTextField extends StatefulWidget {
  final DateTime? initialDate;
  final Widget? suffixIcon;
  final String? labelText;

  const DateTextField({
    super.key,
    this.initialDate,
    this.labelText,
    this.suffixIcon,
  });

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(
      text: widget.initialDate == null ? '' : _formatDate(widget.initialDate!),
    );
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();

    return '$day/$month/$year';
  }

  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: widget.initialDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      controller.text = _formatDate(date);
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
      readOnly: true,
      style: const TextStyle(fontSize: 11),
      decoration: TextFieldDecoration.standard(
        isDense: true,
        labelText: widget.labelText,
        suffixIcon: IconButton(
          onPressed: _selectDate,
          icon: widget.suffixIcon ?? const Icon(Icons.calendar_month),
        ),
      ),
    );
  }
}
