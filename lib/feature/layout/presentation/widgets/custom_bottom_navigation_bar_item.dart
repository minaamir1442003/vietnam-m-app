import 'package:flutter/material.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const CustomBottomNavigationBarItem({super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : Colors.white70,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.white70,
                fontSize: 12,

                overflow: TextOverflow.ellipsis,

                fontWeight:
                isActive ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
            const SizedBox(height: 4),
            if (isActive)
              Container(
                width: 16,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
class CustomBottomNavigationBarItemByOrder extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const CustomBottomNavigationBarItemByOrder({super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : Colors.white70,
            ),
            // const SizedBox(height: 2),
            Column(
              children: [
                Text(
                  "اطلب",
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.white70,
                    fontSize: 9,
                    overflow: TextOverflow.ellipsis,
                    fontWeight:
                    isActive ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.white70,
                    fontSize: 10,

                    overflow: TextOverflow.ellipsis,

                    fontWeight:
                    isActive ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            if (isActive)
              Container(
                width: 16,
                height:2,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
