import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newproject1/screens/cinemaview.dart';

enum SeatStatus { available, selected, reserved }

void main() {
  runApp(const CinemaSeatBookingApp());
}

class CinemaSeatBookingApp extends StatelessWidget {
  const CinemaSeatBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder:
          (context, child) => const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SeatSelectionScreen(),
          ),
    );
  }
}

class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen({super.key});

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  final Color selectedColor = const Color.fromARGB(255, 138, 104, 240);
  final Color reservedColor = Colors.black;
  final Color availableColor = const Color.fromARGB(255, 209, 206, 198);
  final Color backgroundColor = const Color(0xFFF3F1E6);

  late List<List<SeatStatus?>> leftSide;
  late List<List<SeatStatus?>> rightSide;

  @override
  void initState() {
    super.initState();
    leftSide = [
      [null, SeatStatus.available, SeatStatus.available, SeatStatus.available],
      [
        SeatStatus.available,
        SeatStatus.selected,
        SeatStatus.available,
        SeatStatus.available,
      ],
      [
        SeatStatus.available,
        SeatStatus.available,
        SeatStatus.available,
        SeatStatus.available,
      ],
      [
        SeatStatus.available,
        SeatStatus.available,
        SeatStatus.available,
        SeatStatus.available,
      ],
      [
        SeatStatus.available,
        SeatStatus.available,
        SeatStatus.available,
        SeatStatus.available,
      ],
      [
        SeatStatus.available,
        SeatStatus.available,
        SeatStatus.available,
        SeatStatus.available,
      ],
      [
        SeatStatus.available,
        SeatStatus.reserved,
        SeatStatus.available,
        SeatStatus.available,
      ],
      [null, SeatStatus.available, SeatStatus.available, SeatStatus.available],
    ];

    rightSide = [
      [SeatStatus.available, SeatStatus.available, SeatStatus.available, null],
      [
        SeatStatus.available,
        SeatStatus.reserved,
        SeatStatus.available,
        SeatStatus.reserved,
      ],
      [
        SeatStatus.available,
        SeatStatus.available,
        SeatStatus.available,
        SeatStatus.available,
      ],
      [
        SeatStatus.available,
        SeatStatus.available,
        SeatStatus.available,
        SeatStatus.available,
      ],
      [
        SeatStatus.available,
        SeatStatus.selected,
        SeatStatus.available,
        SeatStatus.available,
      ],
      [
        SeatStatus.available,
        SeatStatus.available,
        SeatStatus.available,
        SeatStatus.available,
      ],
      [
        SeatStatus.available,
        SeatStatus.available,
        SeatStatus.available,
        SeatStatus.available,
      ],
      [SeatStatus.available, SeatStatus.available, SeatStatus.available, null],
    ];
  }

  int getSelectedCount() => _countSeats(SeatStatus.selected);
  int getReservedCount() => _countSeats(SeatStatus.reserved);
  int getAvailableCount() => _countSeats(SeatStatus.available);

  int _countSeats(SeatStatus status) {
    int count = 0;
    for (var row in leftSide) for (var seat in row) if (seat == status) count++;
    for (var row in rightSide)
      for (var seat in row) if (seat == status) count++;
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            // Gradient Top
            Container(
              height: 120.h,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 223, 255, 140),
                    Color.fromARGB(0, 224, 255, 140),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 180.h),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  // Profile + Search
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20.r,
                          backgroundImage: NetworkImage(
                            'https://i.pravatar.cc/300',
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "Samantha",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.search, size: 26.sp),
                      ],
                    ),
                  ),
                  // Title + Back
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back, size: 24.sp),
                        SizedBox(width: 10.w),
                        Text(
                          "Choose Seats",
                          style: TextStyle(
                            fontSize: 27.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Seat Layout
                  LayoutBuilder(
                    builder:
                        (context, constraints) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: buildSeatLayout(constraints.maxWidth),
                        ),
                  ),
                  SizedBox(height: 20.h),
                  // Legend Row
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        legendItem(
                          "Selected",
                          selectedColor,
                          getSelectedCount(),
                        ),
                        legendItem(
                          "Reserved",
                          reservedColor,
                          getReservedCount(),
                        ),
                        legendItem(
                          "Available",
                          availableColor,
                          getAvailableCount(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 140.h),
                ],
              ),
            ),
            // Bottom Info Panel
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.r),
                  ),
                ),
                padding: EdgeInsets.all(20.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 18.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "Cinema",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        infoColumn("08.04", "Date"),
                        infoColumn("21:55", "Hour"),
                        infoColumn("2,3", "Seats"),
                        infoColumn("2,5", "Row"),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$35.50",
                          style: TextStyle(
                            fontSize: 22.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => const Dailychallengescreenview(),
                                ),
                              ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 50.w,
                              vertical: 14.h,
                            ),
                            decoration: BoxDecoration(
                              color: selectedColor,
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: Text(
                              "Buy",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSeatLayout(double maxWidth) {
    double seatSize = 30.h;
    double seatGap = 6.h;
    double centerGap = 40.w;

    return Column(
      children: List.generate(leftSide.length, (rowIndex) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(leftSide[rowIndex].length, (colIndex) {
              final seat = leftSide[rowIndex][colIndex];
              return buildSeat(
                seat,
                () {
                  if (seat == SeatStatus.available) {
                    setState(
                      () => leftSide[rowIndex][colIndex] = SeatStatus.selected,
                    );
                  } else if (seat == SeatStatus.selected) {
                    setState(
                      () => leftSide[rowIndex][colIndex] = SeatStatus.available,
                    );
                  }
                },
                seatSize,
                seatGap,
              );
            }),
            SizedBox(width: centerGap),
            ...List.generate(rightSide[rowIndex].length, (colIndex) {
              final seat = rightSide[rowIndex][colIndex];
              return buildSeat(
                seat,
                () {
                  if (seat == SeatStatus.available) {
                    setState(
                      () => rightSide[rowIndex][colIndex] = SeatStatus.selected,
                    );
                  } else if (seat == SeatStatus.selected) {
                    setState(
                      () =>
                          rightSide[rowIndex][colIndex] = SeatStatus.available,
                    );
                  }
                },
                seatSize,
                seatGap,
              );
            }),
          ],
        );
      }),
    );
  }

  Widget buildSeat(
    SeatStatus? seat,
    VoidCallback onTap,
    double seatSize,
    double seatGap,
  ) {
    if (seat == null)
      return SizedBox(width: seatSize + seatGap, height: seatSize + seatGap);
    Color color;
    String text = "";
    switch (seat) {
      case SeatStatus.available:
        color = availableColor;
        break;
      case SeatStatus.selected:
        color = selectedColor;
        text = "S";
        break;
      case SeatStatus.reserved:
        color = reservedColor;
        text = "R";
        break;
      default:
        color = availableColor;
    }

    return GestureDetector(
      onTap: seat == SeatStatus.reserved ? null : onTap,
      child: Container(
        margin: EdgeInsets.all(seatGap),
        width: seatSize,
        height: seatSize,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget legendItem(String label, Color color, int count) {
    return Row(
      children: [
        Container(
          width: 14.w,
          height: 14.w,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 4.w),
        Text(
          "$label: $count",
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget infoColumn(String label, String value) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: Colors.grey, fontSize: 13.sp)),
        SizedBox(height: 5.h),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
