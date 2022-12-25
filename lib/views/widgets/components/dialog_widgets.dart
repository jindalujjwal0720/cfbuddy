import 'package:bloc1/business_logic/cubit/add_user_handle_cubit.dart';
import 'package:bloc1/business_logic/cubit/app_initialisation_cubit.dart';
import 'package:bloc1/business_logic/cubit/users_list_cubit.dart';
import 'package:bloc1/utils/app_theme.dart';
import 'package:bloc1/views/widgets/contest_standings_widget.dart';
import 'package:bloc1/views/widgets/submission_code_viewer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageDialog extends StatelessWidget {
  final ImageProvider image;

  const ImageDialog(this.image, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetAnimationCurve: Curves.easeOut,
      insetAnimationDuration: const Duration(milliseconds: 100),
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InputDialog extends StatelessWidget {
  InputDialog({Key? key}) : super(key: key);
  final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetAnimationCurve: Curves.easeOut,
      insetAnimationDuration: const Duration(milliseconds: 100),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: AspectRatio(
          aspectRatio: 3 / 2,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                      border:
                          Border.all(color: Colors.blueGrey[50]!, width: 1.0),
                    ),
                    child: TextFormField(
                      autofocus: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text('Handle'),
                      ),
                      controller: inputController,
                    ),
                  ),
                ),
                BlocBuilder<AddUserHandleCubit, AddUserHandleState>(
                    builder: (context, state) {
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
                              .addFriend(inputController.text)
                              .then((value) =>
                                  BlocProvider.of<UsersListCubit>(context)
                                      .makeUsersList());
                        },
                        child: const Text('Add'),
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      insetAnimationCurve: Curves.easeOut,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 20.0, bottom: 4.0),
                          child: Icon(
                            Icons.delete_forever_outlined,
                            size: 32.0,
                            color: Colors.red[400],
                          ),
                        ),
                        Text(
                          "Are you sure ?",
                          style: TextStyle(
                            color: Colors.red[400],
                            fontSize: 16.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                    color: CustomAppTheme().bgColor,
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 4.0),
                        child: Text(
                            "This will permanently delete your preferences."),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  height: 40,
                                  child: Center(
                                      child: Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.grey[800]),
                                  )),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                        Border.all(color: Colors.grey[300]!),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  BlocProvider.of<AppInitialisationCubit>(
                                          context)
                                      .deleteUserData()
                                      .then((value) {
                                    Navigator.pushReplacementNamed(
                                        context, "/");
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  child: const Center(
                                      child: Text(
                                    "Yes",
                                    style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 0.6),
                                  )),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.red[400],
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SubmissionCodeViewerDialog extends StatelessWidget {
  const SubmissionCodeViewerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
        ),
        child: const SubmissionCodeViewerWidget(600),
      ),
    );
  }
}

class ContestStandingsDialog extends StatelessWidget {
  const ContestStandingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
        ),
        child: const ContestStandingsWidget(600),
      ),
    );
  }
}
