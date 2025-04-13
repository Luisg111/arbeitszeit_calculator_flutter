import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({
    super.key,
    this.initialValue,
    this.onValueChanged,
    required this.inputHelper,
    required this.isEntryValid,
  });

  final int? initialValue;
  final void Function(String input)? onValueChanged;
  final String inputHelper;
  final bool isEntryValid;

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  late final TextEditingController _textController = TextEditingController(
    text: widget.initialValue?.toString(),
  );

  @override
  void initState() {
    _textController.addListener(() {
      widget.onValueChanged?.call(_textController.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Card(
        color: Colors.grey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: TextFormField(
              controller: _textController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                helperText: widget.inputHelper,
                errorText: widget.isEntryValid ? null : "Invalide Eingabe",
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
