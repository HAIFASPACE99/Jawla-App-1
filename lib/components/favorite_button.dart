import 'package:flutter/material.dart';
import 'package:jawla_app/models/activity_model.dart';
import 'package:jawla_app/services/api/user/favorite_response.dart';
import 'package:like_button/like_button.dart';

import '../constants/app_styles.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton(
      {super.key, required this.iconSize, required this.activity});

  final double iconSize;
  final Activity activity;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: const Color(0xFFF5F5F5),
      child: LikeButton(
        onTap: onLikeButtonTapped,
        size: 15,
        circleColor:
            const CircleColor(start: primaryColor, end: secondaryColor),
        bubblesColor: const BubblesColor(
          dotPrimaryColor: primaryColor,
          dotSecondaryColor: secondaryColor,
        ),
        likeBuilder: (bool isLiked) {
          return Icon(
            Icons.favorite,
            color: isLiked ? primaryColor : const Color(0xFFCECECE),
            size: widget.iconSize,
          );
        },
      ),
    );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    final response = await favoriteResponse(widget.activity.activityId ?? 1);
    print(response.body);
    response.statusCode == 200 ? !isLiked : isLiked;
    return !isLiked;
  }
}
