import "package:flutter/material.dart";

Future<bool?> showDeleteConfirmDialog(
  BuildContext context, {
  String? customTitle,
  String? customBody,
}) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(customTitle ?? "Element löschen?"),
        content: Text(
          customBody ??
              "Wollen Sie dieses Element wirklich löschen? Diese Aktion kann nicht rückgangig gemacht werden!",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("Abbrechen"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text("Löschen"),
          ),
        ],
      );
    },
  );
}
