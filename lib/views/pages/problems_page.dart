import 'package:bloc1/business_logic/cubit/problem_tag_chips_filter_cubit.dart';
import 'package:bloc1/business_logic/cubit/problems_list_cubit.dart';
import 'package:bloc1/utils/app_theme.dart';
import 'package:bloc1/views/widgets/components/appbar_custom.dart';
import 'package:bloc1/views/widgets/problem_list_ratings_analysis_widget.dart';
import 'package:bloc1/views/widgets/problem_tags_filter_widget.dart';
import 'package:bloc1/views/widgets/problems_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProblemsPage extends StatelessWidget {
  const ProblemsPage({super.key});
  Future<void> initialiseProblemsPage(BuildContext context) async {
    BlocProvider.of<ProblemsListCubit>(context).makeProblemsList([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Problems"),
      backgroundColor: CustomAppTheme().bgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: const ProblemTagChipsFilterWidget(),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              child: Text(
                "Rating distribution",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: const ProblemsRatingsAnalysisWidget(),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              child: Text(
                "Problems (Latest 100)",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: const ProblemsListWidget(),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
