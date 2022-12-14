import 'package:bloc1/data/models/post_model.dart';
import 'package:bloc1/utils/helper_functions_ans_widgets.dart';
import 'package:flutter/material.dart';

import 'components/post_components.dart';

class PostWidget extends StatelessWidget {
  final PostModel post;
  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  post.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              IconButton(
                padding: const EdgeInsets.all(0),
                iconSize: 22.0,
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz,
                  color: Colors.black38,
                ),
                tooltip: "More Options",
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 2.0, 3.0, 8.0),
                child: Text(
                  createDateTimeFromTimeStamp(post.timestamp),
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                  ),
                ),
              ),
              if (post.wasEdited == true)
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 2.0, 3.0, 8.0),
                  child: Text(
                    "\u00b7 edited",
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
            ],
          ),
          Text(
            post.description,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (var x in post.tags) tagChip(x),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.handshake_outlined,
                  color: Colors.black38,
                  size: 24.0,
                ),
                tooltip: "Support",
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.comment_outlined,
                  color: Colors.black38,
                  size: 22.0,
                ),
                tooltip: "Comments",
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ],
          )
        ],
      ),
    );
  }
}
