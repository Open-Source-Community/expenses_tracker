import 'package:flutter/material.dart';

class ListIcon extends StatelessWidget {
  const ListIcon({
    super.key,
    required this.icon,
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xffffd946),
      radius: 25,
      child: Icon(
        icon,
        color: const Color(0xff1e1e1e),
      ),
    );
  }
}
