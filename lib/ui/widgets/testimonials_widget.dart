import 'package:detooo_recargas/models/auth/user_model.dart';
import 'package:detooo_recargas/models/recargas/testimonials_model.dart';
import 'package:detooo_recargas/services/providers/testimonials_provider.dart';
import 'package:detooo_recargas/services/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_ui.dart';

class TestimonialsWidget extends StatefulWidget {
  final double? height;
  const TestimonialsWidget({Key? key, this.height}) : super(key: key);

  @override
  State<TestimonialsWidget> createState() => _TestimonialsWidgetState();
}

class _TestimonialsWidgetState extends State<TestimonialsWidget> {
  List<String> _usersId = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Card(
        child: Stack(
          children: [
            FutureBuilder(
              future: context.watch<TestimonialsProvider>().testimonialsFuture,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Testimonials>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 4.0,
                    ),
                  );
                }
                if (snapshot.hasData) {
                  for (var item in snapshot.data!) {
                    _usersId.add("\"${item.user!}\"");
                  }
                  context.read<UsersProvider>().fetchUser(_usersId.toString());
                  return _buildList(snapshot.data!);
                }
                return Container();
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      color: Colors.redAccent,
                      onPressed: () {
                        print('nepte');
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      color: primaryColor,
                      onPressed: () {
                        print('nepte');
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<Testimonials> data) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildListItem(data[index], context);
      },
    );
  }

  Widget _buildListItem(Testimonials data, BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUser(data.user!, context),
              const Divider(),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                data.text!,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUser(String userId, BuildContext context) {
    // Profile? profile = context.read<UsersProvider>().getProfile(userId);
    return Row(
        // children: [Text(profile?.fullname ?? '')],
        );
  }
}
