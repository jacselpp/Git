import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/models/recargas/testimonials_model.dart';
import 'package:detooo_recargas/services/network/api_recargas.dart';
import 'package:detooo_recargas/services/providers/testimonials_provider.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:detooo_recargas/utils/handle_errors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTestimonials extends StatefulWidget {
  const AddTestimonials({Key? key}) : super(key: key);

  @override
  _AddTestimonialsState createState() => _AddTestimonialsState();
}

class _AddTestimonialsState extends State<AddTestimonials> {
  int _rating = 0;
  int _length = 0;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _testimonialController = TextEditingController();

  void _setRating(int value) {
    setState(() {
      _rating = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _testimonialController.addListener(() {
      setState(() {
        _length = _testimonialController.text.length;
      });
    });
  }

  @override
  void dispose() {
    _testimonialController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Divider(),
          const SizedBox(
            height: 10.0,
          ),
          CustomTextFormField(
            minLines: 5,
            label: locale.read('testimonial'),
            controller: _testimonialController,
            validator: (value) {
              if (value!.trim().isEmpty || value.length < 20) {
                return locale.read('testimonial_too_short');
              }
            },
            helperText: (_length > 0) ? '$_length > 20' : '',
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            locale.read('rating'),
            style: Theme.of(context).textTheme.headline5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildRating(),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextButton(
                  color: primaryColor,
                  label: locale.read('send_testimonial'),
                  onPressed: _handleTestimonial,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: CustomTextButton(
                  color: Colors.redAccent,
                  label: locale.read('cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildRating() {
    List<Widget> rating = [];
    for (var i = 1; i <= 5; ++i) {
      if (_rating >= i) {
        rating.add(
          IconButton(
            onPressed: () => _setRating(i),
            icon: const Icon(
              Icons.star,
              size: 24.0,
              color: Color(0xFFD4AF37),
            ),
          ),
        );
      } else {
        rating.add(
          IconButton(
            onPressed: () => _setRating(i),
            icon: const Icon(
              Icons.star_border,
              size: 16.0,
            ),
          ),
        );
      }
    }
    return rating;
  }

  void _handleTestimonial() {
    final locale = AppLocalizations.of(context)!;
    if (!_formKey.currentState!.validate()) return;
    Testimonials _userTestimonial = Testimonials(
      rating: _rating,
      text: _testimonialController.text,
      app: 'recargas',
    );
    showMessage(context, locale.read('loading'), TypeMessage.LOADING);
    APIRecargas.common().createTestimonials(_userTestimonial).then((value) {
      context.read<TestimonialsProvider>().fetchTestimonials();
      Navigator.of(context).pop();
      showMessage(
          context, locale.read('success_testimonial'), TypeMessage.INFO);
    }).catchError(
      (e) => HandleError.logError(context, e),
    );
  }
}
