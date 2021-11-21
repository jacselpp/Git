import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_ui.dart';

class Sponsors extends StatelessWidget {
  const Sponsors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _items = [
      'marca1.svg',
      'marca2.svg',
      'marca3.svg',
      'marca4.svg',
      'marca5.svg',
    ];
    return SizedBox(
      width: ScreenHelper.screenWidth(context),
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        primary: false,
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildSponsorItem(_items[index]);
        },
      ),
    );
  }

  Widget _buildSponsorItem(String s) {
    return SizedBox(
      width: 150.0,
      height: 150.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          'assets/images/$s',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
