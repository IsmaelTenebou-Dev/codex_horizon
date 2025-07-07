import 'package:flutter/material.dart';
import '../../domain/entities/history_item_entity.dart';
import '../../core/nft_theme.dart';

class HistoryItemCard extends StatelessWidget {
  final HistoryItemEntity historyItem;
  
  const HistoryItemCard({
    Key? key,
    required this.historyItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // NFT Thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              historyItem.image,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: 40,
                  height: 40,
                  color: NFTTheme.cardBackground,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                          : null,
                      strokeWidth: 2,
                      color: NFTTheme.primaryBlue,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 40,
                  height: 40,
                  color: NFTTheme.cardBackground,
                  child: Icon(Icons.image_not_supported, color: NFTTheme.greyText, size: 20),
                );
              },
            ),
          ),
          
          const SizedBox(width: 12),
          
          // NFT Title and Time
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  historyItem.title,
                  style: NFTTheme.bodyStyle.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  historyItem.timeAgo,
                  style: NFTTheme.smallBodyStyle,
                ),
              ],
            ),
          ),
          
          // Price
          Row(
            children: [
              Icon(
                Icons.monetization_on_outlined,
                color: NFTTheme.whiteText,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                '${historyItem.price.toStringAsFixed(2)} ETH',
                style: NFTTheme.bodyStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
