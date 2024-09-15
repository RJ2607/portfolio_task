import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'view/projectView.dart';

class PortfolioView extends StatefulWidget {
  PortfolioView({super.key});

  @override
  State<PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView>
    with SingleTickerProviderStateMixin {
  late MyTab myTab;

  @override
  void initState() {
    super.initState();
    myTab = Get.put(MyTab());
    myTab.initController(
        this); // Initialize TabController with vsync from this state
  }

  @override
  void dispose() {
    myTab.onClose(); // Ensure controller is properly disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 40.h,
        child: FloatingActionButton.extended(
          elevation: 1,
          backgroundColor: Colors.red,
          onPressed: () {},
          label: Text('Filter'),
          icon: SvgPicture.asset(
            'assets/images/Filter.svg',
            color: Colors.white,
            height: 14.h,
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 2.h,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/images/ShoppingBag.svg',
              color: Colors.red,
              height: 20.0.h,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/images/Notification.svg',
              color: Colors.red,
              height: 20.0.h,
            ),
          ),
        ],
        bottom: TabBar(
          controller: myTab.controller,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.red,
          tabs: myTab.tabs,
        ),
        title: Text(
          'Portfolio',
          style: TextStyle(
            fontSize: 20.0.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TabBarView(
          controller: myTab.controller,
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

class MyTab extends GetxController {
  late TabController controller;

  final List<Tab> tabs = [
    Tab(text: 'Project'),
    Tab(text: 'Saved'),
    Tab(text: 'Shared'),
    Tab(text: 'Achievement'),
  ];

  void initController(TickerProvider vsync) {
    controller = TabController(length: tabs.length, vsync: vsync);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
