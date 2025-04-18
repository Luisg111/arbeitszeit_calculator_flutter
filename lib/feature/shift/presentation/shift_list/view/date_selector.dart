import "dart:async";

import "package:flutter/material.dart";
import "package:flutter/services.dart";

class DateSelector extends StatefulWidget {
  const DateSelector({
    required this.inputHelper, required this.isEntryValid, super.key,
    this.initialValue,
    this.onValueChanged,
  });

  final int? initialValue;
  final void Function(String input)? onValueChanged;
  final String inputHelper;
  final bool isEntryValid;

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

// TODO(Luisg111): add error message
class _DateSelectorState extends State<DateSelector> {
  late final TextEditingController _textController = TextEditingController(
    text: widget.initialValue?.toString(),
  );
  final _focusNode = FocusNode();
  Timer? _debounceTimer;

  @override
  void initState() {
    _textController.addListener(() {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 500),(){
        widget.onValueChanged?.call(_textController.text);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 150,
      height: 150,
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: theme.colorScheme.secondary,
        child: InkWell(
          onTap: _focusNode.requestFocus,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EditableText(
                    focusNode: _focusNode,
                    controller: _textController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                    ],
                    keyboardType: TextInputType.number,
                    style: theme.textTheme.headlineMedium!.copyWith(
                      color: theme.colorScheme.onSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                    cursorColor: theme.colorScheme.onSecondary,
                    backgroundCursorColor: theme.colorScheme.secondary,
                  ),
                  Text(
                    widget.inputHelper,
                    style: theme.textTheme.labelLarge!.copyWith(
                      color: theme.colorScheme.onSecondary,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
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
    _debounceTimer?.cancel();
    super.dispose();
  }
}
