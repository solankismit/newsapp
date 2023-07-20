import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/bubblebarprovider.dart';
import 'package:provider/provider.dart';
class CustomBubbleBar extends StatelessWidget {
  final List<IconData> icons;
  final List<String> labels;

  CustomBubbleBar({required this.icons, required this.labels});

  @override
  Widget build(BuildContext context) {
    final bottomNavBarProvider = Provider.of<BubbleBarProvider>(context);
    int currentIndex = bottomNavBarProvider.currentIndex;

    return Container(
      height: 64.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          icons.length,
              (index) => BubbleBarItem(
            icon: icons[index],
            label: labels[index],
            isSelected: index == currentIndex,
            onTap: () {
              bottomNavBarProvider.updateIndex(index);
            },
          ),
        ),
      ),
    );
  }
}
class BubbleBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  BubbleBarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 64.0,
        height: 64.0,
        padding: EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                color: isSelected ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
