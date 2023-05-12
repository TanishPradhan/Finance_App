import 'package:finance_mobile_app/theme/Colors.dart';
import 'package:finance_mobile_app/views/HomePage.view.dart';
import 'package:finance_mobile_app/views/TransferScreen.view.dart';
import 'package:finance_mobile_app/widgets/QRScanner.widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unicons/unicons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String qrCode = "";
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages.elementAt(_selectedIndex),
        floatingActionButton: InkWell(
          onTap: () async {
            var scanRes = (await Navigator.push(context,
                MaterialPageRoute(builder: (context) => const QRScanner())));
            if (scanRes == null) {
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Unable to scan QR code"),
                ),
              );
              return;
            }
            qrCode = scanRes as String;
            Navigator.push(context, MaterialPageRoute(builder: (_) => TransferScreen(contactCardName: "Tanish Pradhan", contactCardAccount: "1234 1234 1234 1234", title: "Send Money")));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: primaryColor,
            ),
            padding: const EdgeInsets.all(15.0),
            child: const Icon(UniconsLine.qrcode_scan, color: Colors.white),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          notchMargin: 5,
          elevation: 50,
          shape: const CircularNotchedRectangle(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    _selectedIndex == 2 ? UniconsLine.home_alt : UniconsLine.home_alt,
                    color: _selectedIndex == 0 ? primaryColor : Colors.black54,
                  ),
                  onPressed: () {
                    _onItemTapped(0);
                  },
                ),
                IconButton(
                  icon: Icon(
                    _selectedIndex == 2 ? UniconsLine.wallet : UniconsLine.wallet,
                    color: _selectedIndex == 1 ? primaryColor : Colors.black54,
                  ),
                  onPressed: () {
                    _onItemTapped(1);
                  },
                ),
                const SizedBox(),
                IconButton(
                  icon: Icon(
                    _selectedIndex == 2 ? UniconsLine.chart : UniconsLine.chart,
                    color: _selectedIndex == 2 ? primaryColor : Colors.black54,
                  ),
                  onPressed: () {
                    _onItemTapped(2);
                  },
                ),
                IconButton(
                  icon: Icon(
                    _selectedIndex == 2 ? UniconsLine.user : UniconsLine.user,
                    color: _selectedIndex == 3 ? primaryColor : Colors.black54,
                  ),
                  onPressed: () {
                    _onItemTapped(3);
                  },
                ),
                // BottomNavigationBarItem(
                //   icon: const FaIcon(FontAwesomeIcons.house,
                //     color: Colors.black54,),
                //   activeIcon: FaIcon(
                //     FontAwesomeIcons.house,
                //     color: primaryColor,
                //   ),
                //   label: "",
                // ),
                // BottomNavigationBarItem(
                //   icon: const FaIcon(FontAwesomeIcons.wallet,
                //     color: Colors.black54,),
                //   activeIcon: FaIcon(
                //     FontAwesomeIcons.house,
                //     color: primaryColor,
                //   ),
                //   label: "",
                // ),
                // BottomNavigationBarItem(
                //   icon: const FaIcon(FontAwesomeIcons.poll,
                //     color: Colors.black54,),
                //   activeIcon: FaIcon(
                //     FontAwesomeIcons.house,
                //     color: primaryColor,
                //   ),
                //   label: "",
                // ),
                // BottomNavigationBarItem(
                //   icon: const FaIcon(FontAwesomeIcons.user,
                //     color: Colors.black54,),
                //   activeIcon: FaIcon(
                //     FontAwesomeIcons.house,
                //     color: primaryColor,
                //   ),
                //   label: "",
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
