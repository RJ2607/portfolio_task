import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:portfolio_task/dummyData.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({super.key});

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  TextEditingController _searchController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  final RxList<DummyData> _allDataList = dummyData.obs;
  final RxList<DummyData> _filteredDataList = <DummyData>[].obs;

  @override
  void initState() {
    super.initState();
    _filteredDataList.assignAll(_allDataList);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterDataListBySearchText(String searchText) {
    if (searchText.isEmpty) {
      _filteredDataList.assignAll(_allDataList);
    } else {
      final suggestion = _allDataList.where((element) {
        final title = element.projectTitle.toLowerCase();
        final input = searchText.toLowerCase();
        return title.contains(input);
      }).toList();

      _filteredDataList.assignAll(suggestion);
    }

    log(_filteredDataList.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10).r,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              TextField(
                controller: _searchController,
                style: TextStyle(
                  fontSize: 18.sp,
                ),
                decoration: InputDecoration(
                  focusColor: Colors.red,
                  isDense: true,
                  contentPadding: EdgeInsets.all(10).r,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.sp,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Search',
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(8.0).r,
                    child: GestureDetector(
                      onTap: () {
                        _filterDataListBySearchText(_searchController.text);
                      },
                      child: SmoothContainer(
                        borderRadius: BorderRadius.circular(8),
                        height: 25.h,
                        width: 25.h,
                        color: Colors.red,
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 16.h,
                        ),
                      ),
                    ),
                  ),
                ),
                onChanged: _filterDataListBySearchText,
                onSubmitted: _filterDataListBySearchText,
              ),
              SizedBox(
                height: 20.h,
              ),
              Obx(
                () => SizedBox(
                  height: 530.h,
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: _scrollController,
                    itemCount: _filteredDataList.length,
                    itemBuilder: (context, index) {
                      final data = _filteredDataList[index];
                      return Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color.fromARGB(255, 179, 179, 179))),
                        child: Row(
                          children: [
                            Container(
                              width: 100.h,
                              height: 110.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10).r,
                                  bottomLeft: Radius.circular(10).r,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(data.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.projectTitle,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    data.description,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data.date,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(
                                              255, 141, 141, 141),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 80.w,
                                      ),
                                      Text(
                                        data.owner,
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(
                                              255, 141, 141, 141),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
