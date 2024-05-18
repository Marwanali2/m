import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marovies/core/utils/colors.dart';
import 'package:marovies/core/utils/global_variables.dart';
import 'package:marovies/features/home/presentation/views/home_view.dart';
import 'package:marovies/features/watch_list/presentation/views/watch_list_view.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          height: MediaQuery.sizeOf(context).height * 0.07.h,
          elevation: 0.0,
          color: AppColorStyles.kPrimaryColor,
          child: TabBar(
            dividerColor: AppColorStyles.kPrimaryColor,
            labelColor: AppColorStyles.kSemiBlue,
            overlayColor:
                const MaterialStatePropertyAll(AppColorStyles.kPrimaryColor),
            physics: const BouncingScrollPhysics(),
            indicator: const BoxDecoration(borderRadius: BorderRadius.zero),
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home_outlined,
                  size: 25.sp,
                ),
                text: 'Home',
                iconMargin: EdgeInsets.zero,
              ),
              Tab(
                icon: Icon(
                  Icons.bookmark_border,
                  size: 25.sp,
                ),
                text: 'Watch List',
                iconMargin: EdgeInsets.zero,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeView(
              sessionId: GlobalVariables.sessionId,
              userId: GlobalVariables.accountId,
            ),
            const WatchListView(
              
            ),
          ],
        ),
      ),
    );
  }
}
