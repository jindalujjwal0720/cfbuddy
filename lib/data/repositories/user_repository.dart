import 'dart:convert';
import 'package:bloc1/data/dataproviders/user_provider.dart';
import 'package:bloc1/data/models/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getUsersDetails(List<String> handles);
}

class UserRepositoryImpl implements UserRepository {
  @override
  Future<List<UserModel>> getUsersDetails(List<String> handles) async {
    List<UserModel> result = [];
    if (handles.isEmpty) return result;
    String json = await UserProviderImpl().fetchUsersDetails(handles);
    final object = jsonDecode(json)["result"];
    for (var obj in object) {
      result.add(UserModel.fromMap(obj));
    }
    return result;
  }
}
