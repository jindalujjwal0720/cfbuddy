import 'package:bloc1/business_logic/AppRouter/navigation_cubit.dart';
import 'package:bloc1/business_logic/cubit/app_initialisation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialisationPage extends StatelessWidget {
  const InitialisationPage({super.key});

  Future<void> initialise(BuildContext context) async {
    await BlocProvider.of<AppInitialisationCubit>(context).initialiseApp();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationCubit, NavigationState>(
      listener: (context, state) {
        if (state is NavigateToWelcomePage) {
          Navigator.of(context).pushReplacementNamed("/welcome");
        } else if (state is NavigateToHomePage) {
          Navigator.of(context).pushReplacementNamed("/home");
        }
      },
      child: BlocListener<AppInitialisationCubit, AppInitialisationState>(
        listener: (context, state) {
          if (state is AppInitialisationAuthFailed) {
            BlocProvider.of<NavigationCubit>(context).navigateToWelcomePage();
          } else if (state is AppInitialisationLoaded) {
            BlocProvider.of<NavigationCubit>(context).navigateToHomePage();
          }
        },
        child: Builder(builder: (context) {
          initialise(context);
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator.adaptive(),
                  Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Text(
                      "Initialising app for better experience...",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
