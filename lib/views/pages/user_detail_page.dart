import 'package:bloc1/business_logic/cubit/app_cubit.dart';
import 'package:bloc1/business_logic/cubit/problem_rating_chart_cubit.dart';
import 'package:bloc1/business_logic/cubit/problem_tags_chips_cubit.dart';
import 'package:bloc1/business_logic/cubit/problems_heat_map_cubit.dart';
import 'package:bloc1/business_logic/cubit/rating_change_chart_cubit.dart';
import 'package:bloc1/business_logic/cubit/rating_change_list_cubit.dart';
import 'package:bloc1/business_logic/cubit/submissions_list_cubit.dart';
import 'package:bloc1/business_logic/cubit/user_card_cubit.dart';
import 'package:bloc1/business_logic/cubit/user_stats_cubit.dart';
import 'package:bloc1/utils/app_theme.dart';
import 'package:bloc1/views/widgets/components/appbar_custom.dart';
import 'package:bloc1/views/widgets/components/empty_states.dart';
import 'package:bloc1/views/widgets/problem_ratings_chart_widget.dart';
import 'package:bloc1/views/widgets/problem_tags_chips_widget.dart';
import 'package:bloc1/views/widgets/problems_heatmap.dart';
import 'package:bloc1/views/widgets/rating_change_chart_widget.dart';
import 'package:bloc1/views/widgets/rating_change_list_widget.dart';
import 'package:bloc1/views/widgets/submissions_list_widget.dart';
import 'package:bloc1/views/widgets/user_card_widget.dart';
import 'package:bloc1/views/widgets/users_statistics_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailPage extends StatelessWidget {
  final String handle;
  const UserDetailPage(this.handle, {Key? key}) : super(key: key);

  Future<void> initialise(BuildContext context) async {
    await BlocProvider.of<UserCardCubit>(context).makeUserCard(handle: handle);
    await BlocProvider.of<RatingChangeChartCubit>(context)
        .makeRatingsChart([handle]);
    await BlocProvider.of<UserStatsCubit>(context).makeUserStats(handle);
    await BlocProvider.of<ProblemsHeatMapCubit>(context).makeHeatMap(handle);
    await BlocProvider.of<ProblemTagsChipsCubit>(context)
        .makeProblemTagsChips(handle);
    await BlocProvider.of<ProblemRatingChartCubit>(context)
        .makeProblemRatingsChart(handle);
    await BlocProvider.of<RatingChangeListCubit>(context)
        .makeRatingChangeList(handle);
    await BlocProvider.of<SubmissionsListCubit>(context)
        .makeSubmissionsList(handle, date: DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is AppUserDetailsPageLoaded) {
          initialise(context);
          return Scaffold(
            appBar: customAppBar("User"),
            backgroundColor: CustomAppTheme().bgColor,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        child: const UserCardWidget(),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18.0),
                          border: Border.all(color: Colors.blueGrey[50]!),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                      child: Text(
                        "Graph",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      child: Container(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: RatingChangeChart(),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18.0),
                          border: Border.all(color: Colors.blueGrey[50]!),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(24, 4, 0, 0),
                      child: Text(
                        "Stats",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 12.0),
                      child: Container(
                        width: double.infinity,
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: UsersStatisticsWidget(),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18.0),
                          border: Border.all(color: Colors.blueGrey[50]!),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(24, 4, 0, 0),
                      child: Text(
                        "Heatmap",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 12.0),
                      child: Container(
                        width: double.infinity,
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: ProblemsHeatMap(),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18.0),
                          border: Border.all(color: Colors.blueGrey[50]!),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(24, 4, 0, 0),
                      child: Text(
                        "Problem Tags",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 12.0),
                      child: Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ProblemTagsChipsWidget(handle),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18.0),
                          border: Border.all(color: Colors.blueGrey[50]!),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(24, 4, 0, 0),
                      child: Text(
                        "Problem Ratings",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 12.0),
                      child: Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ProblemRatingsChartWidget(handle),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18.0),
                          border: Border.all(color: Colors.blueGrey[50]!),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(24, 4, 0, 0),
                      child: Text(
                        "Today's Submissions",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 12.0),
                      child: Container(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: SubmissionsListWidget(300),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18.0),
                          border: Border.all(color: Colors.blueGrey[50]!),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(24, 4, 0, 0),
                      child: Text(
                        "Contests",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 12.0),
                      child: Container(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: RatingChangeListWidget(300),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18.0),
                          border: Border.all(color: Colors.blueGrey[50]!),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          );
        } else if (state is AppUserDetailsPageLoading) {
          return const EmptyStates().emptyUserDetailsPage();
        } else {
          BlocProvider.of<AppCubit>(context).generateUserDetailsPage();
          return const EmptyStates().emptyUserDetailsPage();
        }
      },
    );
  }
}
