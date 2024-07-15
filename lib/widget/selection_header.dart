import 'package:flutter/material.dart';

class SelectionHeader extends StatelessWidget {
  const SelectionHeader({
    super.key,
    required this.title,
    this.action = 'View more',
  });
  final String title;
  final String action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0,bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            action,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
