import 'package:bloc1/business_logic/cubit/rating_change_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'components/empty_states.dart';

class RatingChangeListWidget extends StatelessWidget {
  final double height;
  const RatingChangeListWidget(this.height, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingChangeListCubit, RatingChangeListState>(
      builder: (context, state) {
        if (state is RatingChangeListLoaded) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(6.0, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 8, 6, 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(
                        width: 220,
                        child: Text(
                          "Contest",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Text(
                          "Change",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: height),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.ratingChanges.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        left: BorderSide(
                                  color: (state.ratingChanges[index].newRating -
                                              state.ratingChanges[index]
                                                  .oldRating >=
                                          0)
                                      ? Colors.green
                                      : Colors.red,
                                  width: 2,
                                ))),
                                child: FittedBox(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 280,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state.ratingChanges[index]
                                                    .contestName,
                                                softWrap: true,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Text(
                                                DateFormat('yMMMMd').format(
                                                  DateTime.fromMillisecondsSinceEpoch(
                                                      state.ratingChanges[index]
                                                              .ratingUpdateTimeSeconds *
                                                          1000),
                                                ),
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black45,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: (state.ratingChanges[index]
                                                        .newRating -
                                                    state.ratingChanges[index]
                                                        .oldRating >=
                                                0)
                                            ? Text(
                                                "${state.ratingChanges[index].newRating - state.ratingChanges[index].oldRating}",
                                                style: const TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : Text(
                                                "${state.ratingChanges[index].newRating - state.ratingChanges[index].oldRating}",
                                                style: const TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is RatingChangeListError) {
          return Text("Error: ${state.message}");
        } else {
          return const EmptyStates().emptyRatingChangeList();
        }
      },
    );
  }
}
