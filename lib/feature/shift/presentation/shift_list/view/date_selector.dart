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

//TODO: add error message
class _DateSelectorState extends State<DateSelector> {
  late final TextEditingController _textController = TextEditingController(
    text: widget.initialValue?.toString(),
  );
  final _focusNode = FocusNode();

  @override
  void initState() {
    _textController.addListener(() {
      widget.onValueChanged?.call(_textController.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      width: 150,
      height: 150,
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: theme.colorScheme.secondary,
        child: InkWell(
          onTap: () => _focusNode.requestFocus(),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: EditableText(
                focusNode: _focusNode,
                controller: _textController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                keyboardType: TextInputType.number,
                style: theme.textTheme.headlineMedium!.copyWith(
                  color: theme.colorScheme.onSecondary,
                  fontWeight: FontWeight.bold,
                ),
                cursorColor: theme.colorScheme.onSecondary,
                backgroundCursorColor: theme.colorScheme.secondary,
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
    _focusNode.dispose();
    super.dispose();
  }
}
