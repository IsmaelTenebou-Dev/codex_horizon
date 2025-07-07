import 'package:flutter/material.dart';
import '../../data/models/metric_model.dart';

class MetricsCard extends StatelessWidget {
  final MetricModel metric;
  final double? height;

  const MetricsCard({Key? key, required this.metric, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF1B254B), // Updated to match Weekly Revenue chart
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          // Icon specific to the metric type (on the left now)
          _buildMetricIcon(),
          const SizedBox(width: 12),
          
          // Content column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                Text(
                  metric.title,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                
                const SizedBox(height: 5),
                
                // Value and percentage in a row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    // Main Value
                    Text(
                      metric.value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    const SizedBox(width: 8),
                    
                    // Change Percentage if available
                    if (metric.percentChange != null)
                      _buildPercentageChange(metric.percentChange!),
                  ],
                ),
                
                // Subtitle if available
                if (metric.subtitle != null)
                  Text(
                    metric.subtitle!,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPercentageChange(double percentChange) {
    final isPositive = percentChange >= 0;
    return Text(
      '${isPositive ? "+" : "-"}${percentChange.abs().toStringAsFixed(1)}%',
      style: TextStyle(
        color: isPositive ? const Color(0xFF01B574) : Colors.red,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildMetricIcon() {
    IconData iconData;
    Color backgroundColor;
    Color iconColor = Colors.white; // Icons are white in the screenshot
    
    // Determine icon and color based on metric title
    // Match icons and colors exactly as in the screenshot
    final title = metric.title.toLowerCase();
    if (title.contains('earning')) {
      iconData = Icons.account_balance_wallet;
      backgroundColor = const Color(0xFF01B574); // Green
    } else if (title.contains('spend')) {
      iconData = Icons.credit_card;
      backgroundColor = const Color(0xFF4318FF); // Purple
    } else if (title.contains('sales') || title.contains('revenue') || title == 'weekly revenue') {
      iconData = Icons.bar_chart;
      backgroundColor = const Color(0xFF4318FF); // Purple
    } else if (title.contains('task')) {
      iconData = Icons.assignment_turned_in;
      backgroundColor = const Color(0xFF6C5CE7); // Purple
    } else if (title.contains('project')) {
      iconData = Icons.folder;
      backgroundColor = const Color(0xFFFE9F44); // Orange
    } else if (title.contains('traffic')) {
      iconData = Icons.trending_up;
      backgroundColor = const Color(0xFF01B574); // Green
    } else {
      iconData = Icons.analytics;
      backgroundColor = const Color(0xFF0FBCF9); // Blue
    }
    
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Icon(
          iconData,
          color: iconColor,
          size: 24,
        ),
      ),
    );
  }
}