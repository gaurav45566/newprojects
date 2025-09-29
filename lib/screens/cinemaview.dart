import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDayProvider = StateProvider<int>((ref) => 4);
final bottomNavProvider = StateProvider<int>((ref) => 0); //

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Dailychallengescreenview(),
      ),
    ),
  );
}

class Dailychallengescreenview extends ConsumerWidget {
  const Dailychallengescreenview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectedDayProvider);
    final selectedBottom = ref.watch(bottomNavProvider);

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            forceMaterialTransparency: true,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundImage: const AssetImage(
                        'assets/images/sandra.jpg',
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Hello, Sandra',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'DMSans',
                          ),
                        ),
                        Text(
                          'Today 25 Nov.',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey,
                            fontFamily: 'DMSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.search, color: Colors.black),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),

          // -------- Body --------
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 60.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 33.h),
                    _buildChallengeCard(),
                    SizedBox(height: 12.h),
                    _buildDaySelector(ref, selectedDay),
                    SizedBox(height: 22.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.w),
                      child: Text(
                        'Your Plan',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'DMSans',
                        ),
                      ),
                    ),
                    SizedBox(height: 18.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildPlanCard(
                            'Medium',
                            'Yoga Group',
                            '25 Nov.\n14:00-15:00\nA5 room',
                            const Color.fromARGB(255, 243, 175, 72),
                            bottomText1: 'Trainer Tiffany',
                            bottomText2: 'Hello',
                            trainerImage: 'assets/images/sandra.jpg',
                          ),
                          SizedBox(width: 15.w),
                          Column(
                            children: [
                              _buildPlanCard(
                                'Light',
                                'Balance',
                                '28 Nov.\n18:00-19:30\nA2 room',
                                const Color.fromARGB(255, 157, 200, 221),
                                trainerImage: 'assets/images/balancelife.png',
                                showBottomImages: false,
                                height: 190.h,
                                cornerImage: 'assets/images/balancelife.png',
                              ),
                              SizedBox(height: 13.h),
                              Container(
                                width: 150.w,
                                height: 60.h,
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    255,
                                    221,
                                    130,
                                    197,
                                  ),
                                  borderRadius: BorderRadius.circular(16.r),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      radius: 14.r,
                                      backgroundImage: const AssetImage(
                                        'assets/images/Instagram_icon.png',
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 14.r,
                                      backgroundImage: const AssetImage(
                                        'assets/images/youtube.png',
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 14.r,
                                      backgroundImage: const AssetImage(
                                        'assets/images/twitter.png',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),

              // -------- Bottom Nav --------
              Positioned(
                bottom: 0,
                left: 32.w,
                right: 32.w,
                child: Container(
                  height: 65.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: const Color(0xAA1C1C1E),
                    borderRadius: BorderRadius.circular(33.r),
                    boxShadow: const [BoxShadow(color: Colors.black)],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildBottomIcon(ref, 0, Icons.home, selectedBottom),
                      _buildBottomIcon(ref, 1, Icons.grid_view, selectedBottom),
                      _buildBottomIcon(ref, 2, Icons.person, selectedBottom),
                      _buildBottomIcon(ref, 3, Icons.settings, selectedBottom),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildChallengeCard() {
    return Center(
      child: Container(
        width: 346.w,
        height: 238.h,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFFD1B3FF),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Daily\nchallenge',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontFamily: 'DMSans',
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Do your plan before 09:00 AM',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'DMSans',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16.r,
                        backgroundImage: const AssetImage(
                          'assets/images/1boiys.png',
                        ),
                      ),
                      CircleAvatar(
                        radius: 16.r,
                        backgroundImage: const AssetImage(
                          'assets/images/4girl.png',
                        ),
                      ),
                      CircleAvatar(
                        radius: 16.r,
                        backgroundImage: const AssetImage(
                          'assets/images/4girl.png',
                        ),
                      ),
                      CircleAvatar(
                        radius: 16.r,
                        backgroundImage: const AssetImage(
                          'assets/images/3rdgirl.png',
                        ),
                      ),
                      CircleAvatar(
                        radius: 16.r,
                        backgroundColor: Colors.black,
                        child: Text(
                          '+5',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  'assets/images/dailichlnge.png',
                  fit: BoxFit.cover,
                  height: 120.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDaySelector(WidgetRef ref, int selectedDay) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        // 👈 scroll add kiya
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(7, (index) {
            final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
            final number = (index + 1).toString();
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: GestureDetector(
                onTap:
                    () =>
                        ref.read(selectedDayProvider.notifier).state =
                            index + 1,
                child: _buildDayBox(
                  number,
                  days[index],
                  isSelected: selectedDay == index + 1,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildDayBox(String number, String day, {bool isSelected = false}) {
    return Container(
      width: 45.w,
      height: 55.h,
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey, width: 0.6),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 3, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          Text(
            day,
            style: TextStyle(
              fontSize: 10.sp,
              color: isSelected ? Colors.white : Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanCard(
    String level,
    String title,
    String details,
    Color color, {
    double height = 240,
    double width = 165,
    String? bottomText1,
    String? bottomText2,
    String? trainerImage,
    bool showBottomImages = true,
    String? cornerImage,
  }) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(11.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    level,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  details,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'DMSans',
                    fontSize: 12.sp,
                  ),
                ),
                const Spacer(),
                if (bottomText1 != null && trainerImage != null)
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 14.r,
                        backgroundImage: AssetImage(trainerImage),
                      ),
                      SizedBox(width: 6.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bottomText1,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontFamily: 'DMSans',
                            ),
                          ),
                          if (bottomText2 != null)
                            Text(
                              bottomText2,
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                color: Colors.black,
                                fontSize: 10.sp,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ),
          if (cornerImage != null)
            Positioned(
              bottom: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16.r),
                  topLeft: Radius.circular(16.r),
                ),
                child: Image.asset(
                  cornerImage,
                  width: 80.w,
                  height: 120.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBottomIcon(
    WidgetRef ref,
    int index,
    IconData icon,
    int selected,
  ) {
    return GestureDetector(
      onTap: () => ref.read(bottomNavProvider.notifier).state = index,
      child: Container(
        decoration: BoxDecoration(
          color: selected == index ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(12.w),
        child: Icon(
          icon,
          color: selected == index ? Colors.black : Colors.white,
          size: 24.sp,
        ),
      ),
    );
  }
}
