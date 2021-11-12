import 'package:flutter/material.dart';

import 'package:detooo_recargas/models/recargas/testimonials_model.dart';
import 'package:detooo_recargas/services/network/api_recargas.dart';

class TestimonialsProvider extends ChangeNotifier {
  List<Testimonials>? _testimonials;

  List<Testimonials>? get testimonials {
    if (_testimonials == null) {
      fetchTestimonials();
    }

    return _testimonials;
  }

  Future<List<Testimonials>> get testimonialsFuture async {
    if (_testimonials == null) {
      await fetchTestimonials();
    }

    return _testimonials!;
  }

  void setTestimonials(List<Testimonials> testimonials) {
    _testimonials = testimonials;
    notifyListeners();
  }

  void setTestimonial(Testimonials testimonial) {
    _testimonials!.add(testimonial);
    notifyListeners();
  }

  Future<void> fetchTestimonials() async {
    await APIRecargas.common().fetchTestimonials().then((value) {
      if (_testimonials == null) setTestimonials(value);
    });
  }
}
