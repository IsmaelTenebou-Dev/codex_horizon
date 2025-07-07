import 'package:flutter/material.dart';
import '../../domain/entities/creator_entity.dart';
import '../../core/nft_theme.dart';

class CreatorCard extends StatelessWidget {
  final CreatorEntity creator;
  
  const CreatorCard({
    Key? key, 
    required this.creator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // Creator Avatar
          CircleAvatar(
            radius: 16,
            backgroundColor: NFTTheme.cardBackground,
            backgroundImage: NetworkImage(creator.avatar),
            onBackgroundImageError: (exception, stackTrace) {
              // Fallback icon will be shown by the CircleAvatar
            },
            child: creator.avatar.isEmpty ? Icon(Icons.person, size: 16, color: NFTTheme.greyText) : null,
          ),
          
          const SizedBox(width: 12),
          
          // Username and Artworks
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  creator.username,
                  style: NFTTheme.bodyStyle.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${creator.artworks}',
                  style: NFTTheme.smallBodyStyle,
                ),
              ],
            ),
          ),
          
          // Rating Bar
          Container(
            width: 100,
            height: 6,
            decoration: BoxDecoration(
              color: NFTTheme.primaryBlue.withOpacity(0.3),
              borderRadius: BorderRadius.circular(3),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 1 - (creator.ranking / 10), // Normalize to 0-1 range
              child: Container(
                decoration: BoxDecoration(
                  color: NFTTheme.primaryBlue,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
