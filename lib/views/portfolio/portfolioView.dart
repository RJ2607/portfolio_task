import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_task/views/portfolio/view/projectview.dart';

class PortfolioView extends StatelessWidget {
  PortfolioView({super.key});

  TabController? controller;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/ShoppingBag.svg',
                color: Colors.red,
                height: 20.0.r,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/Notification.svg',
                color: Colors.red,
                height: 20.0.r,
              ),
            ),
          ],
          bottom: TabBar(
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.red,
            tabs: [
              Tab(
                text: 'Project',
              ),
              Tab(
                text: 'Saved',
              ),
              Tab(
                text: 'Shared',
              ),
              Tab(
                text: 'Achievement',
              ),
            ],
          ),
          title: Text(
            'Portfolio',
            style: TextStyle(
              fontSize: 20.0.r,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ProjectView(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
