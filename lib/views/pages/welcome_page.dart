import 'package:bloc1/business_logic/AppRouter/navigation_cubit.dart';
import 'package:bloc1/business_logic/cubit/add_user_handle_cubit.dart';
import 'package:bloc1/views/widgets/components/snackbars_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationCubit, NavigationState>(
      listener: (context, state) {
        if (state is NavigateToHomePage) {
          Navigator.of(context).pushReplacementNamed('/home');
        } else if (state is NavigateToInitialisationPage) {
          Navigator.of(context).pushReplacementNamed('/');
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 100.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      "assets/cflogo.png",
                      height: 36,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text(
                        "CF Buddy",
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xffeceff8),
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.blueGrey[50]!, width: 1.0),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      label: Text('Handle'),
                    ),
                    controller: inputController,
                  ),
                ),
              ),
              BlocConsumer<AddUserHandleCubit, AddUserHandleState>(
                  listener: (context, state) {
                if (state is AddUserHandleError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const CustomSnackbars()
                          .errorSnackbar("Enter a valid handle"));
                } else if (state is AddUserHandleLoaded) {
                  BlocProvider.of<NavigationCubit>(context)
                      .navigateToInitialisationPage();
                }
              }, builder: (context, state) {
                if (state is AddUserHandleLoading) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const CircularProgressIndicator.adaptive(),
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextButton(
                      onPressed: () {
                        BlocProvider.of<AddUserHandleCubit>(context)
                            .addUser(inputController.text);
                      },
                      child: const Text('Enter'),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
