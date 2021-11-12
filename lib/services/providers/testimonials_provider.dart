import 'package:flutter/material.dart';

import 'package:detooo_recargas/models/recargas/testimonials_model.dart';
import 'package:detooo_recargas/services/network/api_recargas.dart';

import '../shared_preference.dart';

class TestimonialsProvider extends ChangeNotifier {
  List<Testimonials>? _testimonials;

  List<Testimonials>? get testimonials => _testimonials;

  Future<List<Testimonials>> get testimonialsFuture async {
    if (_testimonials == null && SharedPreference.testimonials != null) {
      fetchTestimonials();
    } else if (SharedPreference.testimonials == null) {
      await fetchTestimonials();
    }

    return _testimonials!;
  }

  void setTestimonials(List<Testimonials> testimonials) {
    _testimonials = testimonials;
    SharedPreference.setTestimonials(testimonials);

    notifyListeners();
  }

  void setTestimonial(Testimonials testimonial) {
    _testimonials!.add(testimonial);
    notifyListeners();
  }

  Future<void> fetchTestimonials() async {
    List<Testimonials>? _testimonialsDb = SharedPreference.testimonials;
    if (_testimonialsDb != null) {
      setTestimonials(_testimonialsDb);
    }
    await APIRecargas.common().fetchTestimonials().then((value) {
      setTestimonials(value);
    });
  }
}
