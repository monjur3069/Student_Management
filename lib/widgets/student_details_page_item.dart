import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class StudentDetailsPageItem extends StatelessWidget {
  String title, subTitle;

  StudentDetailsPageItem(
      {required this.title, required this.subTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: primaryColorTitle),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              subTitle,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
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
