import 'package:detooo_recargas/app/app_localizations.dart';
import 'package:detooo_recargas/models/auth/user_model.dart';
import 'package:detooo_recargas/models/recargas/testimonials_model.dart';
import 'package:detooo_recargas/services/providers/profile_provider.dart';
import 'package:detooo_recargas/services/providers/testimonials_provider.dart';
import 'package:detooo_recargas/services/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_ui.dart';

class TestimonialsWidget extends StatefulWidget {
  final double? height;
  final VoidCallback? handleClose;
  final bool vertical;

  const TestimonialsWidget({
    Key? key,
    this.height,
    this.handleClose,
    this.vertical = false,
  }) : super(key: key);

  @override
  State<TestimonialsWidget> createState() => _TestimonialsWidgetState();
}

class _TestimonialsWidgetState extends State<TestimonialsWidget> {
  // ignore: prefer_final_fields
  List<String?> _usersId = [];

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      child: SizedBox(
        height: !widget.vertical ? widget.height ?? 200.0 : null,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                locale.read('tab_testimony'),
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Stack(
              children: [
                FutureBuilder(
                  future: Future.delayed(
                      const Duration(milliseconds: 500),
                      () => context
                          .read<TestimonialsProvider>()
                          .testimonialsFuture),
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
                      if (context.read<UsersProvider>().getUsers.isEmpty) {
                        for (var item in snapshot.data!) {
                          _usersId.add("\"${item.user!}\"");
                        }
                        Future.delayed(const Duration(milliseconds: 100), () {
                          context
                              .read<UsersProvider>()
                              .fetchUser(_usersId.toString());
                        });
                      }
                      return _buildList(snapshot.data!);
                    }
                    return Container();
                  },
                ),
                if (widget.handleClose != null)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            color: Colors.redAccent,
                            onPressed: widget.handleClose,
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                    ],
                  ),
                if (widget.handleClose != null)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            color: primaryColor,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    showTestimonialsDialog(context),
                              );
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
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
      scrollDirection: widget.vertical ? Axis.vertical : Axis.horizontal,
      itemCount: data.length,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (BuildContext context, int index) {
        if (data[index].isVisible!) {
          return _buildListItem(data[index], context);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildListItem(Testimonials data, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 8.0,
      ),
      child: SizedBox(
        width: 300,
        child: Card(
          // color: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: ScreenHelper.screenWidth(context),
                  child: Column(
                    children: [
                      _buildUser(data.user!, context, data.rating!),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Text(
                  data.text!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: _buildRating(data.rating!),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUser(String userId, BuildContext context, int rating) {
    final locale = AppLocalizations.of(context)!;
    List<Profile?> _profiles = context.watch<UsersProvider>().getUsers;
    Profile? _profile = context.watch<ProfileProvider>().profile;
    Profile? _user;
    for (var profile in _profiles) {
      if (profile!.id == userId) {
        _user = profile;
      }
    }
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 4,
          child: Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    maxRadius: 15.0,
                    backgroundColor: Colors.transparent,
                    backgroundImage: (_user?.avatar != null)
                        ? NetworkImage(_user!.avatar!, scale: 20.0)
                        : null,
                  ),
                ),
                Text(
                  (_profile?.id != _user?.id)
                      ? _user?.fullname ?? ''
                      : locale.read('me'),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('$rating'),
              const Icon(
                Icons.star,
                color: Color(0xFFD4AF37),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ignore: unused_element
  List<Widget> _buildRating(int cant) {
    List<Widget> rating = [];
    for (var i = 1; i <= 5; ++i) {
      if (cant >= i) {
        rating.add(const Icon(
          Icons.star,
          size: 20.0,
          color: Color(0xFFD4AF37),
        ));
      } else {
        rating.add(const Icon(
          Icons.star_border,
          size: 16.0,
        ));
      }
    }
    return rating;
  }
}
