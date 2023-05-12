import 'package:finance_mobile_app/views/TransferScreen.view.dart';
import 'package:flutter/material.dart';

import '../theme/Colors.dart';

class ContactList extends StatefulWidget {
  final String title;

  const ContactList({Key? key, required this.title}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
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
          title: Text(widget.title, style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w500),),
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text("Select Contact", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),),
                ),
                ContactCard(name: "Tanish Pradhan", account: "1224 4883 2998 3802", title: widget.title,),
                ContactCard(name: "Harshit Mathur", account: "3892 3899 3329 3838", title: widget.title,),
                ContactCard(name: "Aman Porwal", account: "3789 8302 3892 2993", title: widget.title,),
                ContactCard(name: "Ayush Sharma", account: "3880 9302 4885 9387", title: widget.title,),
                ContactCard(name: "Harshit Karma", account: "4920 8729 3981 7488", title: widget.title,),
                ContactCard(name: "Hardik Sharma", account: "3883 2889 8900 2222", title: widget.title,),
                ContactCard(name: "Tanish Pradhan", account: "1111 2222 3333 4444", title: widget.title,),
              ],
            ),
          ),
        )
      ),
    );
  }
}


class ContactCard extends StatelessWidget {
  final String title;
  final String name;
  final String account;
  final bool? disableOnPressed;

  const ContactCard({Key? key, required this.name, required this.account, required this.title, this.disableOnPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: InkWell(
        onTap: () {
          disableOnPressed == true ? null : Navigator.push(context, MaterialPageRoute(builder: (_) => TransferScreen(contactCardName: name, contactCardAccount: account, title: title,)));
        },
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1.0, color: Colors.black26),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 14.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.white,
                  child: Image.asset("assets/man.png"),
                ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),),
                    const SizedBox(height: 2.0),
                    Text("Bank - $account", style: const TextStyle(fontSize: 12.0, color: Colors.black54),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
