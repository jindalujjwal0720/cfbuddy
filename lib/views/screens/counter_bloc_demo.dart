import 'package:bloc1/business_logic/cubit/post_list_cubit.dart';
import 'package:bloc1/data/repositories/problems_repository.dart';
import 'package:bloc1/utils/app_theme.dart';
import 'package:bloc1/utils/helper_functions_ans_widgets.dart';
import 'package:bloc1/views/widgets/components/dialog_widgets.dart';
import 'package:bloc1/views/widgets/problem_list_ratings_analysis_widget.dart';
import 'package:bloc1/views/widgets/problems_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc1/business_logic/cubit/counter_cubit.dart';
import 'package:html/dom_parsing.dart';
import 'package:html/parser.dart';

import '../widgets/problem_tags_filter_widget.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: CustomAppTheme().bgColor,
      body: SingleChildScrollView(
        child: FutureBuilder(
            // future:
            //     ProblemsRepositoryImpl().getProblemStatementByID(1774, "F2"),
            // future: BlocProvider.of<SubmissionsListCubit>(context)
            //     .makeSubmissionsList("jindalujjwal", date: DateTime.now()),
            // future: BlocProvider.of<ProblemsHeatMapCubit>(context)
            //     .makeHeatMap("leafpetal"),
            // future: BlocProvider.of<RatingChangeListCubit>(context)
            //     .makeRatingChangeList("leafpetal"),
            // future: BlocProvider.of<SubmissionCodeViewerCubit>(context)
            //     .makeSubmissionCodeDialog(const SubmissionModel(
            //         186149876,
            //         1763,
            //         0,
            //         0,
            //         "GNU g++",
            //         "OK",
            //         "",
            //         0,
            //         0,
            //         0,
            //         ProblemModel(
            //             name: "XOR = Average",
            //             index: "A",
            //             tags: ["xor", "math", "*1200"]))),

            builder: (context, AsyncSnapshot<String> snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // BlocBuilder<PostListCubit, PostListState>(
                  //   builder: ((context, state) {
                  //     if (state is PostListInitial) {
                  //       return const Text("Post List Initial");
                  //     } else if (state is PostListLoading) {
                  //       return const CircularProgressIndicator();
                  //     } else if (state is PostListLoaded) {
                  //       return ListView.builder(
                  //         shrinkWrap: true,
                  //         physics: const NeverScrollableScrollPhysics(),
                  //         itemCount: state.posts.length,
                  //         itemBuilder: (context, index) =>
                  //             PostWidget(post: state.posts[index]),
                  //       );
                  //     }
                  //     return const Text("Hi there! From Post Bloc Builder.");
                  //   }),
                  // ),
                  // const UserCardWidget("tourist"),
                  // const UsersListWidget(
                  //     ["leafpetal", "jindalujjwal", "hello", "tourist"]),
                  // const RatingChangeChart(["leafpetal", "jindalujjwal"]),
                  // const RatingChangeListWidget(300),
                  // const UserCardWidget("leafpetal"),
                  // const UserCardWidget("jindalujjwal"),
                  // const SubmissionsListWidget(300),
                  // const UsersComparisonWidget("jindalujjwal", "leafpetal"),
                  // Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  //   child: Container(
                  //     child: const ProblemRatingsChartWidget("jindalujjwal"),
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(18.0),
                  //     ),
                  //   ),
                  // ),

                  // Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  //   child: Container(
                  //     // child: const ProblemsHeatMap(),
                  //     // child: const UsersStatisticsWidget(),
                  //     child: const ProblemTagChipsFilterWidget(),
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(18.0),
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  //   child: Container(
                  //     child: const ProblemsRatingsAnalysisWidget(),
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(18.0),
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  //   child: Container(
                  //     child: const ProblemsListWidget(),
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(18.0),
                  //     ),
                  //   ),
                  // ),
                  // const ContestsListWidget(),
                  // Container(
                  //   padding: const EdgeInsets.all(8.0),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(12.0),
                  //     color: Colors.white,
                  //   ),
                  //   child: const SubmissionCodeViewerWidget(600),
                  // ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const SubmissionCodeViewerDialog();
                                });
                          },
                          tooltip: 'Remove Post',
                          child: const Icon(Icons.remove),
                        ),
                        FloatingActionButton(
                          onPressed: () =>
                              BlocProvider.of<PostListCubit>(context)
                                  .getAllPosts(),
                          tooltip: 'Add Post',
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  BlocConsumer<CounterCubit, CounterState>(
                    listener: (context, state) {
                      if (state.wasIncremented == true) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Incremented"),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.green,
                        ));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Decremented"),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                    builder: (context, state) {
                      return Text(
                        '${state.counterValue}',
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FloatingActionButton(
                        onPressed: () =>
                            BlocProvider.of<CounterCubit>(context).decrement(),
                        tooltip: 'Decrement',
                        child: const Icon(Icons.remove),
                      ),
                      FloatingActionButton(
                        onPressed: () =>
                            BlocProvider.of<CounterCubit>(context).increment(),
                        tooltip: 'Increment',
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
