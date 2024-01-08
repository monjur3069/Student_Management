import 'package:flutter/material.dart';

import '../utils/constants.dart';

class EveryClassAppbar extends StatelessWidget implements PreferredSizeWidget {
  String className;
  EveryClassAppbar({required this.className,super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey.shade200,
      title: Center(
        child: Text(
          'Class $className',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: primaryColorTitle,
          ),
        ),
      ),
      actions: [
        Icon(Icons.more_vert),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
