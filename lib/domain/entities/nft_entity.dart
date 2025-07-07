class NFTEntity {
  final String id;
  final String title;
  final String artist;
  final String image;
  final double currentBid;
  final List<String>? ownerAvatars;
  
  const NFTEntity({
    required this.id,
    required this.title,
    required this.artist,
    required this.image,
    required this.currentBid,
    this.ownerAvatars,
  });
}
