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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          //extendBodyBehindAppBar: true,

          elevation: 0.0,

          leading: Icon(Icons.arrow_back),
        ),
        body: DecoratedBox(
            // BoxDecoration takes the image
            decoration: BoxDecoration(
              // Image set to background of the body
              image: DecorationImage(
                  image: AssetImage("assets/images/b.jpg"), fit: BoxFit.cover),
            ),
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Container(),
              Positioned(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  height: 440,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40, top: 5, right: 40),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Column(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                height: 80,
                                width: 300,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                     
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: myTertiaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Center(
                                    child:
                                        Text('Dive trip', style: headLineStyle1)),
                              ),
                            ),
                            SizedBox(
                              height: 36,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Details',
                                  style: headLineStyle1,
                                ),
                                Text(
                                  '',
                                  style: headLineStyle2,
                                ),
                              ],
                            ),
                            Divider(
                              height: 20,
                              color: Colors.grey.shade300,
                              thickness: 1,
                            ),
                            Row(
                              children: [
                                Icon(Icons.alarm,
                                    size: 20, color:myPrimaryColor),
                                    SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  '5:00 pm  , 8:00 pm: ',
                                  style: headLineStyle5,
                                ),
                                Text(
                                  '',
                                  style: headLineStyle2,
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Icon(
                                  Icons.calendar_today,
                                  size: 20,
                                  color: myPrimaryColor,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  '20/3/2023 ',
                                  style: headLineStyle5,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Number of bookings ',
                                  style: headLineStyle1,
                                ),
                                Text(
                                  '',
                                  style: headLineStyle2,
                                ),
                              ],
                            ),
                            Divider(
                              height: 20,
                              color: Colors.grey.shade300,
                              thickness: 1,
                            ),
                            Row(
                              children: [
                                Icon(Icons.person_3_rounded,
                                    color: myPrimaryColor, size: 20),
                                     SizedBox(
                                  width: 8,
                                ),
                                    
                                Text(
                                  '13',
                                  style: headLineStyle5,
                                ),
                                Text(
                                  '',
                                  style: headLineStyle2,
                                ),
                              ],
                            )
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ])));
  }
}
