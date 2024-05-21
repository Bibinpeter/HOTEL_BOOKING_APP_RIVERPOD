import 'package:flutter/material.dart';
import 'package:hotel/screen/home/home.dart';
import 'package:hotel/screen/home/map.dart';
import 'package:hotel/screen/home/profile.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
    
      surfaceTintColor: Colors.white.withAlpha(5),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavBarIcon(
              iconPath: Icons.home,
              text: 'Home',
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const Homepage()),
                  ),
                );
              },
              isSelected: widget.index == 0,
            ),
            _NavBarIcon(
              iconPath: Icons.map,
              text: 'Map',
              isSelected: widget.index == 1,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const MapPage()),
                  ),
                );
              },
            ),
            const _NavBarIcon(
              iconPath: Icons.book_online,
              text: 'Booking',
            ),
           _NavBarIcon(
              iconPath: Icons.verified_user,
              text: 'Profile',
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const ProfilePage()),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBarIcon extends StatelessWidget {
  const _NavBarIcon({
    required this.iconPath,
    required this.text,
    this.onTap,
    this.isSelected = false,
  });

  final IconData iconPath;
  final String text;
  final Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? Colors.blue : Colors.grey;
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconPath, color: color), 
          const SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
