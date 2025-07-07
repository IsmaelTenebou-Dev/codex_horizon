import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/nft_theme.dart';
import '../../domain/entities/nft_entity.dart';
// Creator entity is used in the code
import '../viewmodels/nft_marketplace_viewmodel.dart';
import '../widgets/side_menu.dart';
import '../widgets/nft_card.dart';

class NFTMarketplaceView extends StatelessWidget {
  const NFTMarketplaceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NFTMarketplaceViewModel>(context);
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 1100;
    final isTablet = size.width < 1100 && size.width >= 650;

    return Scaffold(
      backgroundColor: NFTTheme.primaryBackground,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Side Menu
          if (isDesktop || isTablet)
            SideMenu(currentRoute: '/nft-marketplace'),

          // Main Content
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top navigation bar
                    _buildHeader(context, isDesktop),
                    
                    const SizedBox(height: 24),
                    
                    // Main content with right sidebar
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left side (Banner, Trending NFTs, Recently Added)
                        Expanded(
                          flex: isDesktop ? 5 : 1, // Reduced flex to make middle section narrower
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Banner
                              _buildBanner(context),
                              
                              const SizedBox(height: 32),
                              
                              // Trending NFTs
                              _buildTrendingNFTs(context, viewModel, isDesktop, isTablet),
                              
                              const SizedBox(height: 32),
                              
                              // Recently Added
                              _buildRecentlyAdded(context, viewModel, isDesktop, isTablet),
                            ],
                          ),
                        ),
                        
                        if (isDesktop) const SizedBox(width: 24),
                        
                        // Right sidebar (Top Creators, History)
                        if (isDesktop)
                          Container(
                            width: 320, // Slightly wider sidebar
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Top Creators card
                                Container(
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
                                  padding: const EdgeInsets.all(16),
                                  child: _buildTopCreators(context, viewModel),
                                ),
                                
                                const SizedBox(height: 24),
                                
                                // History card
                                Container(
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
                                  padding: const EdgeInsets.all(16),
                                  child: _buildHistory(context, viewModel),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Footer
                    _buildFooter(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDesktop) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left: Page title
        Text(
          'NFT Marketplace',
          style: NFTTheme.headingStyle,
        ),
        
        // Right: Search, notifications, profile
        Row(
          children: [
            // Search bar
            Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                color: NFTTheme.secondaryBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                style: TextStyle(color: NFTTheme.whiteText),
                decoration: InputDecoration(
                  hintText: 'Search items, collections...',
                  hintStyle: TextStyle(color: NFTTheme.greyText, fontSize: 12),
                  prefixIcon: Icon(Icons.search, color: NFTTheme.greyText, size: 16),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                ),
              ),
            ),
            
            const SizedBox(width: 16),
            
            // Notifications
            _iconButton(Icons.notifications_none_rounded),
            
            const SizedBox(width: 16),
            
            // Profile
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: NFTTheme.secondaryBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white24,
                    child: const Text('JS'),
                  ),
                  
                  if (isDesktop) ...[
                    const SizedBox(width: 8),
                    Text(
                      'John Smith',
                      style: NFTTheme.bodyStyle,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBanner(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [NFTTheme.primaryBlue, NFTTheme.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          // Left side - Text content
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Trending Collection',
                    style: TextStyle(
                      color: NFTTheme.whiteText,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                
                const SizedBox(height: 16),
                
                Text(
                  'Discover, Collect & Sell Extraordinary NFTs',
                  style: TextStyle(
                    color: NFTTheme.whiteText,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                Text(
                  'Enter in this creative world of NFTs. Discover now the latest collections, buy and sell your NFTs as well as create your own NFT.',
                  style: TextStyle(
                    color: NFTTheme.whiteText.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
                
                const SizedBox(height: 24),
                
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: NFTTheme.whiteText,
                        foregroundColor: NFTTheme.primaryBlue,
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Discover Now'),
                    ),
                    
                    const SizedBox(width: 16),
                    
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: NFTTheme.whiteText,
                      ),
                      child: Row(
                        children: [
                          Text('Watch Video'),
                          const SizedBox(width: 8),
                          Icon(Icons.play_circle_outline, size: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Right side - Decorative image (hidden on smaller screens)
          Expanded(
            flex: 2,
            child: Center(
              child: Image.asset(
                'assets/images/nft_banner.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.image,
                        color: NFTTheme.whiteText,
                        size: 80,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildTrendingNFTs(BuildContext context, NFTMarketplaceViewModel viewModel, bool isDesktop, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with categories
        Row(
          children: [
            Text(
              'Trending NFTs',
              style: NFTTheme.subheadingStyle,
            ),
            const Spacer(),
            for (final category in viewModel.filterCategories)
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: InkWell(
                  onTap: () => viewModel.setSelectedCategory(category),
                  child: Column(
                    children: [
                      Text(
                        category,
                        style: TextStyle(
                          color: viewModel.selectedCategory == category
                              ? NFTTheme.whiteText
                              : NFTTheme.greyText,
                          fontWeight: viewModel.selectedCategory == category
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (viewModel.selectedCategory == category)
                        Container(
                          height: 2,
                          width: 32,
                          color: NFTTheme.primaryBlue,
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        
        const SizedBox(height: 16),
        
        // NFT Cards Grid
        _buildNFTGrid(context, viewModel.trendingNfts, isDesktop, isTablet),
      ],
    );
  }
  
  Widget _buildRecentlyAdded(BuildContext context, NFTMarketplaceViewModel viewModel, bool isDesktop, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recently Added',
          style: NFTTheme.subheadingStyle,
        ),
        
        const SizedBox(height: 16),
        
        // NFT Cards Grid
        _buildNFTGrid(context, viewModel.recentlyAddedNfts, isDesktop, isTablet),
      ],
    );
  }
  
  Widget _buildNFTGrid(BuildContext context, List<NFTEntity> nfts, bool isDesktop, bool isTablet) {
    // Default to 3 columns for desktop
    int crossAxisCount = 3;
    
    // Adjust columns based on screen size
    if (!isDesktop && !isTablet) {
      crossAxisCount = 1; // Mobile: 1 column
    } else if (!isDesktop && isTablet) {
      crossAxisCount = 2; // Tablet: 2 columns
    }
    
    // Limit to 6 items max
    const int maxItems = 6;
    final displayNfts = nfts.length > maxItems ? nfts.sublist(0, maxItems) : nfts;
    
    // Fixed card height matching NFTCard's height property
    const double cardHeight = 250.0; // Reduced height for cleaner layout
    
    // Calculate total grid height based on number of rows and spacing
    final int rows = (displayNfts.length / crossAxisCount).ceil();
    final double totalHeight = (rows * cardHeight) + ((rows - 1) * 20.0); // Account for mainAxisSpacing
    
    return SizedBox(
      height: totalHeight,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          mainAxisExtent: cardHeight, // Use fixed height that matches NFTCard
        ),
        itemCount: displayNfts.length,
        itemBuilder: (context, index) {
          return NFTCard(
            nft: displayNfts[index],
            onPlaceBid: () {
              // Handle place bid action
            },
            onFavorite: () {
              // Handle favorite action
            },
          );
        },
      ),
    );
  }
  
  Widget _buildTopCreators(BuildContext context, NFTMarketplaceViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with See All button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Creators',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: NFTTheme.primaryBlue.withOpacity(0.2),
                foregroundColor: NFTTheme.primaryBlue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'See all',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 16),
        
        // Column headers
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  'Name',
                  style: TextStyle(color: NFTTheme.greyText, fontSize: 12),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Artworks',
                  style: TextStyle(color: NFTTheme.greyText, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Rating',
                  style: TextStyle(color: NFTTheme.greyText, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 8),
        
        // Creator list
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: viewModel.topCreators.length,
          itemBuilder: (context, index) {
            final creator = viewModel.topCreators[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  // Avatar and name
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(creator.avatar),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '@${creator.username}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Artworks count
                  Expanded(
                    flex: 2,
                    child: Text(
                      '${creator.artworks}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  
                  // Rating bar
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Container(
                        width: 60,
                        height: 4,
                        decoration: BoxDecoration(
                          color: NFTTheme.primaryBlue,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
  
  Widget _buildHistory(BuildContext context, NFTMarketplaceViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with See All button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'History',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: NFTTheme.primaryBlue.withOpacity(0.2),
                foregroundColor: NFTTheme.primaryBlue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'See all',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 16),
        
        // History items list
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: viewModel.historyItems.length,
          itemBuilder: (context, index) {
            final transaction = viewModel.historyItems[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  // NFT Image
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(transaction.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  
                  const SizedBox(width: 12),
                  
                  // NFT Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'By Creator',  // Using generic text since artist name isn't available
                          style: TextStyle(
                            color: NFTTheme.greyText,
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  
                  // Price and Time
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${transaction.price.toStringAsFixed(2)} ETH',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${transaction.timeAgo} ago',
                        style: TextStyle(
                          color: NFTTheme.greyText,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
  
  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '© 2022 Horizon UI. All Rights Reserved. Made with love by Simmmple!',
            style: NFTTheme.smallBodyStyle,
          ),
          Wrap(
            spacing: 16,
            children: [
              Text('Marketplace', style: NFTTheme.smallBodyStyle),
              Text('License', style: NFTTheme.smallBodyStyle),
              Text('Terms of Use', style: NFTTheme.smallBodyStyle),
              Text('Blog', style: NFTTheme.smallBodyStyle),
            ]
          ),
        ],
      ),
    );
  }
  
  Widget _iconButton(IconData icon) {
    return Container(
      width: 36,
      height: 36,
      decoration: NFTTheme.iconButtonDecoration,
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
