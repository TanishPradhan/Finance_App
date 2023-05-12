import 'package:finance_mobile_app/views/ContactList.view.dart';
import 'package:flutter/material.dart';

import '../theme/Colors.dart';

class TransferScreen extends StatefulWidget {
  final String title;
  final String contactCardName;
  final String contactCardAccount;

  const TransferScreen({Key? key, required this.contactCardName, required this.contactCardAccount, required this.title}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  int amount = 0;
  double spacing = 20.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF020007),
        appBar: AppBar(
          toolbarHeight: 70,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.white,),
          ),
          title: Text(widget.title, style: const TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w500),),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(25.0), topLeft: Radius.circular(25.0)),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContactCard(name: widget.contactCardName, account: widget.contactCardAccount, title: widget.title, disableOnPressed: true,),
                  const SizedBox(height: 10.0),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("Available Money: ₹25,552.92", style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black54),),
                  ),
                ],
              ),
              // SizedBox(height: spacing),
              // SizedBox(height: spacing/2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("₹", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 27, fontWeight: FontWeight.w500, color: Colors.black54),),
                  const SizedBox(width: 4.0),
                  Text(amount.toString(), style: TextStyle(fontSize: MediaQuery.of(context).size.height / 16, fontWeight: FontWeight.w600),),
                ],
              ),
              // SizedBox(height: spacing),
              // SizedBox(height: spacing/2),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    amountCard(1),
                    amountCard(10),
                    amountCard(100),
                    amountCard(500),
                    amountCard(1000),
                    amountCard(2000),
                    amountCard(5000),
                  ],
                ),
              ),
              // SizedBox(height: spacing/1.4),
              Column(
                children: [
                  Row(
                    children: [
                      numberCard(number: "1", value: 1),
                      numberCard(number: "2", value: 2),
                      numberCard(number: "3", value: 3),
                    ],
                  ),
                  Row(
                    children: [
                      numberCard(number: "4", value: 4),
                      numberCard(number: "5", value: 5),
                      numberCard(number: "6", value: 6),
                    ],
                  ),
                  Row(
                    children: [
                      numberCard(number: "7", value: 7),
                      numberCard(number: "8", value: 8),
                      numberCard(number: "9", value: 9),
                    ],
                  ),
                  Row(
                    children: [
                      numberCard(number: "0", value: 0),
                      numberCard(number: "00", value: 0),
                      numberCard(icon: Icons.backspace_outlined),
                    ],
                  ),
                ],
              ),
              // SizedBox(height: spacing),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: primaryColor,
                ),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: const Center(child: Text("Transfer", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget amountCard(int cardAmount) {
    return GestureDetector(
      onTap: () {
        setState(() {
          amount = amount + cardAmount;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          height: 30.0,
          width: 70.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(width: 1.5, color: Colors.black38),
          ),
          child: Center(child: Text("₹${cardAmount.toString()}", style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),)),
        ),
      ),
    );
  }

  Widget numberCard({String? number, int? value, IconData? icon}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 4.0, left: 4.0, top: 8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            // border: Border.all(width: 1.0, color: Colors.black38),
            color: Colors.black.withAlpha(8),
          ),
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height / 55),
          child: Center(
            child: number != null
                ? Text(number, style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500))
                : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Icon(icon, size: 30.0,),
                ),
          ),
        ),
      ),
    );
  }
}