import 'package:flutter/material.dart';
import 'package:hiremi/model/user_model.dart';
import 'package:hiremi/providers/bottomnav_provider.dart';
import 'package:hiremi/screens/alerts.dart';
import 'package:hiremi/screens/dashboard.dart';
import 'package:hiremi/screens/profile.dart';
import 'package:hiremi/screens/search.dart';
import 'package:hiremi/widgets/bottomsheet.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PageScreen extends StatefulWidget {
  User user;
  PageScreen({super.key, required this.user});

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  late PageController _controller;
  int initialPage = 0;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
    // _controller.initialPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [const DashboardScreen(),SearchScreen(),AlertsScreen(), ProfileScreen(user: widget.user)],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 75,
        height: 75,
        child: FloatingActionButton(
          onPressed: () {},
          splashColor: Colors.white,
          shape: const CircleBorder(
              side: BorderSide(color: Colors.white, style: BorderStyle.solid)),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: const Wrap(
              alignment: WrapAlignment.center,
              children: [
                Icon(
                  Icons.workspaces_rounded,
                  color: Colors.red,
                ),
                Text(
                  'HIREMI',
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: initialPage,
        onItemTapped: (p0) {
          _controller.jumpToPage(p0);
          Provider.of<NavProvider>(context, listen: false).onItemTapped(p0);
        },
      ),
    );
  }
}
