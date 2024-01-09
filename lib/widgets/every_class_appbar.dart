import 'package:flutter/material.dart';

import '../utils/constants.dart';

class EveryClassAppbar extends StatelessWidget implements PreferredSizeWidget {
  String className;
  EveryClassAppbar({required this.className,super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AppBar(
      iconTheme: IconThemeData(color: theme.cardColor),
      title: Center(
        child: Text(
          'Class $className',
          style: TextStyle(
            color: theme.cardColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
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
