import 'package:flutter/material.dart';
import '../../core/theme.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final double? percentChange;
  final List<String>? items;
  final Widget? trailing;
  final Color? accentColor;
  final bool showLeftBorder;

  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    this.percentChange,
    this.items,
    this.trailing,
    this.accentColor,
    this.showLeftBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
        // Left accent border if enabled
        border: showLeftBorder ? Border(
          left: BorderSide(
            color: accentColor ?? AppTheme.primaryBlue,
            width: 4,
          ),
          top: const BorderSide(color: AppTheme.borderLight),
          right: const BorderSide(color: AppTheme.borderLight),
          bottom: const BorderSide(color: AppTheme.borderLight),
        ) : Border.all(color: AppTheme.borderLight),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with title and optional trailing widget
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              if (trailing != null) trailing!,
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Main value
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.darkText,
            ),
          ),
          
          // Optional subtitle
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
          
          // Optional percent change indicator
          if (percentChange != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  percentChange! >= 0 ? Icons.arrow_upward : Icons.arrow_downward,
                  color: percentChange! >= 0 ? AppTheme.green : AppTheme.red,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  '${percentChange!.abs().toStringAsFixed(1)}%',
                  style: TextStyle(
                    color: percentChange! >= 0 ? AppTheme.green : AppTheme.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  percentChange! >= 0 ? 'since last month' : 'since last month',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
          
          // Optional items
          if (items != null && items!.isNotEmpty) ...[
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  items![0],
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  items![1],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkText,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
