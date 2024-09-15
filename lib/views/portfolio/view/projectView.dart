import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_task/dummyData.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({super.key});

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    ScrollController _scrollController = ScrollController();
    DummyData data = DummyData();

    List<Map<String, dynamic>> _allLogList = data.dummyData;

    List<Map<String, dynamic>> _filteredList = [];

    @override
    void initState() {
      _filteredList = _allLogList;
      super.initState();
    }

    @override
    void dispose() {
      _searchController.dispose();
      super.dispose();
    }

    void _filterLogListBySearchText(String searchText) {
      setState(() {
        _filteredList = _allLogList
            .where((element) => element['project title']
                .toString()
                .toLowerCase()
                .contains(searchText.toLowerCase()))
            .toList();
      });
    }

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          height: 40,
          child: FloatingActionButton.extended(
            elevation: 1,
            backgroundColor: Colors.red,
            onPressed: () {
              log(_allLogList[1]['project title']);
            },
            label: Text('Filter'),
            icon: Icon(Icons.filter_alt),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ).r,
          child: Column(
            children: [
              TextField(
                cursorHeight: 18,
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
                        _searchController.text = "";
                        _filterLogListBySearchText("");
                      },
                      child: SmoothContainer(
                        borderRadius: BorderRadius.circular(8),
                        height: 25,
                        width: 25,
                        color: Colors.red,
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                onChanged: (value) => _filterLogListBySearchText(value),
                onSubmitted: (value) => _filterLogListBySearchText(value),
              ),
              SizedBox(
                height: 20.r,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      controller: _scrollController,
                      itemCount: _allLogList.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(bottom: 10),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ).r,
                          child: SmoothContainer(
                            padding: EdgeInsets.all(10).r,
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _allLogList[index]['project title'],
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.r,
                                ),
                                Text(
                                  _allLogList[index]['project description'],
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.r,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _allLogList[index]['date'],
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      _allLogList[index]['Owner'],
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
