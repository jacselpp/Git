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
    return Container(
      color: Theme.of(context).cardColor,
      child: _buildSuggestionsItems(context),
    );
  }

  Widget _buildSuggestionsItems(BuildContext context) {
    return Column(
      children: [
        _topUpstoCuba(context),
      ],
    );
  }

  Widget _topUpstoCuba(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: ScreenHelper.screenWidth(context),
              color: Theme.of(context).cardColor,
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/103.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
