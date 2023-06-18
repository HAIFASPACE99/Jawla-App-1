import 'package:flutter/material.dart';

import 'app_styles.dart';
import 'constant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Icon(Icons.edit),
            SizedBox(
              width: 20,
            )
          ],
          leading: Icon(Icons.arrow_back),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        backgroundColor: myPrimaryColor,
        body: Stack(alignment: Alignment.bottomCenter, children: [
          Container(),
          Positioned(
            //<-- SEE HERE

            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              height: 700,
              child: Padding(
                padding: const EdgeInsets.only(left: 40, top: 20, right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    
                    Row(children: [Text(
                      'Name : ',
                      style: headLineStyle1,
                    ),Text(
                      'Haifa',
                      style: headLineStyle2,
                    ),



                    ],),
                    Divider(
                      height: 80,
                      color: Colors.grey.shade300,
                      thickness: 1,
                    ),
                    Row(children: [Text(
                      'Email : ',
                      style: headLineStyle1,
                    ),Text(
                      'haifa@gmail.com',
                      style: headLineStyle2,
                    ),



                    ],),
                    Divider(
                      height: 80,
                      color: Colors.grey.shade300,
                      thickness: 1,
                    ),
                  Row(children: [Text(
                      'Phone : ',
                      style: headLineStyle1,
                    ),Text(
                      '098765456',
                      style: headLineStyle2,
                    ),



                    ],),
                    Divider(
                      height: 80,
                      color: Colors.grey.shade300,
                      thickness: 1,
                    ),
                   Row(children: [Text(
                      'Ctiy : ',
                      style: headLineStyle1,
                    ),Text(
                      'Makkah',
                      style: headLineStyle2,
                    ),



                    ],),
                    Divider(
                      height: 80,
                      color: Colors.grey.shade300,
                      thickness: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),

//profile image
          const Positioned(
            top: 8,
            bottom: 600,
            child: CircleAvatar(
             // backgroundColor: Colors.black,
              radius: 70,
              child: CircleAvatar(
                radius: 90,
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
              ),
            ),
          ),
        ]));
  }
}
