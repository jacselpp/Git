import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/ui/views/auth/profile_view.dart';
import 'package:flutter/material.dart';

import '../app_ui.dart';

class Testimonials extends StatelessWidget {
  const Testimonials({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.only(top: 50.0),
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                locale.read('with_the_trust'),
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              locale.read('with_the_trust_subtitle'),
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            const Separation(),
            CustomTextButton(
                color: primaryColor,
                label: locale.read('write_testimonial'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProfileView(
                      initialIndex: 1,
                    ),
                  ));
                }),
            const Separation(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: TestimonialsWidget(),
              ),
            ),
            const Separation(),
          ],
        ),
      ),
    );
  }
}
