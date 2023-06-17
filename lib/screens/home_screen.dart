import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jawla_app/components/button.dart';
import 'package:jawla_app/components/text_field.dart';
import 'package:jawla_app/constants/app_styles.dart';
import 'package:jawla_app/constants/constants.dart';

import '../components/activity_card.dart';
import '../components/trending_activity_card.dart';
import '../models/activity_model.dart';
import '../services/api/user/display_activity.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List allActivitiesData = [];
  List<Activity> activitiesList = [];
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Explore \nSaudi Arabia",
                  style: headLineStyle1,
                ),
                CustomButton(
                  text: "Add Activity",
                  onPressed: () {},
                  width: 100,
                  height: 35,
                )
              ],
            ),
            height16,
            // ------------------- Search text feild
            CustomTextFieldState().searchTextFeild(context, Icons.search,
                FontAwesomeIcons.sliders, "Search", searchController),
            height16,
            // ------------------- Trending Activities
            const Text("Trending Activities", style: headLineStyle2),
            height8,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FutureBuilder(
                  future: displayActivity(),
                  builder: (context, snapshot) {
                    try {
                      if (snapshot.hasData) {
                        var response = snapshot.data!;
                        if (response.statusCode == 200) {
                          allActivitiesData =
                              (json.decode(response.body))["data"];
                          activitiesList.clear();
                          for (var element in allActivitiesData) {
                            activitiesList.add(Activity.fromJson(element));
                          }
                          box.write("activitiesList", activitiesList);
                          return activitiesRow();
                        } else {
                          print(json.decode(response.body));
                        }
                      }
                      return activitiesRow();
                    } catch (error) {
                      return const SizedBox(
                          height: 220,
                          width: 200,
                          child: Center(child: CircularProgressIndicator()));
                    }
                  }),
            ),
            height16,
            // ------------------- Activities list
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Activities", style: headLineStyle2),
                // InkWell(
                //     onTap: () {},
                //     child: const Row(children: [
                //       Text(
                //         "Show more",
                //         style: headLineStyle5,
                //       ),
                //       Icon(
                //         Icons.arrow_forward_ios_rounded,
                //         size: 10,
                //         color: greyTextColor,
                //       )
                //     ])),
              ],
            ),
            height8,
            FutureBuilder(
                future: displayActivity(),
                builder: (context, snapshot) {
                  try {
                    if (snapshot.hasData) {
                      var response = snapshot.data!;
                      if (response.statusCode == 200) {
                        allActivitiesData =
                            (json.decode(response.body))["data"];
                        activitiesList.clear();
                        for (var element in allActivitiesData) {
                          activitiesList.add(Activity.fromJson(element));
                        }

                        box.write("activitiesList", activitiesList);
                        return activitiesColumn();
                      } else {
                        print(json.decode(response.body));
                      }
                    }
                    return activitiesColumn();
                  } catch (error) {
                    return const SizedBox(
                        height: 220,
                        width: 200,
                        child: Center(child: CircularProgressIndicator()));
                  }
                }),
          ],
        ),
      ),
    );
  }

  Widget activitiesRow() {
    if (box.hasData("activitiesList")) {
      activitiesList = box.read("activitiesList");
    }
    return Row(
        children: activitiesList
            .map((element) => TrendingActivityCard(
                  activity: element,
                ))
            .toList());
  }

  Widget activitiesColumn() {
    if (box.hasData("activitiesList")) {
      activitiesList = box.read("activitiesList");
    }
    return Column(
        children: activitiesList
            .map((element) => ActivityCard(
                  activity: element,
                ))
            .toList());
  }
}
