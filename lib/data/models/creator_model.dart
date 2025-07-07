import '../../domain/entities/creator_entity.dart';

class CreatorModel extends CreatorEntity {
  const CreatorModel({
    required super.username,
    required super.avatar,
    required super.artworks,
    required super.ranking,
  });
  
  factory CreatorModel.fromJson(Map<String, dynamic> json) {
    return CreatorModel(
      username: json['username'],
      avatar: json['avatar'],
      artworks: json['artworks'],
      ranking: json['ranking'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'avatar': avatar,
      'artworks': artworks,
      'ranking': ranking,
    };
  }
}
