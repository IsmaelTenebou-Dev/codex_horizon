import 'package:flutter/material.dart';
import '../../core/nft_theme.dart';

class SideMenu extends StatelessWidget {
  final String? currentRoute;
  
  const SideMenu({Key? key, this.currentRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String routeName = currentRoute ?? ModalRoute.of(context)?.settings.name ?? '/';
    return Container(
      width: MediaQuery.of(context).size.width < 800 ? 60 : 220,
      color: NFTTheme.primaryBackground,
      child: Column(
        children: [
          // Logo
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: NFTTheme.primaryBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'H',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'HORIZON',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  ' FREE',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Menu items
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: _buildMenuItem(
              icon: Icons.dashboard,
              title: 'Dashboard',
              isActive: routeName == '/',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/nft-marketplace');
            },
            child: _buildMenuItem(
              icon: Icons.store,
              title: 'NFT Marketplace',
              isActive: routeName == '/nft-marketplace',
            ),
          ),
          InkWell(
            onTap: () {
              // Future implementation
            },
            child: _buildMenuItem(
              icon: Icons.table_chart_outlined,
              title: 'Tables',
            ),
          ),
          InkWell(
            onTap: () {
              // Future implementation
            },
            child: _buildMenuItem(
              icon: Icons.view_kanban,
              title: 'Kanban',
            ),
          ),
          InkWell(
            onTap: () {
              // Future implementation
            },
            child: _buildMenuItem(
              icon: Icons.person_outline,
              title: 'Profile',
            ),
          ),
          InkWell(
            onTap: () {
              // Future implementation
            },
            child: _buildMenuItem(
              icon: Icons.login,
              title: 'Sign In',
            ),
          ),

          const Spacer(),

          // Upgrade to PRO section
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: NFTTheme.primaryBlue,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF4318FF).withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Upgrade to PRO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'to get access to all features!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Center(
                    child: Text(
                      'Connect with Venus!',
                      style: TextStyle(
                        color: NFTTheme.primaryBlue,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Footer
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  '© 2022 Horizon UI All Rights Reserved. Made with love by Simmmple!',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    bool isActive = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF4318FF) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isActive ? Colors.white : Colors.white.withOpacity(0.6),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.white.withOpacity(0.6),
            fontSize: 14,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
