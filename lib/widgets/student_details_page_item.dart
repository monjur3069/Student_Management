import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class StudentDetailsPageItem extends StatelessWidget {
  String title, subTitle;

  StudentDetailsPageItem(
      {required this.title, required this.subTitle, super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: theme.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              ' : ',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: theme.primaryColor),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              subTitle,
              style: TextStyle(
                color: theme.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
