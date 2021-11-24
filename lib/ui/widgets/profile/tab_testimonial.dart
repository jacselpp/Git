import 'package:detooo_recargas/ui/widgets/add_testimonials_widget.dart';
import 'package:flutter/material.dart';

import '../../app_ui.dart';

class TabTestimonials extends StatefulWidget {
  const TabTestimonials({Key? key}) : super(key: key);

  @override
  _TabTestimonialsState createState() => _TabTestimonialsState();
}

class _TabTestimonialsState extends State<TabTestimonials> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: CustomContainer(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: AddTestimonials(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
