import 'dart:io';

import 'package:detooo_recargas/services/network/dio_instances.dart';
import 'package:detooo_recargas/services/providers/profile_provider.dart';
import 'package:detooo_recargas/ui/app_ui.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AvatarTab extends StatefulWidget {
  final bool canChange;
  const AvatarTab({Key? key, this.canChange = true}) : super(key: key);

  @override
  _AvatarTabState createState() => _AvatarTabState();
}

class _AvatarTabState extends State<AvatarTab> {
  @override
  Widget build(BuildContext context) {
    return _buildAvatar(context);
  }

  Widget _buildAvatar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: widget.canChange ? _handleAvatar : null,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        maxRadius: ScreenHelper.isPortrait(context)
                            ? ScreenHelper.screenHeight(context) * .1
                            : ScreenHelper.screenWidth(context) * .1,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                            context.watch<ProfileProvider>().profile!.avatar!),
                      ),
                      if (widget.canChange)
                        SizedBox(
                          width: ScreenHelper.isPortrait(context)
                              ? ScreenHelper.screenHeight(context) * .2
                              : ScreenHelper.screenWidth(context) * .2,
                          height: ScreenHelper.isPortrait(context)
                              ? ScreenHelper.screenHeight(context) * .2
                              : ScreenHelper.screenWidth(context) * .2,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.camera_alt_rounded,
                                    color: primaryColor,
                                    size: ScreenHelper.isPortrait(context)
                                        ? ScreenHelper.screenHeight(context) *
                                            .05
                                        : ScreenHelper.screenWidth(context) *
                                            .05,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Text(context.watch<ProfileProvider>().profile?.fullname ?? ''),
          Text(context.watch<ProfileProvider>().profile?.email ?? ''),
        ],
      ),
    );
  }

  void _handleAvatar() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await showDialog(
      context: context,
      builder: (ctx) => dialogProfileImage(
        context,
        selectFromGallery: () async {
          Navigator.of(ctx).pop(
            await _picker.pickImage(
              source: ImageSource.gallery,
              maxWidth: 720.0,
            ),
          );
        },
        selectFromCamera: () async {
          Navigator.of(ctx).pop(
            await _picker.pickImage(
              source: ImageSource.camera,
              maxWidth: 720.0,
            ),
          );
        },
      ),
    );

    if (image != null) {
      final _data = FormData();

      _data.files.add(
        MapEntry(
          'avatar',
          MultipartFile.fromFileSync(
            image.path,
            filename: image.path.split(Platform.pathSeparator).last,
          ),
        ),
      );

      dioCommon().patch(
        'https://api.v2.users.detooo.com/profile/update_avatar',
        options: Options(headers: {'Accept': 'multipart/form-data'}),
        data: _data,
      );
    }
  }
}
