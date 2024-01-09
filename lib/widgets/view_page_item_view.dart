import 'package:flutter/material.dart';
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
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        onPressed(item.title);
      },
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 5,
        color: theme.primaryColor,
        child: SizedBox(
          height: 144,
          width: 136,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.title,
                style: TextStyle(color: theme.cardColor,fontSize: 16,
                  fontWeight: FontWeight.w600,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
