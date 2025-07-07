import 'package:flutter/material.dart';
import '../../core/theme.dart';

class FooterSection extends StatelessWidget {
  final String copyrightText;
  final List<Map<String, String>> links;

  const FooterSection({
    super.key,
    this.copyrightText = '© 2022 Horizon UI. All Rights Reserved. Made with love by Simmmple!',
    this.links = const [
      {'title': 'Marketplace', 'url': '#marketplace'},
      {'title': 'License', 'url': '#license'},
      {'title': 'Terms of Use', 'url': '#terms'},
      {'title': 'Blog', 'url': '#blog'},
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppTheme.borderLight, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Responsive layout
          if (constraints.maxWidth < 600) {
            // Mobile layout
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  copyrightText,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.grayText,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 16,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: _buildLinks(),
                ),
              ],
            );
          } else {
            // Desktop layout
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    copyrightText,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.grayText,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: _buildLinks(),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  List<Widget> _buildLinks() {
    return links.map((link) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: InkWell(
          onTap: () {},
          child: Text(
            link['title']!,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppTheme.primaryBlue,
            ),
          ),
        ),
      );
    }).toList();
  }
}
