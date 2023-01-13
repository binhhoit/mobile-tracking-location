import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    Key? key,
    required this.handleTapIndex,
  }) : super(key: key);

  final Function(int) handleTapIndex;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
        widget.handleTapIndex(index);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.local_shipping),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.moped),
          label: "Order",
        ),
      ],
    );
  }
}
