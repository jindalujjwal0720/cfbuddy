// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:bloc1/data/models/member_model.dart';

class PartyModel extends Equatable {
  final int contestId;
  final List<MemberModel> members;
  const PartyModel({
    required this.contestId,
    required this.members,
  });

  PartyModel copyWith({
    int? contestId,
    List<MemberModel>? members,
  }) {
    return PartyModel(
      contestId: contestId ?? this.contestId,
      members: members ?? this.members,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'contestId': contestId,
      'members': members.map((x) => x.toMap()).toList(),
    };
  }

  factory PartyModel.fromMap(Map<String, dynamic> map) {
    return PartyModel(
      contestId: map['contestId'] as int,
      members: List<MemberModel>.from(
        (map['members']).map<MemberModel>(
          (x) => MemberModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PartyModel.fromJson(String source) =>
      PartyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [contestId, members];
}
