import 'package:flutter/material.dart';

import '../../app_ui.dart';
import '../../screen_helper.dart';

class BuildSuggestions extends StatelessWidget {
  const BuildSuggestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildSuggestions(context);
  }

  Widget _buildSuggestions(BuildContext context) {
    return SizedBox(
      width: ScreenHelper.screenWidth(context),
      child: Container(
        color: Theme.of(context).cardColor,
        child: _topUpstoCuba(context),
      ),
    );
  }

  Widget _topUpstoCuba(BuildContext context) {
    return Image.asset(
      'assets/images/103.png',
      fit: BoxFit.fitWidth,
    );
  }
}
