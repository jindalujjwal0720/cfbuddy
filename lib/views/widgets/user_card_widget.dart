import 'package:bloc1/business_logic/cubit/user_card_cubit.dart';
import 'package:bloc1/utils/helper_functions_ans_widgets.dart';
import 'package:bloc1/views/widgets/components/empty_states.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/dialog_widgets.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCardCubit, UserCardState>(
      builder: (context, state) {
        if (state is UserCardLoaded) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12.0, 8, 8, 8),
                        child: GestureDetector(
                          onTap: () async {
                            await showDialog(
                                context: context,
                                builder: (_) => ImageDialog(
                                    NetworkImage(state.user.titlePhotoURL)));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: (Colors.blueGrey[100])!),
                              image: DecorationImage(
                                  image: NetworkImage(state.user.titlePhotoURL),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 24, 8, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Rating",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                "${state.user.rating}",
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 24, 8, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Max Rating",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                "${state.user.maxRating}",
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 24, 8, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Max Rank",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: SizedBox(
                                width: 100,
                                child: Text(
                                  state.user.maxRank,
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 2.0),
                          child: Text(
                            state.user.handle,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(18, 0, 0, 8),
                          child: Text(
                            state.user.rank,
                            style: TextStyle(
                              color: codeforcesColorScheme(state.user.rating),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 2, 8, 2),
                          child: Text(
                            "Joined",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(18, 0, 8, 8),
                          child: Text(
                            DateFormat("yMMMMd").format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  state.user.registrationTimeSeconds * 1000),
                            ),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blueGrey[300],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(16.0, 0, 4, 16),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (DateFormat("yMMMMd").format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      state.user.lastOnlineTimeSeconds * 1000),
                                ) ==
                                DateFormat("yMMMMd").format(
                                  DateTime.now(),
                                ))
                            ? Colors.green
                            : Colors.blueGrey[200],
                        border: Border.all(color: (Colors.blueGrey[500])!),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                      child: Text(
                        "Last Online: ${DateFormat("yMMMMd").format(
                          DateTime.fromMillisecondsSinceEpoch(
                              state.user.lastOnlineTimeSeconds * 1000),
                        )}",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blueGrey[300],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else if (state is UserCardLoading) {
          return const EmptyStates().emptyUserCard();
        } else {
          return Text("Error: $state");
        }
      },
    );
  }
}
