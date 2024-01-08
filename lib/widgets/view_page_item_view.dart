import 'package:flutter/material.dart';
import '../../utils/dashboard_page_item.dart';
import '../utils/view_page_item.dart';


class ViewPageItemView extends StatelessWidget {
  final ViewPageItem item;
  final Function(String) onPressed;

  const ViewPageItemView({
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
        margin: EdgeInsets.zero,
        elevation: 5,
        child: SizedBox(

          height: 144,
          width: 136,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
