import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newproject1/screens/daily_challengeview.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

int _selectedIndex = 0;

class _DiscoverViewState extends State<DiscoverView> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder:
          (context, child) => Scaffold(
            backgroundColor: Colors.grey[200],
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.white,
                            height: 240.h,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: Image.asset(
                                'assets/images/photo-1502602898657-3e91760cbb34.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.w),
                            child: Column(
                              children: [
                                SizedBox(height: 14.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Transform.rotate(
                                          angle: -1 * 3.14159 / 180,
                                          child: Icon(
                                            Icons.north_east_rounded,
                                            size: 30.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 6.w),

                                        Text(
                                          'Norway',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'DMSans',
                                          ),
                                        ),

                                        Spacer(),
                                        Container(
                                          padding: EdgeInsets.all(8.w),
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                              255,
                                              121,
                                              111,
                                              111,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 16.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 23.h),
                                    Text(
                                      'Hey Martin! Tell us where you\nwant to go',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.sp,
                                        fontFamily: 'DMSans',

                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 45.h),
                                // Search Box
                                Container(
                                  height: 60.h,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(
                                      0.25,
                                    ), // soft transparent iPhone style
                                    borderRadius: BorderRadius.circular(30.r),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(
                                        0.5,
                                      ), // subtle light border
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(
                                          0.1,
                                        ), // soft shadow
                                        blurRadius: 8.r,
                                        offset: Offset(0, 4.h),
                                      ),
                                    ],
                                  ),

                                  child: Row(
                                    children: [
                                      Icon(Icons.search, color: Colors.white),
                                      SizedBox(width: 12.w),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Search places',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'DMSans',
                                              ),
                                            ),
                                            Text(
                                              'Date range • Number of guests',
                                              style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'DMSans',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  // Most Relevant Section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'The most relevant',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'DMSans',
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.r),
                    ),
                    child: Container(
                      height: 290.h,
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25.r),
                                child: Image.asset(
                                  'assets/images/paris.jpg',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 200.h,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Tiny home in Roellingen',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'DMSans',
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.star_rate,
                                          color: Color.fromARGB(
                                            255,
                                            102,
                                            80,
                                            80,
                                          ),
                                          size: 20.sp,
                                        ),
                                        SizedBox(width: 2.w),
                                        Text(
                                          '4.6 (217)',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.black,
                                            fontFamily: 'DMSans',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '4 guests • 2 bedrooms • 2 beds • 1 bathroom',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13.sp,
                                        fontFamily: 'DMSans',
                                      ),
                                    ),
                                    Text(
                                      '€117 • €91 night • €273 total',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'DMSans',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 10.h,
                            right: 10.w,
                            child: Container(
                              padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(66, 148, 145, 149),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discover new places',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'DMSans',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => const SeatSelectionScreen(),
                              ), // ya jo bhi screen
                            );
                          },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 18.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildDiscoverCard('assets/images/shimla.jpg'),
                        _buildDiscoverCard('assets/images/tour.png'),
                        _buildDiscoverCard('assets/images/paris.jpg'),
                      ],
                    ),
                  ),
                  SizedBox(height: 23.h),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              margin: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Color(0xFF1C1C1E),
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.r,
                    offset: Offset(0, 4.h),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  currentIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                  items: [
                    BottomNavigationBarItem(
                      icon: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(Icons.explore),
                          if (_selectedIndex == 0)
                            Positioned(
                              bottom: 2, // yahan adjust karo
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  //shape: BoxShape.circle,
                                ),
                              ),
                            ),
                        ],
                      ),
                      label: 'Discover',
                    ),
                    BottomNavigationBarItem(
                      icon: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(Icons.favorite),
                          if (_selectedIndex == 1)
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: 8.w,
                                height: 8.w,
                                decoration: BoxDecoration(),
                              ),
                            ),
                        ],
                      ),
                      label: 'Favorites',
                    ),
                    BottomNavigationBarItem(
                      icon: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(Icons.bookmark),
                          if (_selectedIndex == 2)
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: 8.w,
                                height: 8.w,
                                decoration: BoxDecoration(),
                              ),
                            ),
                        ],
                      ),
                      label: 'Bookings',
                    ),
                    BottomNavigationBarItem(
                      icon: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(Icons.message),
                          if (_selectedIndex == 3)
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: 8.w,
                                height: 8.w,
                                decoration: BoxDecoration(),
                              ),
                            ),
                        ],
                      ),
                      label: 'Messages',
                    ),
                  ],
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  selectedLabelStyle: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'DMSans',
                  ),
                  type: BottomNavigationBarType.fixed,
                  elevation: 0,
                ),
              ),
            ),
          ),
    );
  }

  Widget _buildDiscoverCard(String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(33.r),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: 180.w,
          height: 120.h,
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: const DiscoverView()),
  );
}
