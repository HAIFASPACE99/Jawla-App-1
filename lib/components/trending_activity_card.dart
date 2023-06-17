import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:jawla_app/models/activity_model.dart';
import '../constants/app_styles.dart';
import '../constants/constants.dart';
import 'favorite_button.dart';

class TrendingActivityCard extends StatelessWidget {
  const TrendingActivityCard({
    super.key,
    required this.activity,
  });

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 164,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              // Thumbnail Widget
              SizedBox(
                height: 135,
                width: 144,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Image.asset("assets/images/thumbnails/diving.png",
                      fit: BoxFit.cover),
                ),
              ),

              // Price Widget
              Positioned(
                right: 10,
                bottom: 10,
                child: BlurryContainer(
                  blur: 12,
                  height: 24,
                  width: 51,
                  elevation: 0,
                  color: Colors.white30,
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Center(
                    child: Text(
                      activity.activityPrice != "FREE"
                          ? '${activity.activityPrice} SR'
                          : "FREE",
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          height8,

          // Activity Details
          Column(
            children: [
              SizedBox(
                  width: 140,
                  child:
                      Text(activity.activityName ?? "", style: headLineStyle3)),
              height4,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on_sharp,
                          color: primaryColor, size: 11),
                      width4,
                      Text(activity.activityCity ?? "", style: headLineStyle5),
                    ],
                  ),
                  FavoriteButton(
                    iconSize: 18,
                    activity: activity,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
