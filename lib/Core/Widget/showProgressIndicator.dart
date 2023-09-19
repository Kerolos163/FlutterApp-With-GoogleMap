import 'package:flutter/material.dart';

showProgressIndicator(context) {
  AlertDialog alertDialog = const AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      ),
    ),
  );
  showDialog(
    context: context,
    builder: (context) => alertDialog,
  );
}
