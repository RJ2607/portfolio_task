import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_task/views/homeView.dart';
import 'package:portfolio_task/views/inputView.dart';
import 'package:portfolio_task/views/portfolio/portfolioView.dart';
import 'package:portfolio_task/views/profileView.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedindex = 0;
  late PageController _pagecontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pagecontroller = PageController(initialPage: _selectedindex);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pagecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20.0.r,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        currentIndex: _selectedindex,
        onTap: (index) {
          setState(() {
            _selectedindex = index;
            _pagecontroller.jumpToPage(index);
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/Home.svg',
              color: _selectedindex == 0 ? Colors.red : Colors.grey,
              height: 18.0.r,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/Portfolia.svg',
              color: _selectedindex == 1 ? Colors.red : Colors.grey,
              height: 18.0.r,
            ),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/Input.svg',
              color: _selectedindex == 2 ? Colors.red : Colors.grey,
              height: 18.0.r,
            ),
            label: 'Input',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/Profile.svg',
              color: _selectedindex == 3 ? Colors.red : Colors.grey,
              height: 18.0.r,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: PageView(
        controller: _pagecontroller,
        children: <Widget>[
          HomeView(),
          PortfolioView(),
          InputView(),
          ProfileView(),
        ],
      ),
    );
  }
}
