// import 'dart:developer';

// import 'package:detooo_recargas/services/network/dio_instances.dart';
// import 'package:detooo_recargas/utils/log_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';

// class StripeCard extends StatefulWidget {
//   const StripeCard({Key? key}) : super(key: key);

//   @override
//   _StripeCardState createState() => _StripeCardState();
// }

// class _StripeCardState extends State<StripeCard> {
//   CardFieldInputDetails? _card;
//   String _email = 'email@stripe.com';
//   bool? _saveCard = false;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         CardField(
//           autofocus: true,
//           onCardChanged: (card) {
//             setState(() {
//               _card = card;
//             });
//           },
//         ),
//         const SizedBox(height: 20),
//         CheckboxListTile(
//           value: _saveCard,
//           onChanged: (value) {
//             setState(() {
//               _saveCard = value;
//             });
//           },
//           title: const Text('Save card during payment'),
//         ),
//         LoadingButton(
//           onPressed:
//               _card?.complete == true ? () => _handlePayPress(context) : null,
//           text: 'Pay',
//         ),
//         const SizedBox(height: 20),
//         if (_card != null) Text(_card!.toJson().toString()),
//       ],
//     );
//   }

// }

// class LoadingButton extends StatefulWidget {
//   final Future Function()? onPressed;
//   final String text;

//   const LoadingButton({Key? key, required this.onPressed, required this.text})
//       : super(key: key);

//   @override
//   _LoadingButtonState createState() => _LoadingButtonState();
// }

// class _LoadingButtonState extends State<LoadingButton> {
//   bool _isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         Expanded(
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               padding: const EdgeInsets.symmetric(vertical: 12),
//             ),
//             onPressed:
//                 (_isLoading || widget.onPressed == null) ? null : _loadFuture,
//             child: _isLoading
//                 ? const SizedBox(
//                     height: 22,
//                     width: 22,
//                     child: CircularProgressIndicator(strokeWidth: 2),
//                   )
//                 : Text(widget.text),
//           ),
//         ),
//       ],
//     );
//   }

//   Future<void> _loadFuture() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       await widget.onPressed!();
//     } catch (e, s) {
//       log(e.toString(), error: e, stackTrace: s);
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Error $e')));
//       rethrow;
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
// }
