import 'package:flutter/material.dart';

Future showDialogWidget(context, review) {
  return showDialog(context: context, builder: (builder){
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        backgroundColor: Colors.green,
        insetPadding:const EdgeInsets.all(30.0),
        elevation: 20,
        child: Container(
          color: Colors.transparent,
          child: review,
        ),
    );
  });
}