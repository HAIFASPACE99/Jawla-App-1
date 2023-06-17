import 'package:flutter/material.dart';

import '../constants/app_styles.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Center(
            child: Text(
              "Favorite",
              style: headLineStyle1,
            ),
          ),
        ),
        leadingWidth: 100,
      ),
      body: SafeArea(
        child: Center(
          child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                Container(
                  color: Colors.grey[300],
                  height: 100,
                  width: 100,
                ),
                Container(
                  color: Colors.grey[300],
                  height: 100,
                  width: 100,
                ),
                Container(
                  color: Colors.grey[300],
                  height: 100,
                  width: 100,
                ),
                Container(
                  color: Colors.grey[300],
                  height: 100,
                  width: 100,
                )
              ]),
        ),
      ),
    );
  }
}
