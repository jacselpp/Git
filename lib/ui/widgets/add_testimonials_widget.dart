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
  int _rating = 3;
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            locale.read('rating'),
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildRating(),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Divider(),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            locale.read('add_new_testimony'),
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              labelText: locale.read('write_an_testimonial'),
              border: const OutlineInputBorder(),
              helperText: (_length > 0) ? '$_length > 20' : '',
              alignLabelWithHint: true,
            ),
            controller: _testimonialController,
            validator: (value) {
              if (value!.trim().isEmpty || value.length < 20) {
                return locale.read('testimonial_too_short');
              }
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: CustomTextButton(
                  color: primaryColor,
                  label: locale.read('send_testimonial'),
                  onPressed: _handleTestimonial,
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
              // color: Color(0xFFD4AF37),
              color: primaryColor,
            ),
          ),
        );
      } else {
        rating.add(
          IconButton(
            onPressed: () => _setRating(i),
            icon: const Icon(
              Icons.star_border,
              size: 24.0,
              color: primaryColor75,
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
      // Navigator.of(context).pop();
      showMessage(
        context,
        locale.read('success_testimonial'),
        TypeMessage.INFO,
      );
      _testimonialController.value = TextEditingValue.empty;
      // _rating = 3;
    }).catchError(
      (e) => HandleError.logError(context, e),
    );
  }
}
