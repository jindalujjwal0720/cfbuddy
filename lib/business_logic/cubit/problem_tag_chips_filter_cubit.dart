import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'problem_tag_chips_filter_state.dart';

class ProblemTagChipsFilterCubit extends Cubit<ProblemTagChipsFilterState> {
  ProblemTagChipsFilterCubit()
      : super(const ProblemTagChipsFilterInitial(tagsList, []));

  Future<void> changeSelection({String tag = ""}) async {
    List<String> alreadySelectedTags = [];
    alreadySelectedTags.addAll(state.selectedTags);
    alreadySelectedTags = alreadySelectedTags.toSet().toList();
    emit(ProblemTagChipsFilterInitial(tagsList, alreadySelectedTags));
    if (tag.isNotEmpty) {
      if (alreadySelectedTags.contains(tag)) {
        alreadySelectedTags.remove(tag);
      } else {
        alreadySelectedTags.add(tag);
      }
    }
    emit(ProblemTagChipsFilterSelectionChanged(tagsList, alreadySelectedTags));
  }
}

const tagsList = <String>[
  "*special",
  "2-sat",
  "binary search",
  "bitmask",
  "bruteforce",
  "chinese remainder theorem",
  "combinatorics",
  "constructive algorithms",
  "data structures",
  "dfs and similar",
  "divide and conquer",
  "dp",
  "dsu",
  "expression parsing",
  "fft",
  "flows",
  "games",
  "geometry",
  "graphs",
  "graph matchings",
  "greedy",
  "hashing",
  "impmelementation",
  "interactive",
  "math",
  "matrices",
  "meet-in-the-middle",
  "number theory",
  "probabilities",
  "schedules",
  "shortest paths",
  "sortings",
  "strings",
  "string suffix structures",
  "trees",
  "two pointers",
  "ternary search",
];
