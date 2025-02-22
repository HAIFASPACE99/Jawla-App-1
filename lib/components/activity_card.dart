import 'package:flutter/material.dart';
import 'package:jawla_app/models/activity_model.dart';
import '../constants/app_styles.dart';
import '../constants/constants.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    super.key,
    required this.activity,
  });

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: AppLayout.getSize(context).width,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 11,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Thumbnail
              SizedBox(
                height: 64,
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Image.asset("assets/images/thumbnails/diving.png",
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 10),

              // Activity Info
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(activity.activityName ?? "", style: headLineStyle3),
                      width8,
                      const Icon(Icons.location_on_sharp,
                          color: primaryColor, size: 12),
                      const SizedBox(width: 2),
                      Text(activity.activityCity ?? "", style: headLineStyle5),
                    ],
                  ),
                  Text(
                    activity.activityPrice != "FREE"
                        ? '${activity.activityPrice} SR'
                        : "FREE",
                    style: headLineStyle5.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          // const FavoriteButton(iconSize: 20),
        ],
      ),
    );
  }
}
