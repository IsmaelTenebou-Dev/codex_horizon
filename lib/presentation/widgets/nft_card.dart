import 'package:flutter/material.dart';
import '../../domain/entities/nft_entity.dart';
import '../../core/nft_theme.dart';

class NFTCard extends StatelessWidget {
  final NFTEntity nft;
  final VoidCallback? onPlaceBid;
  final VoidCallback? onFavorite;
  
  const NFTCard({
    Key? key,
    required this.nft,
    this.onPlaceBid,
    this.onFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Fixed height container to match grid layout
      height: 250,
     
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: NFTTheme.secondaryBackground,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section with fixed height
          Expanded(
            flex: 3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // NFT Image with padding
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      nft.image,
                      fit: BoxFit.cover,
                      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                        if (frame != null || wasSynchronouslyLoaded) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(color: NFTTheme.primaryBlue),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image_not_supported, color: NFTTheme.greyText, size: 30),
                              const SizedBox(height: 4),
                              Text('Image unavailable', style: TextStyle(color: NFTTheme.greyText, fontSize: 12)),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                
                // Favorite button - positioned inside the image padding
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: onFavorite,
                        customBorder: const CircleBorder(),
                        child: Icon(
                          Icons.favorite_border_rounded,
                          color: NFTTheme.primaryBlue,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // NFT Details section with fixed height
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Avatars
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Title with limited width
                      Expanded(
                        child: Text(
                          nft.title,
                          style: NFTTheme.titleStyle.copyWith(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      
                      // Owner avatars - handle overflow
                      if (nft.ownerAvatars != null && nft.ownerAvatars!.isNotEmpty)
                        SizedBox(
                          width: 60,
                          height: 24,
                          child: Stack(
                            children: [
                              for (int i = 0; i < (nft.ownerAvatars!.length > 3 ? 3 : nft.ownerAvatars!.length); i++)
                                Positioned(
                                  right: i * 16.0,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(nft.ownerAvatars![i]),
                                  ),
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  
                  // Artist name
                  Text(
                    'By ${nft.artist}',
                    style: TextStyle(color: NFTTheme.greyText, fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Divider
                  Divider(height: 1, color: Colors.grey.withOpacity(0.2)),
                  
                  const SizedBox(height: 8),
                  
                  // Price and Bid button
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Current bid info
                        Text(
                          'Current Bid ${nft.currentBid.toStringAsFixed(2)} ETH',
                          style: TextStyle(color: NFTTheme.greyText, fontSize: 12),
                        ),
                        
                        
                        // Place bid button
                        ElevatedButton(
                          onPressed: onPlaceBid,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: NFTTheme.primaryBlue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            minimumSize: const Size(80, 32),
                          ),
                          child: const Text(
                            'Place Bid',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
