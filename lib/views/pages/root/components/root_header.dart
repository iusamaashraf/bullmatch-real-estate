import 'package:bullmatch/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RootHeader extends StatefulWidget {
  const RootHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<RootHeader> createState() => _RootHeaderState();
}

class _RootHeaderState extends State<RootHeader> {
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          SvgPicture.asset(
            IconClass.inAppLogo,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                isDrawerOpen = !isDrawerOpen;
              });
            },
            child: SvgPicture.asset(
              isDrawerOpen ? IconClass.menuOpen : IconClass.menu,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}
