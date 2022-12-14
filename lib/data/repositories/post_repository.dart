import 'package:bloc1/data/dataproviders/post_provider.dart';

import '../models/post_model.dart';

abstract class PostRepository {
  Future<PostModel> getPostWithUID(String uid);
  Future<bool> deletePostWithUID(String uid);
  Future<List<PostModel>> getAllPosts();
}

class PostRepositoryImpl implements PostRepository {
  @override
  Future<PostModel> getPostWithUID(String uid) async {
    final postJSON = await PostProviderImpl().fetchPostWithUID(uid);
    final post = PostModel.fromJson(postJSON);
    fakeData.add(post);
    return post;
  }

  @override
  Future<bool> deletePostWithUID(String uid) async {
    int index = fakeData.length - 1;
    if (index == -1) {
      return false;
    } else {
      fakeData.removeAt(index);
      return true;
    }
  }

  @override
  Future<List<PostModel>> getAllPosts() async {
    final postJSON = await PostProviderImpl().fetchPostWithUID("");
    final post = PostModel.fromJson(postJSON);
    fakeData.add(post);
    return fakeData;
  }
}

List<PostModel> fakeData = [
  const PostModel(
    uid: "ehafua48oaurvbv478vnq",
    title: "Demo",
    description: "This is a demo post which will be served from the internet",
    institute: "institute",
    timestamp: 1670290850271,
    tags: ["demoTag", "firstPost"],
    supportCount: 0,
    resistanceCount: 0,
    wasEdited: false,
    flagged: false,
    reported: false,
  ),
  const PostModel(
    uid: "ehafua48oaurvdfvhbv478vnq",
    title: "We want a shrubbery!! This is a long title but less than limit",
    description: "This is a demo post which will be served from the internet",
    institute: "institute",
    timestamp: 1670290850271,
    tags: ["sample", "nextPost"],
    supportCount: 0,
    resistanceCount: 0,
    wasEdited: false,
    flagged: false,
    reported: false,
  ),
  const PostModel(
    uid: "ehafua48drdvoaurvbv478vnq",
    title: "Lets devolop something useful!",
    description:
        "This is a demo post of the real post which will be served from the internet",
    institute: "institute",
    timestamp: 1670290850271,
    tags: ["whatToBuild", "admin"],
    supportCount: 0,
    resistanceCount: 0,
    wasEdited: true,
    flagged: false,
    reported: false,
  ),
];
