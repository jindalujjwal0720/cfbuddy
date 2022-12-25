import 'package:bloc1/business_logic/cubit/problems_list_cubit.dart';
import 'package:bloc1/views/pages/homepage.dart';
import 'package:bloc1/views/pages/initialisation_page.dart';
import 'package:bloc1/views/pages/problems_page.dart';
import 'package:bloc1/views/pages/user_detail_page.dart';
import 'package:bloc1/views/pages/welcome_page.dart';
import 'package:bloc1/views/widgets/components/bottom_navigation_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
          builder: (context) => const InitialisationPage());
    case '/welcome':
      return MaterialPageRoute(builder: (context) => WelcomePage());
    case '/home':
      return MaterialPageRoute(
          builder: (context) => HomeBottomNavigationWidget(
                [
                  const HomePage(),
                  Builder(builder: (context) {
                    BlocProvider.of<ProblemsListCubit>(context)
                        .makeProblemsList([]);
                    return const ProblemsPage();
                  }),
                ],
              ));
    case '/userDetails':
      final String handle = (settings.arguments! as Map)["handle"];
      return MaterialPageRoute(builder: (context) => UserDetailPage(handle));
    default:
      return MaterialPageRoute(builder: (context) => WelcomePage());
  }
}
