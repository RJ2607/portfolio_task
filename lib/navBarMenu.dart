import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:portfolio_task/views/homeView.dart';
import 'package:portfolio_task/views/inputView.dart';
import 'package:portfolio_task/views/portfolio/portfolioView.dart';
import 'package:portfolio_task/views/profileView.dart';

class BottomNavBarController extends GetxController {
  var selectedIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: selectedIndex.value);
  }

  void onPageChanged(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

class BottomNavBar extends StatelessWidget {
  final BottomNavBarController controller = Get.put(BottomNavBarController());

  BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            elevation: 20.0.h,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.red,
            currentIndex: controller.selectedIndex.value,
            onTap: controller.onPageChanged,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/Home.svg',
                  color: controller.selectedIndex.value == 0
                      ? Colors.red
                      : Colors.grey,
                  height: 18.0.h,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/Portfolia.svg',
                  color: controller.selectedIndex.value == 1
                      ? Colors.red
                      : Colors.grey,
                  height: 18.0.h,
                ),
                label: 'Portfolio',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/Input.svg',
                  color: controller.selectedIndex.value == 2
                      ? Colors.red
                      : Colors.grey,
                  height: 18.0.h,
                ),
                label: 'Input',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/Profile.svg',
                  color: controller.selectedIndex.value == 3
                      ? Colors.red
                      : Colors.grey,
                  height: 18.0.h,
                ),
                label: 'Profile',
              ),
            ],
          )),
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
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
