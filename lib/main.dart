import 'package:bloc1/business_logic/AppRouter/app_router.dart';
import 'package:bloc1/business_logic/cubit/app_cubit.dart';
import 'package:bloc1/business_logic/cubit/app_initialisation_cubit.dart';
import 'package:bloc1/business_logic/cubit/contests_list_cubit.dart';
import 'package:bloc1/business_logic/cubit/logout_cubit.dart';
import 'package:bloc1/business_logic/cubit/problems_heat_map_cubit.dart';
import 'package:bloc1/business_logic/cubit/problems_list_cubit.dart';
import 'package:bloc1/business_logic/cubit/submission_code_viewer_cubit.dart';
import 'package:bloc1/business_logic/cubit/user_stats_cubit.dart';
import 'package:bloc1/utils/services/local_notifications_service.dart';
import 'package:bloc1/views/screens/counter_bloc_demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc1/business_logic/cubit/counter_cubit.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_10y.dart';

import 'business_logic/AppRouter/navigation_cubit.dart';
import 'business_logic/cubit/add_user_handle_cubit.dart';
import 'business_logic/cubit/contest_standings_cubit.dart';
import 'business_logic/cubit/local_notifications_cubit.dart';
import 'business_logic/cubit/problem_rating_chart_cubit.dart';
import 'business_logic/cubit/problem_tag_chips_filter_cubit.dart';
import 'business_logic/cubit/problem_tags_chips_cubit.dart';
import 'business_logic/cubit/rating_change_chart_cubit.dart';
import 'business_logic/cubit/rating_change_list_cubit.dart';
import 'business_logic/cubit/submissions_list_cubit.dart';
import 'business_logic/cubit/user_card_cubit.dart';
import 'business_logic/cubit/user_card_details_page_cubit.dart';
import 'business_logic/cubit/users_list_cubit.dart';
import 'views/pages/problems_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initializeTimeZones();

  AndroidInitializationSettings androidSettings =
      const AndroidInitializationSettings("@mipmap/ic_launcher");
  DarwinInitializationSettings iosSettings = const DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestCriticalPermission: true,
    requestSoundPermission: true,
  );
  InitializationSettings initializationSettings = InitializationSettings(
    android: androidSettings,
    iOS: iosSettings,
  );
  localNotificationsPlugin.initialize(initializationSettings);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
          create: (context) => LogoutCubit(),
        ),
        BlocProvider(
          create: (context) => AppInitialisationCubit(),
        ),
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(
          create: (context) => LocalNotificationsCubit(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => UserCardCubit(),
        ),
        BlocProvider(
          create: (context) => UsersListCubit(),
        ),
        BlocProvider(
          create: (context) => AddUserHandleCubit(),
        ),
        BlocProvider(
          create: (context) => RatingChangeListCubit(),
        ),
        BlocProvider(
          create: (context) => RatingChangeChartCubit(),
        ),
        BlocProvider(
          create: (context) => SubmissionsListCubit(),
        ),
        BlocProvider(
          create: (context) => ProblemRatingChartCubit(),
        ),
        BlocProvider(
          create: (context) => ProblemTagsChipsCubit(),
        ),
        BlocProvider(
          create: (context) => ProblemsHeatMapCubit(),
        ),
        BlocProvider(
          create: (context) => UserStatsCubit(),
        ),
        BlocProvider(
          create: (context) => UserCardDetailsPageCubit(),
        ),
        BlocProvider(
          create: (context) => ContestsListCubit(),
        ),
        BlocProvider(
          create: (context) => SubmissionCodeViewerCubit(),
        ),
        BlocProvider(
          create: (context) => ContestStandingsCubit(),
        ),
        BlocProvider(
          create: (context) => ProblemTagChipsFilterCubit(),
        ),
        BlocProvider(
          create: (context) => ProblemsListCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CF Buddy',
        onGenerateRoute: onGenerateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        initialRoute: '/',
        // home: const CounterPage(title: "title"),
        // home: const ProblemsPage(),
      ),
    );
  }
}
