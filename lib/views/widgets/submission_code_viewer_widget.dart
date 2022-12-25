import 'package:bloc1/business_logic/cubit/submission_code_viewer_cubit.dart';
import 'package:bloc1/utils/helper_functions_ans_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github-gist.dart';

class SubmissionCodeViewerWidget extends StatelessWidget {
  final double height;
  const SubmissionCodeViewerWidget(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubmissionCodeViewerCubit, SubmissionCodeViewerState>(
      builder: (context, state) {
        if (state is SubmissionCodeViewerDialogLoaded) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxHeight: height),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 12.0, left: 8.0, right: 8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${state.submission.problem.index}. ${state.submission.problem.name}",
                              style: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                            submissionVerdictWidget(state.submission.verdict),
                            Text(
                              "${state.submission.timeConsumedMillis} ms",
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 12.0,
                              ),
                            ),
                            Text(
                              memoryToString(
                                  state.submission.memoryConsumedBytes),
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 12.0,
                              ),
                            ),
                            Text(
                              state.submission.programmingLanguage,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  HighlightView(
                    state.formattedCodeString,
                    language: getProgrammingLanguage(
                        state.submission.programmingLanguage),
                    theme: githubGistTheme,
                    textStyle: const TextStyle(
                      fontFamily: "monospace",
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: height),
          child: const Center(child: Text("Loading...")),
        );
      },
    );
  }
}

String getProgrammingLanguage(String lang) {
  String res = "";
  lang = lang.toLowerCase();
  if (lang.contains("gnu") || lang.contains("c++") || lang.contains("clang")) {
    res = "cpp";
  } else if (lang.contains("java")) {
    res = "java";
  } else if (lang.contains("python") || lang.contains("py")) {
    res = "python";
  } else if (lang.contains("javascript")) {
    res = "javascript";
  }
  return res;
}
