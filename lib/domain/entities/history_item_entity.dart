class HistoryItemEntity {
  final String id;
  final String title;
  final String image;
  final double price;
  final String timeAgo;
  
  const HistoryItemEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.timeAgo,
  });
}
