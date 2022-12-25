import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc1/data/models/problem_model.dart';
import 'package:bloc1/data/repositories/problems_repository.dart';
import 'package:equatable/equatable.dart';

part 'problems_list_state.dart';

class ProblemsListCubit extends Cubit<ProblemsListState> {
  ProblemsListCubit() : super(ProblemsListInitial());

  Future<void> makeProblemsList(List<String> tags) async {
    emit(ProblemsListLoading());
    List<ProblemModel> problems;
    problems = await ProblemsRepositoryImpl().getProblemsList(tags);
    problems = problems.sublist(0, min(100, problems.length));
    problems.sort((a, b) => a.rating!.compareTo(b.rating!));
    Map<int, int> ratings = {};
    for (var problem in problems) {
      if (problem.rating != null) {
        if (ratings.containsKey(problem.rating)) {
          ratings[problem.rating!] = ratings[problem.rating!]! + 1;
        } else {
          ratings[problem.rating!] = 1;
        }
      }
    }
    List<int> distinctRatings = [], countOfRatings = [];
    ratings.forEach(
      (key, value) {
        distinctRatings.add(key);
        countOfRatings.add(value);
      },
    );
    emit(ProblemsListLoaded(problems, distinctRatings, countOfRatings));
  }

  Future<void> sortProblemsList(ProblemsListLoaded state,
      {bool ascending = true,
      bool byIndex = false,
      bool byRating = false,
      bool bySolved = false}) async {
    List<ProblemModel> problems = state.problems;
    emit(ProblemsListLoading());
    if (byIndex) {
      if (ascending) {
        problems.sort((a, b) => a.index.compareTo(b.index));
      } else {
        problems.sort((a, b) => b.index.compareTo(a.index));
      }
    }
    if (byRating) {
      if (ascending) {
        problems.sort((a, b) => a.rating!.compareTo(b.rating!));
      } else {
        problems.sort((a, b) => b.rating!.compareTo(a.rating!));
      }
    }
    if (bySolved) {
      if (ascending) {
        problems.sort((a, b) => a.solvedCount!.compareTo(b.solvedCount!));
      } else {
        problems.sort((a, b) => b.solvedCount!.compareTo(a.solvedCount!));
      }
    }
    emit(ProblemsListLoaded(problems, state.ratings, state.countOfRatings));
  }
}
