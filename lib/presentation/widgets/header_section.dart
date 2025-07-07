import 'package:flutter/material.dart';
import '../../core/theme.dart';

class HeaderSection extends StatelessWidget {
  final String mainTitle;
  final String subTitle;
  final bool showSearch;
  final Function(String)? onSearch;
  final Widget? trailingWidget;

  const HeaderSection({
    super.key,
    this.mainTitle = 'HORIZON FREE',
    this.subTitle = 'Main Dashboard',
    this.showSearch = true,
    this.onSearch,
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Titles
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mainTitle,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subTitle,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.grayText,
                  ),
                ),
              ],
            ),
            
            // Right section with search bar, notification, theme toggle, profile
            Row(
              children: [
                if (showSearch) ...[
                  // Search bar
                  Container(
                    width: 240,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppTheme.lightGray,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      onChanged: onSearch,
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: AppTheme.grayText,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 18,
                          color: AppTheme.grayText,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
                
                // Notification bell
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppTheme.borderLight),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.notifications_none_rounded,
                      size: 20,
                      color: AppTheme.darkText,
                    ),
                  ),
                ),
                
                const SizedBox(width: 12),
                
                // Theme toggle
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppTheme.borderLight),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.dark_mode_outlined,
                      size: 20,
                      color: AppTheme.darkText,
                    ),
                  ),
                ),
                
                const SizedBox(width: 12),
                
                // Country dropdown
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.borderLight),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Image.network(
                        'https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1200px-Flag_of_the_United_States.svg.png',
                        width: 20,
                        height: 14,
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        size: 16,
                        color: AppTheme.grayText,
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(width: 12),
                
                // Profile avatar
                CircleAvatar(
                  radius: 18,
                  backgroundColor: AppTheme.lightGray,
                  backgroundImage: const NetworkImage(
                    'https://i.pravatar.cc/150?img=1',
                  ),
                ),
              ],
            ),
          ],
        ),
        
        const SizedBox(height: 24),
        
        // Navigation row (optional, shown only if trailingWidget is provided)
        if (trailingWidget != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildNavItem('Dashboard', isSelected: true),
                  _buildNavItem('Tables'),
                ],
              ),
              trailingWidget!,
            ],
          ),
          const SizedBox(height: 16),
        ],
      ],
    );
  }
  
  Widget _buildNavItem(String title, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 32),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? AppTheme.primaryBlue : AppTheme.grayText,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4),
          if (isSelected)
            Container(
              height: 2,
              width: 16,
              color: AppTheme.primaryBlue,
            ),
        ],
      ),
    );
  }
}
