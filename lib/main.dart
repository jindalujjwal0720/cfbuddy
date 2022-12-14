import 'package:bloc1/business_logic/AppRouter/app_router.dart';
import 'package:bloc1/business_logic/cubit/app_cubit.dart';
import 'package:bloc1/business_logic/cubit/app_initialisation_cubit.dart';
import 'package:bloc1/business_logic/cubit/logout_cubit.dart';
import 'package:bloc1/business_logic/cubit/problems_heat_map_cubit.dart';
import 'package:bloc1/business_logic/cubit/user_stats_cubit.dart';
import 'package:bloc1/views/screens/counter_bloc_demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc1/business_logic/cubit/counter_cubit.dart';

import 'business_logic/AppRouter/navigation_cubit.dart';
import 'business_logic/cubit/add_user_handle_cubit.dart';
import 'business_logic/cubit/problem_rating_chart_cubit.dart';
import 'business_logic/cubit/problem_tags_chips_cubit.dart';
import 'business_logic/cubit/rating_change_chart_cubit.dart';
import 'business_logic/cubit/rating_change_list_cubit.dart';
import 'business_logic/cubit/submissions_list_cubit.dart';
import 'business_logic/cubit/user_card_cubit.dart';
import 'business_logic/cubit/user_card_details_page_cubit.dart';
import 'business_logic/cubit/users_list_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: onGenerateRoute,
        // routes: {
        //   '/': (context) => const HomePage(),
        //   '/userDetails': (context) => const UserDetailPage("jindalujjwal"),
        // },
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        initialRoute: '/',
        // home: const UserDetailPage("leafpetal"),
        // home: const CounterPage(title: "title"),
        // home: const WelcomePage(),
      ),
    );
  }
}
