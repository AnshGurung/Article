import 'package:article_hub/core/presentation/theme/colours.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        'https://image.lexica.art/full_jpg/7515495b-982d-44d2-9931-5a8bbbf27532';
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundImage: imageProvider,
                radius: 45,
              ),
              placeholder: (context, url) => CircleAvatar(
                backgroundColor: grey300,
                radius: 45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
