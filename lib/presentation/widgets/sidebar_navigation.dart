import 'package:flutter/material.dart';
import '../../core/theme.dart';

class SidebarNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int)? onItemSelected;
  final bool isExpanded;
  final VoidCallback? onToggleExpand;

  const SidebarNavigation({
    super.key,
    this.selectedIndex = 0,
    this.onItemSelected,
    this.isExpanded = true,
    this.onToggleExpand,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isExpanded ? 240 : 80,
      decoration: BoxDecoration(
        color: AppTheme.navyBlue,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          // Logo section
          Container(
            height: 80,
            padding: EdgeInsets.symmetric(
              horizontal: isExpanded ? 16 : 8,
              vertical: 16,
            ),
            alignment: isExpanded ? Alignment.centerLeft : Alignment.center,
            child: isExpanded
                ? const Row(
                    children: [
                      Text(
                        'HORIZON',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'FREE',
                        style: TextStyle(
                          color: Color(0xFFB794F4),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
                : const Icon(
                    Icons.dashboard_customize,
                    color: Colors.white,
                    size: 24,
                  ),
          ),

          const Divider(color: Colors.white24, height: 1),

          // Navigation items
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  _buildNavItem(
                    context,
                    icon: Icons.dashboard_outlined,
                    title: 'Dashboard',
                    index: 0,
                  ),
                  _buildNavItem(
                    context,
                    icon: Icons.shopping_cart_outlined,
                    title: 'NFT Marketplace',
                    index: 1,
                  ),
                  _buildNavItem(
                    context,
                    icon: Icons.table_chart_outlined,
                    title: 'Tables',
                    index: 2,
                  ),
                  _buildNavItem(
                    context,
                    icon: Icons.view_kanban_outlined,
                    title: 'Kanban',
                    index: 3,
                  ),
                  _buildNavItem(
                    context,
                    icon: Icons.person_outline,
                    title: 'Profile',
                    index: 4,
                  ),
                  _buildNavItem(
                    context,
                    icon: Icons.login_outlined,
                    title: 'Sign In',
                    index: 5,
                  ),
                ],
              ),
            ),
          ),

          // Pro upgrade section
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF805AD5), Color(0xFF6B46C1)],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: isExpanded
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                if (isExpanded) ...[
                  const SizedBox(height: 12),
                  const Text(
                    'Upgrade to PRO',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Get access to all features!',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Connect with Venus World!',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required int index,
  }) {
    final isSelected = selectedIndex == index;
    
    return InkWell(
      onTap: () => onItemSelected?.call(index),
      child: Container(
        height: 56,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: isExpanded ? 16 : 0,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white.withOpacity(0.1) : Colors.transparent,
          border: Border(
            left: BorderSide(
              color: isSelected ? AppTheme.primaryBlue : Colors.transparent,
              width: 4,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: isExpanded ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
              size: 22,
            ),
            if (isExpanded) ...[
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
