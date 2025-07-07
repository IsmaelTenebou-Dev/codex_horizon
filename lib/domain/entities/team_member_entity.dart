class TeamMemberEntity {
  final String name;
  final String role;
  final String? avatar;
  
  const TeamMemberEntity({
    required this.name,
    required this.role,
    this.avatar,
  });
}
