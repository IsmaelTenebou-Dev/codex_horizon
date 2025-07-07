import 'package:flutter/material.dart';
import '../../core/nft_theme.dart';

enum SidebarItem {
  dashboard,
  nftMarketplace,
  tables,
  kanban,
  profile,
  signIn
}

class Sidebar extends StatelessWidget {
  final SidebarItem selectedItem;
  final Function(SidebarItem) onItemSelected;
  
  const Sidebar({
    Key? key,
    required this.selectedItem,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate sidebar width based on screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final sidebarWidth = screenWidth < 800 ? 60.0 : 240.0;
    final isCollapsed = sidebarWidth == 60.0;
    
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: sidebarWidth,
      color: NFTTheme.primaryBackground,
      child: Column(
        children: [
          // Logo section
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isCollapsed)
                Text(
                  isCollapsed ? 'H' : 'HORIZON',
                  style: TextStyle(
                    color: NFTTheme.whiteText,
                    fontWeight: FontWeight.bold,
                    fontSize: isCollapsed ? 22 : 18,
                  ),
                ),
                if (!isCollapsed) ...[  
                  const SizedBox(width: 4),
                  Text(
                    'FREE',
                    style: TextStyle(
                      color: NFTTheme.whiteText,
                      fontSize: 18,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 40),
          
          // Navigation items
          _buildNavItem(
            context,
            SidebarItem.dashboard,
            'Dashboard',
            Icons.dashboard_outlined,
          ),
          _buildNavItem(
            context,
            SidebarItem.nftMarketplace,
            'NFT Marketplace',
            Icons.diamond_outlined,
          ),
          _buildNavItem(
            context,
            SidebarItem.tables,
            'Tables',
            Icons.grid_view_outlined,
          ),
          _buildNavItem(
            context,
            SidebarItem.kanban,
            'Kanban',
            Icons.view_kanban_outlined,
          ),
          _buildNavItem(
            context,
            SidebarItem.profile,
            'Profile',
            Icons.person_outline,
          ),
          _buildNavItem(
            context,
            SidebarItem.signIn,
            'Sign In',
            Icons.login_outlined,
          ),
          
          const Spacer(),
          
          // Upgrade to PRO section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [NFTTheme.secondaryBackground, Color(0xFF4E4E63)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isCollapsed)
                    Text(
                      'Upgrade to PRO',
                      style: TextStyle(
                        color: NFTTheme.whiteText,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  const SizedBox(height: 8),
                  if (!isCollapsed) ...[  
                    Text(
                      'To get access to all features!',
                      style: TextStyle(
                        color: NFTTheme.whiteText,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Connect with Venus World',
                      style: TextStyle(
                        color: NFTTheme.whiteText,
                        fontSize: 12,
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: NFTTheme.primaryBlue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: NFTTheme.whiteText,
                        size: 20,
                      ),
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
  
  Widget _buildNavItem(BuildContext context, SidebarItem item, String title, IconData icon) {
    final bool isCollapsed = MediaQuery.of(context).size.width < 800;
    final bool isSelected = selectedItem == item;
    
    return InkWell(
      onTap: () => onItemSelected(item),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF4E4E63) : Colors.transparent,
          border: isSelected
            ? Border(
                left: BorderSide(
                  color: NFTTheme.primaryBlue,
                  width: 3,
                ),
              )
            : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: NFTTheme.whiteText,
              size: 20,
            ),
            if (!isCollapsed) ...[  
              const SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  color: NFTTheme.whiteText,
                  fontSize: 14,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
