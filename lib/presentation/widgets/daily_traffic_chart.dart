import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DailyTrafficChart extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final double? percentChange;
  final Widget? trailing;
  final double? height;

  const DailyTrafficChart({
    super.key,
    this.title = 'Daily Traffic',
    required this.value,
    required this.subtitle,
    this.percentChange,
    this.trailing,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF1B254B),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and dropdown
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Today',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Value and percent change
          Row(
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              if (percentChange != null)
                Text(
                  '${percentChange! >= 0 ? "+" : "-"}${percentChange!.abs().toStringAsFixed(1)}%',
                  style: TextStyle(
                    color: percentChange! >= 0 ? const Color(0xFF01B574) : Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),
          
          // Subtitle
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          
          
          const SizedBox(height: 20),
          
          // Bar chart
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceBetween,
                maxY: 100,
                minY: 0,
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: Colors.white.withOpacity(0.8),
                    tooltipRoundedRadius: 8,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        '${rod.toY.round()}',
                        const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: _bottomTitles,
                    ),
                  ),
                ),
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                barGroups: _generateBarGroups(),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _bottomTitles(double value, TitleMeta meta) {
    const timeLabels = ['00', '04', '08', '12', '16', '20'];
    
    if (value >= 0 && value < timeLabels.length) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          timeLabels[value.toInt()],
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
  
  List<BarChartGroupData> _generateBarGroups() {
    // Sample traffic data by hour segments
    final barData = [
      [30.0, 20.0, 10.0],  // Blue, Light blue, Purple segments
      [45.0, 30.0, 15.0],
      [35.0, 25.0, 15.0],
      [40.0, 25.0, 15.0],
      [50.0, 30.0, 15.0],
      [35.0, 20.0, 15.0],
    ];
    
    return List.generate(barData.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: barData[index][0] + barData[index][1] + barData[index][2], // Total height
            width: 18,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6),
            ),
            rodStackItems: [
              BarChartRodStackItem(
                0, 
                barData[index][0], 
                const Color(0xFF4299E1) // Blue
              ),
              BarChartRodStackItem(
                barData[index][0],
                barData[index][0] + barData[index][1],
                const Color(0xFF76E4F7) // Light blue
              ),
              BarChartRodStackItem(
                barData[index][0] + barData[index][1],
                barData[index][0] + barData[index][1] + barData[index][2],
                const Color(0xFFB794F4) // Purple
              ),
            ],
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: 100,
              color: Colors.white.withOpacity(0.05),
            ),
          ),
        ],
      );
    });
  }
}
