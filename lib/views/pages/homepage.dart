import 'package:bloc1/business_logic/AppRouter/navigation_cubit.dart';
import 'package:bloc1/business_logic/cubit/add_user_handle_cubit.dart';
import 'package:bloc1/business_logic/cubit/app_cubit.dart';
import 'package:bloc1/business_logic/cubit/logout_cubit.dart';
import 'package:bloc1/business_logic/cubit/user_card_cubit.dart';
import 'package:bloc1/business_logic/cubit/users_list_cubit.dart';
import 'package:bloc1/utils/app_theme.dart';
import 'package:bloc1/views/widgets/components/appbar_custom.dart';
import 'package:bloc1/views/widgets/components/dialog_widgets.dart';
import 'package:bloc1/views/widgets/user_card_widget.dart';
import 'package:bloc1/views/widgets/users_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<void> initialiseHomePage(BuildContext context) async {
    BlocProvider.of<UserCardCubit>(context).makeUserCard();
    BlocProvider.of<UsersListCubit>(context).makeUsersList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationCubit, NavigationState>(
      listener: (context, state) {
        if (state is NavigateToUserDetailsPage) {
          Navigator.of(context).pushNamed('/userDetails',
              arguments: {"handle": state.handle}).then((value) {
            initialiseHomePage(context);
          });
        }
      },
      child: Builder(
        builder: (context) {
          initialiseHomePage(context);
          return Scaffold(
            appBar: customAppBar("Home", actions: [
              BlocListener<LogoutCubit, LogoutState>(
                listener: (context, state) {
                  if (state is LogoutConfirmDialogLoading) {
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (_) => const LogoutConfirmationDialog());
                  }
                },
                child: IconButton(
                  onPressed: () {
                    BlocProvider.of<LogoutCubit>(context).logOutUser();
                  },
                  icon: const Icon(
                    Icons.logout_rounded,
                    color: Colors.black,
                  ),
                  tooltip: "Delete Account and Logout",
                ),
              )
            ]),
            backgroundColor: CustomAppTheme().bgColor,
            // backgroundColor: Colors.grey[200],
            floatingActionButton: SizedBox(
              height: 72,
              width: 72,
              child: FittedBox(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BlocListener<AddUserHandleCubit, AddUserHandleState>(
                      listener: (context, state) {
                        if (state is AddUserHandleDialogLoad) {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (_) => InputDialog(),
                          );
                        } else if (state is AddUserHandleLoaded) {
                          Navigator.pop(context);
                        }
                      },
                      child: FloatingActionButton(
                        onPressed: () {
                          BlocProvider.of<AddUserHandleCubit>(context)
                              .getInput();
                        },
                        child: const Icon(
                          Icons.add_rounded,
                          size: 30,
                        ),
                        tooltip: "Add friend",
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black87,
                        splashColor: Colors.black87,
                        focusColor: Colors.black87,
                      ),
                    )),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        BlocProvider.of<AppCubit>(context)
                            .generateUserDetailsPage();
                        BlocProvider.of<NavigationCubit>(context)
                            .navigateToUserDetailsPage();
                      },
                      child: Padding(
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
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                      child: Text(
                        "Friends",
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
                          child: UsersListWidget(),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18.0),
                          border: Border.all(color: Colors.blueGrey[50]!),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
