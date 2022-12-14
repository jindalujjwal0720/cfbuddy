import 'package:bloc1/business_logic/AppRouter/navigation_cubit.dart';
import 'package:bloc1/business_logic/cubit/add_user_handle_cubit.dart';
import 'package:bloc1/business_logic/cubit/app_cubit.dart';
import 'package:bloc1/business_logic/cubit/users_list_cubit.dart';
import 'package:bloc1/utils/helper_functions_ans_widgets.dart';
import 'package:bloc1/views/widgets/components/dialog_widgets.dart';
import 'package:bloc1/views/widgets/components/empty_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class UsersListWidget extends StatelessWidget {
  const UsersListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersListCubit, UsersListState>(
      builder: (context, state) {
        if (state is UsersListLoaded) {
          if (state.users.isEmpty) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                BlocProvider.of<AddUserHandleCubit>(context).getInput();
              },
              child: Container(
                padding: const EdgeInsets.all(14.0),
                child: Center(
                    child: Text(
                  "Add Friends",
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                )),
              ),
            );
          }
          return Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    endActionPane: ActionPane(
                      extentRatio: 1 / 4,
                      motion: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 4.0),
                        child: GestureDetector(
                          onTap: () {
                            BlocProvider.of<UsersListCubit>(context)
                                .removeUserFromList(state.users[index].handle);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Center(
                                child: Icon(
                              Icons.delete_outline_rounded,
                              color: Colors.white,
                            )),
                          ),
                        ),
                      ),
                      children: const [],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await showDialog(
                                  context: context,
                                  builder: (_) => ImageDialog(NetworkImage(
                                      state.users[index].titlePhotoURL)));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(8.0),
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        state.users[index].titlePhotoURL),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                BlocProvider.of<AppCubit>(context)
                                    .generateUserDetailsPage();
                                BlocProvider.of<NavigationCubit>(context)
                                    .navigateToUserDetailsPage(
                                        handle: state.users[index].handle);
                              },
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 8, 4, 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          state.users[index].handle,
                                          style: const TextStyle(
                                            letterSpacing: 0.5,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          state.users[index].rank,
                                          style: TextStyle(
                                            letterSpacing: 0.3,
                                            color: codeforcesColorScheme(
                                                state.users[index].rating),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: Center(
                              child: Text(
                                "${state.users[index].rating}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        } else if (state is UsersListError) {
          return Text("Error: ${state.message}");
        } else {
          return const EmptyStates().emptyUsersList();
        }
      },
    );
  }
}
