import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

enum ChartType {
  area,
  bar,
  pie,
}

class ChartCard extends StatelessWidget {
  final String title;
  final String? value;
  final String? subtitle;
  final double? percentChange;
  final ChartType chartType;
  final bool isSmall;
  final double? height;

  const ChartCard({
    Key? key,
    required this.title,
    this.value,
    this.subtitle,
    this.percentChange,
    required this.chartType,
    this.isSmall = false,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? (isSmall ? 250 : 300),
      decoration: BoxDecoration(
        color: const Color(0xFF1B254B),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title and value
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (value != null)
                    Row(
                      children: [
                        Text(
                          value!,
                          style: const TextStyle(
                            color: Colors.white,
                          fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (percentChange != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: _buildPercentageChange(percentChange!),
                          ),
                      ],
                    ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
              
              // Options icon
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFF2A3362),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.white.withOpacity(0.7),
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          
          const Spacer(),
          
          // Chart
          Expanded(
            flex: 5,
            child: _buildChart(),
          ),
          
          // Bottom labels for area and bar charts
          if (chartType != ChartType.pie)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: _buildBottomLabels(),
            ),
        ],
      ),
    );
  }

  Widget _buildPercentageChange(double percentChange) {
    final isPositive = percentChange >= 0;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: isPositive 
            ? Colors.green.withOpacity(0.2)
            : Colors.red.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isPositive ? Icons.arrow_upward : Icons.arrow_downward,
            color: isPositive ? Colors.green : Colors.red,
            size: 12,
          ),
          const SizedBox(width: 2),
          Text(
            '${percentChange.abs().toStringAsFixed(1)}%',
            style: TextStyle(
              color: isPositive ? Colors.green : Colors.red,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChart() {
    switch (chartType) {
      case ChartType.area:
        return _buildAreaChart();
      case ChartType.bar:
        return _buildBarChart();
      case ChartType.pie:
        return _buildPieChart();
    }
  }

  Widget _buildAreaChart() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: false,
        ),
        titlesData: FlTitlesData(
          show: false,
        ),
        borderData: FlBorderData(
          show: false,
        ),
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 6,
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 1),
              FlSpot(1, 2),
              FlSpot(2, 1.5),
              FlSpot(3, 3),
              FlSpot(4, 3.2),
              FlSpot(5, 4),
              FlSpot(6, 3.5),
            ],
            isCurved: true,
            color: Colors.blue,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: Colors.blue.withOpacity(0.2),
            ),
          ),
          LineChartBarData(
            spots: const [
              FlSpot(0, 2),
              FlSpot(1, 3),
              FlSpot(2, 2.8),
              FlSpot(3, 4.5),
              FlSpot(4, 4),
              FlSpot(5, 5),
              FlSpot(6, 4.8),
            ],
            isCurved: true,
            color: Colors.purple,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: Colors.purple.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarChart() {
    if (title.toLowerCase().contains('revenue')) {
      return BarChart(
        BarChartData(
          gridData: FlGridData(
            show: false,
          ),
          titlesData: FlTitlesData(
            show: false,
          ),
          borderData: FlBorderData(
            show: false,
          ),
          barGroups: List.generate(
            7,
            (index) => BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  fromY: 0,
                  toY: (index + 1) * 0.5 + 2 + (index % 3) * 0.5,
                  width: 16,
                  color: const Color(0xFF4318FF),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(4),
                  ),
                  rodStackItems: [
                    BarChartRodStackItem(0, (index + 1) * 0.3, const Color(0xFF39E3F8)),
                    BarChartRodStackItem((index + 1) * 0.3, (index + 1) * 0.5 + 1, const Color(0xFF6AD2FF)),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      // For traffic chart
      return BarChart(
        BarChartData(
          gridData: FlGridData(
            show: false,
          ),
          titlesData: FlTitlesData(
            show: false,
          ),
          borderData: FlBorderData(
            show: false,
          ),
          barGroups: List.generate(
            6,
            (index) => BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  fromY: 0,
                  toY: 2 + (index % 5) * 0.7,
                  width: 8,
                  color: const Color(0xFF4318FF),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget _buildPieChart() {
    return PieChart(
      PieChartData(
        centerSpaceRadius: 40,
        sections: [
          PieChartSectionData(
            value: 63,
            color: const Color(0xFF4318FF),
            title: '63%',
            titleStyle: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            radius: 50,
          ),
          PieChartSectionData(
            value: 25,
            color: const Color(0xFF6AD2FF),
            title: '25%',
            titleStyle: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            radius: 50,
          ),
          PieChartSectionData(
            value: 12,
            color: const Color(0xFF39E3F8),
            title: '12%',
            titleStyle: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            radius: 50,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomLabels() {
    final labels = chartType == ChartType.area
        ? const ['SEP', 'OCT', 'NOV', 'DEC', 'JAN', 'FEB']
        : title.toLowerCase().contains('revenue')
            ? const ['17', '18', '19', '20', '21', '22', '23', '24', '25']
            : const ['00', '04', '08', '12', '16', '20'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: labels
          .map(
            (label) => Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 10,
              ),
            ),
          )
          .toList(),
    );
  }
}
