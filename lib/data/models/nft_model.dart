import '../../domain/entities/nft_entity.dart';

class NFTModel extends NFTEntity {
  const NFTModel({
    required super.id,
    required super.title,
    required super.artist,
    required super.image,
    required super.currentBid,
    super.ownerAvatars,
  });
  
  factory NFTModel.fromJson(Map<String, dynamic> json) {
    return NFTModel(
      id: json['id'],
      title: json['title'],
      artist: json['artist'],
      image: json['image'],
      currentBid: json['current_bid'].toDouble(),
      ownerAvatars: json['owner_avatars'] != null 
        ? List<String>.from(json['owner_avatars'])
        : null,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'image': image,
      'current_bid': currentBid,
      'owner_avatars': ownerAvatars,
    };
  }
}
