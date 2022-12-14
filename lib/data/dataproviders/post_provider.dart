import 'dart:math';

abstract class PostProvider {
  Future<String> fetchPostWithUID(String uid);
}

class PostProviderImpl implements PostProvider {
  @override
  Future<String> fetchPostWithUID(String uid) {
    // Simulate network delay
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        final random = Random();

        // Simulate some network exception
        if (random.nextBool()) {
          throw NetworkException();
        }

        // Return "fetched" Post as a JSON to Post Repository
        return '{"uid": "ehafua48oaurvbv478vnq",'
            '"title": "Demo",'
            '"description": "This is a demo post which will be served from the internet (This post is from Post Provider)",'
            '"institute": "institute",'
            '"timestamp": 1670290850271,'
            '"tags": ['
            '"demoTag",'
            '"firstPost"'
            '],'
            '"supportCount": 0,'
            '"resistanceCount": 0,'
            '"wasEdited": false,'
            '"flagged": false,'
            '"reported": false'
            '}';
      },
    );
  }
}

class NetworkException implements Exception {}
