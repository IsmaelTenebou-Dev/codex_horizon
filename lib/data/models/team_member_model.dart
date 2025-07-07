import '../../domain/entities/team_member_entity.dart';

class TeamMemberModel extends TeamMemberEntity {
  const TeamMemberModel({
    required super.name,
    required super.role,
    super.avatar,
  });
  
  factory TeamMemberModel.fromJson(Map<String, dynamic> json) {
    return TeamMemberModel(
      name: json['name'],
      role: json['role'],
      avatar: json['avatar'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'role': role,
      'avatar': avatar,
    };
  }
}
