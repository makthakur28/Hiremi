import 'package:flutter/material.dart';
import 'package:hiremi/providers/bottomnav_provider.dart';
import 'package:provider/provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar(
      {super.key, 
      required this.selectedIndex,
      required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 0, 'Home', context),
            _buildNavItem(Icons.search, 1, 'Search', context),
            const SizedBox(
              width: 16,
            ),
            _buildNavItem(Icons.notifications, 2, 'Alerts', context),
            _buildNavItem(Icons.person, 3, 'Profile', context),
          ],
        ),
      ),
    ]);
  }

  Widget _buildNavItem(
      IconData icon, int index, String label, BuildContext context) {
    bool isSelected =
        index == Provider.of<NavProvider>(context, listen: true).selectedIndex;

    return GestureDetector(
      onTap: () {
        debugPrint("Item Index tapped : $index");
        onItemTapped(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              color: isSelected ? Colors.red : Colors.black54,
              size: isSelected ? 24 : 20),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.red : Colors.black54,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: isSelected ? 12 : 10,
            ),
          ),
        ],
      ),
    );
  }
}