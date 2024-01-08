import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'constants.dart';

void showMsg(BuildContext context, String msg, Color color) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: primaryColorWhite,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16))
        ),
        content: Text(
          msg,
          style: TextStyle(color: color),
        )
    ));

String getFormattedDateTime(DateTime dateTime, String format) =>
    DateFormat(format).format(dateTime);
