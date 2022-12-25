import 'dart:math';
import 'package:bloc1/business_logic/cubit/contests_list_cubit.dart';
import 'package:bloc1/business_logic/cubit/local_notifications_cubit.dart';
import 'package:bloc1/data/constants/constants.dart';
import 'package:bloc1/data/models/contest_model.dart';
import 'package:bloc1/views/widgets/components/empty_states.dart';
import 'package:bloc1/views/widgets/components/error_states.dart';
import 'package:bloc1/views/widgets/components/snackbars_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'dart:developer' as dev;

class ContestsListWidget extends StatelessWidget {
  const ContestsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocalNotificationsCubit, LocalNotificationsState>(
      listener: (context, state) {
        if (state is LocalNotificationsScheduled) {
          ScaffoldMessenger.of(context).showSnackBar(
              const CustomSnackbars().okSnackbar("You will be notified"));
        } else if (state is LocalNotificationsRemoved) {
          ScaffoldMessenger.of(context).showSnackBar(const CustomSnackbars()
              .warningSnackbar("Notifications removed for the contest"));
        }
      },
      child: BlocBuilder<ContestsListCubit, ContestsListState>(
        builder: (context, state) {
          if (state is ContestsListLoaded) {
            final List<ContestModel> upcomingContests = state.upcomingContests;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(24, 4, 0, 12),
                  child: Text(
                    "Upcoming Contests",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: upcomingContests.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: generateColor(
                                      upcomingContests[index].name),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      shortDateFromTimeInMilliSeconds(1000 *
                                          upcomingContests[index]
                                              .startTimeSeconds),
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        letterSpacing: 0.7,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      DateFormat("HH:mm").format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              1000 *
                                                  upcomingContests[index]
                                                      .startTimeSeconds)),
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        letterSpacing: 0.3,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      upcomingContests[index].name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.4,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0),
                                      child: Text(
                                        "Duration: ${Duration(seconds: upcomingContests[index].durationSeconds).inHours}:${Duration(seconds: upcomingContests[index].durationSeconds).inMinutes % 60}",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.8,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            BlocBuilder<LocalNotificationsCubit,
                                LocalNotificationsState>(
                              builder: (context, state) {
                                final int contestId =
                                    upcomingContests[index].id;
                                bool isActive = false;
                                for (var id in state.scheduledIds) {
                                  if (id == contestId) {
                                    isActive = true;
                                    break;
                                  }
                                }
                                if (state is LocalNotificationsLoading) {
                                  return const Padding(
                                    padding: EdgeInsets.only(right: 16.0),
                                    child: SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator.adaptive(
                                        strokeWidth: 2.0,
                                      ),
                                    ),
                                  );
                                }
                                return IconButton(
                                  onPressed: () {
                                    if (isActive) {
                                      BlocProvider.of<LocalNotificationsCubit>(
                                              context)
                                          .removeLocalNotification([contestId]);
                                    } else {
                                      BlocProvider.of<LocalNotificationsCubit>(
                                              context)
                                          .scheduleLocalNotification(
                                        id: contestId,
                                        title:
                                            "There's a contest today, ${userConstants.user.handle}",
                                        body: upcomingContests[index].name,
                                        time:
                                            DateTime.fromMillisecondsSinceEpoch(
                                                    upcomingContests[index]
                                                            .startTimeSeconds *
                                                        1000)
                                                .subtract(
                                          const Duration(hours: 8),
                                        ),
                                      );
                                      BlocProvider.of<LocalNotificationsCubit>(
                                              context)
                                          .scheduleLocalNotification(
                                        id: contestId,
                                        title:
                                            "Get Ready ${userConstants.user.handle}",
                                        body:
                                            "The ${upcomingContests[index].name} will start in an hour",
                                        time:
                                            DateTime.fromMillisecondsSinceEpoch(
                                                    upcomingContests[index]
                                                            .startTimeSeconds *
                                                        1000)
                                                .subtract(
                                          const Duration(hours: 1),
                                        ),
                                      );
                                      BlocProvider.of<LocalNotificationsCubit>(
                                              context)
                                          .scheduleLocalNotification(
                                        id: contestId,
                                        title:
                                            "Get Calm ${userConstants.user.handle}",
                                        body:
                                            "The ${upcomingContests[index].name} will start in 15 minutes",
                                        time:
                                            DateTime.fromMillisecondsSinceEpoch(
                                                    upcomingContests[index]
                                                            .startTimeSeconds *
                                                        1000)
                                                .subtract(
                                          const Duration(minutes: 15),
                                        ),
                                      );
                                    }
                                  },
                                  icon: Icon(
                                    isActive
                                        ? Icons.notifications_active_rounded
                                        : Icons.notification_add_outlined,
                                    color: Colors.blueGrey,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          } else if (state is ContestsListError) {
            dev.log("Error: (contests list widget) - ${state.message}");
            return const ErrorStates().basicErrorWidget(() {});
          } else {
            return const EmptyStates().emptyContestsListWidget();
          }
        },
      ),
    );
  }
}

Color? generateColor(String name) {
  List<Color?> colors = [
    Colors.indigo[50],
    Colors.green[50],
    Colors.red[50],
    Colors.blue[50],
  ];
  int index = name.codeUnitAt(Random().nextInt(name.length)) % colors.length;
  return colors[index];
}

String shortDateFromTimeInMilliSeconds(int millisecondsSinceEpoch) {
  final DateTime today = DateTime.now();
  final DateTime tomorrow = today.add(const Duration(days: 1));
  final DateTime givenDate =
      DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  String dateString = "";
  if (today.day == givenDate.day &&
      today.month == givenDate.month &&
      today.year == givenDate.year) {
    dateString = "Today";
  } else if (tomorrow.day.compareTo(givenDate.day) == 0 &&
      tomorrow.month.compareTo(givenDate.month) == 0 &&
      tomorrow.year.compareTo(givenDate.year) == 0) {
    dateString = "Tomorrow";
  } else {
    dateString = DateFormat("dd MMM")
        .format(DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch));
  }
  return dateString;
}
