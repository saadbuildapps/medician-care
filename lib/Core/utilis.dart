import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
}

class Utilis {
  static void onChangeField(
      BuildContext context, FocusNode currentNode, FocusNode nextfocusNode) {
    currentNode.unfocus();

    FocusScope.of(context).requestFocus(nextfocusNode);
  }
}
