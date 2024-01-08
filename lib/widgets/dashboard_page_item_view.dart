import 'package:flutter/material.dart';

import '../utils/dashboard_page_item.dart';


class DashboardPageItemView extends StatelessWidget {
  final DashboardPageItem item;
  final Function(String) onPressed;

  const DashboardPageItemView({
    Key? key,
    required this.item,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed(item.title);
      },
      child: Card(
        elevation: 5,
        child: SizedBox(
          height: 144,
          width: 136,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                item.icon,
                size: 40,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}