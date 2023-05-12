import 'package:finance_mobile_app/theme/Colors.dart';
import 'package:finance_mobile_app/views/ContactList.view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unicons/unicons.dart';
import 'dart:math' as math;

import '../widgets/QRScanner.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String qrCode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020007),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.3,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20.0,
                          backgroundColor: const Color(0xFF020007),
                          child: Image.asset("assets/man.png"),
                        ),
                        const SizedBox(width: 12.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Good Morning!",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 6.0),
                            Text(
                              "Tanish Pradhan",
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white12,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(Icons.notifications_none,
                          color: Colors.white),
                    )
                  ],
                ),
                // const SizedBox(height: 20.0),
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 4.2,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Your Balance",
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "₹25,552.92",
                                style: TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "VISA",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "**** **** **** 6828",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -140,
                      right: -130,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(math.pi),
                        child: Transform.rotate(
                          angle: 30.1,
                          child: const Icon(
                            Icons.fingerprint,
                            size: 300,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(height: 25.0),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ContactList(
                                        title: "Send Money",
                                      )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 6.0),
                          child: Row(
                            children: [
                              Transform.rotate(
                                angle: 180 * math.pi / 80,
                                child: Icon(
                                  UniconsSolid.arrow_circle_up,
                                  size: 45.0,
                                  color: primaryColor,
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              const Text(
                                "Send",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ContactList(
                                        title: "Request Money",
                                      )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 6.0),
                          child: Row(
                            children: [
                              Transform.rotate(
                                angle: 180 * math.pi / 80,
                                child: Icon(UniconsSolid.arrow_circle_down,
                                    size: 45.0, color: primaryColor),
                              ),
                              const SizedBox(width: 8.0),
                              const Text(
                                "Request",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          // const SizedBox(height: 25.0),
          Container(
            height: MediaQuery.of(context).size.height / 2.22,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0)),
            ),
            padding: const EdgeInsets.only(top: 18.0, right: 18.0, left: 18.0),
            child: Center(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    // const SizedBox(height: 6.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "All Activity",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20.0),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                              color: primaryColor, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    const ActivityRecord(
                        icon: FontAwesomeIcons.youtube,
                        title: "Youtube Premium",
                        timeDate: "08:10pm - Mar 10, 2023",
                        price: 129),
                    const ActivityRecord(
                        icon: FontAwesomeIcons.github,
                        title: "Github Pro",
                        timeDate: "02:20pm - Mar 10, 2023",
                        price: 327.36),
                    const ActivityRecord(
                        icon: FontAwesomeIcons.discord,
                        title: "Discord Nitro",
                        timeDate: "12:10pm - Mar 10, 2023",
                        price: 817.59),
                    const ActivityRecord(
                        icon: FontAwesomeIcons.apple,
                        title: "Apple Music",
                        timeDate: "10:30am - Mar 10, 2023",
                        price: 120.51),
                    const ActivityRecord(
                        icon: FontAwesomeIcons.apple,
                        title: "Apple iCloud+",
                        timeDate: "06:10am - Mar 10, 2023",
                        price: 75.0),
                    // const ActivityRecord(
                    //     icon: FontAwesomeIcons.moneyBill,
                    //     title: "Withdraw",
                    //     timeDate: "06:10am - Aug 12, 2023",
                    //     price: 100.0),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ActivityRecord extends StatelessWidget {
  final IconData icon;
  final String title;
  final String timeDate;
  final double price;

  const ActivityRecord(
      {Key? key,
      required this.icon,
      required this.title,
      required this.timeDate,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 14.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.black.withAlpha(12),
                ),
                padding: const EdgeInsets.all(11.0),
                child: Icon(
                  icon,
                  size: 25,
                ),
              ),
              const SizedBox(width: 10.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    timeDate,
                    style: const TextStyle(
                        color: Colors.black38,
                        fontSize: 11.0,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("+₹${price.toStringAsFixed(2)}",
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.green)),
            const Text("Subcription",
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500)),
          ],
        )
      ],
    );
  }
}
