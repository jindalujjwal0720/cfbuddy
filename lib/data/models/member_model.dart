// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';

class MemberModel extends Equatable {
  final String handle;
  const MemberModel({
    required this.handle,
  });

  MemberModel copyWith({
    String? handle,
  }) {
    return MemberModel(
      handle: handle ?? this.handle,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'handle': handle,
    };
  }

  factory MemberModel.fromMap(Map<String, dynamic> map) {
    return MemberModel(
      handle: map['handle'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MemberModel.fromJson(String source) => MemberModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [handle];
}
