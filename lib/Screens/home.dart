import 'package:flutter/material.dart';
import 'package:goodspace/Apis%20Repo/test_apis.dart';
import 'package:goodspace/Models/inactive_products.dart';
import 'package:goodspace/Models/jobs_feed.dart';

import 'package:goodspace/Ui%20Componenets/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Kbackwhite,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.face,
            color: Colors.grey,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.diamond_outlined,
              color: Kbackblue,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Colors.blueGrey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.blueGrey,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.diamond_outlined,
                  color: Colors.amber[500],
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Text(
                  'Step into the future',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.18,
              child: FutureBuilder<List<ProductElement>>(
                future: TestApis()
                    .getInactiveProducts(), // Replace fetchData with your asynchronous data fetching function
                builder: (BuildContext context,
                    AsyncSnapshot<List<ProductElement>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // While data is being fetched
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    // If an error occurs
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // If data is successfully fetched
                    List<ProductElement>? dataList = snapshot.data;

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dataList?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Container(
                              height: height * 0.18,
                              width: width * 0.35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Spacer(),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.grey.shade300,
                                    child: Icon(
                                      Icons.person_4_outlined,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.015,
                                  ),
                                  Text(
                                    dataList?[index].displayName ?? '',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Center(
              child: Text(
                'Jobs for you',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Divider(
              color: Colors.blue,
              thickness: 2,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for jobs',
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Flexible(
              child: FutureBuilder<List<JobElementData>>(
                future: TestApis().getJobs(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<JobElementData>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // While data is being fetched
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    // If an error occurs
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // If data is successfully fetched
                    List<JobElementData>? dataList = snapshot.data;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: dataList?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            if (dataList?[index]
                                    .cardData
                                    ?.displayCompensation !=
                                null)
                              Container(
                                height: height * 0.22,
                                width: width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            dataList?[index].cardData?.title ??
                                                '',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.share_outlined,
                                            color: Colors.grey.shade700,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.001,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            dataList?[index]
                                                    .cardData
                                                    ?.companyName ??
                                                '',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey.shade700,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Spacer(),
                                          Text(
                                            dataList?[index]
                                                    .cardData
                                                    ?.postedAtRelative ??
                                                '',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey.shade700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.001,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.home_outlined,
                                            color: Colors.grey.shade600,
                                            size: 14,
                                          ),
                                          Text(
                                            dataList?[index]
                                                    .cardData
                                                    ?.locationCity ??
                                                '',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey.shade600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.005,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: height * 0.045,
                                            width: width * 0.25,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              color: Colors.green.shade100,
                                              border: Border.all(
                                                color: Colors.green,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                dataList?[index]
                                                        .cardData
                                                        ?.displayCompensation ??
                                                    '',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.green,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: height * 0.045,
                                            width: width * 0.25,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              color: Colors.blue.shade50,
                                              border: Border.all(
                                                color: Colors.blue,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "${dataList?[index].cardData?.lowerworkex}-${dataList?[index].cardData?.upperworkex} yrs",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: height * 0.045,
                                            width: width * 0.25,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              color: Colors.deepPurple.shade50,
                                              border: Border.all(
                                                color: Colors.deepPurple,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                dataList?[index]
                                                            .cardData
                                                            ?.isRemote
                                                            .toString() ==
                                                        '0'
                                                    ? 'Onsite' // Change color based on condition
                                                    : 'Remote',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.deepPurple,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.005,
                                      ),
                                      Row(
                                        children: [
                                          if (dataList?[index]
                                                  .cardData
                                                  ?.userInfo
                                                  ?.imageId !=
                                              null)
                                            Image.network(
                                              dataList?[index]
                                                      .cardData
                                                      ?.userInfo
                                                      ?.imageId ??
                                                  '',
                                              scale: 3,
                                              height: height * 0.045,
                                              width: width * 0.1,
                                            ),

                                          SizedBox(
                                            width: width * 0.02,
                                          ),
                                          Text(
                                            dataList?[index]
                                                    .cardData
                                                    ?.userInfo
                                                    ?.name ??
                                                '',
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Spacer(),
                                          //button
                                          GestureDetector(
                                            onTap: () {
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (context) =>
                                              //         WebviewPage(
                                              //       eventUrl: dataList?[index]
                                              //               .cardData
                                              //               ?.url ??
                                              //           '',
                                              //     ),
                                              //   ),
                                              // );
                                            },
                                            child: Container(
                                              height: height * 0.045,
                                              width: width * 0.25,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                color: Colors.blue,
                                                border: Border.all(
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Apply',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.work_outline_rounded,
            ),
            label: 'Work',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.handshake_outlined,
            ),
            label: 'Recruit',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people_outline_rounded,
            ),
            label: 'Social',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outline_rounded,
            ),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_rounded,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
