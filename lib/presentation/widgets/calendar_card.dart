import 'package:flutter/material.dart';

class CalendarCard extends StatelessWidget {
  final double? height;
  const CalendarCard({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
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
          // Title
          const Text(
            'Calendar',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          
          // Make calendar content scrollable to fix overflow
          Expanded(
            child: _CalendarContent(),
          ),
        ],
      ),
    );
  }
}

class _CalendarContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header row with month and year selector
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'April',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white.withOpacity(0.7),
                    size: 20,
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    '2021',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white.withOpacity(0.7),
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Day of week header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _DayOfWeekLabel('Mo'),
              _DayOfWeekLabel('Tu'),
              _DayOfWeekLabel('We'),
              _DayOfWeekLabel('Th'),
              _DayOfWeekLabel('Fr'),
              _DayOfWeekLabel('Sa'),
              _DayOfWeekLabel('Su'),
            ],
          ),
          
          const SizedBox(height: 8),
          
          // Calendar days grid
          _buildCalendarGrid(),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    // Mock data for April 2021 - reduced number of rows to prevent overflow
    final List<List<int?>> weeks = [
      [null, null, null, 1, 2, 3, 4],
      [5, 6, 7, 8, 9, 10, 11],
      [12, 13, 14, 15, 16, 17, 18],
      [19, 20, 21, 22, 23, 24, 25],
      [26, 27, 28, 29, 30, null, null],
    ];
    
    // Current date
    const int currentDay = 7;
    
    return Column(
      children: weeks.map((week) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: week.map((day) {
            final bool isCurrentMonth = day != null && day >= 1 && day <= 30;
            final bool isCurrentDay = isCurrentMonth && day == currentDay;
            final bool isSpecialDay = isCurrentMonth && day == 14; // Make day 14 special
            
            return _CalendarDayCell(
              day: day,
              isCurrentMonth: isCurrentMonth,
              isCurrentDay: isCurrentDay,
              isSpecialDay: isSpecialDay,
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}

class _DayOfWeekLabel extends StatelessWidget {
  final String text;
  
  const _DayOfWeekLabel(this.text);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 22,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white.withOpacity(0.5),
          fontSize: 10, // Smaller font size to prevent overflow
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _CalendarDayCell extends StatelessWidget {
  final int? day;
  final bool isCurrentMonth;
  final bool isCurrentDay;
  final bool isSpecialDay;
  
  const _CalendarDayCell({
    required this.day,
    required this.isCurrentMonth,
    required this.isCurrentDay,
    required this.isSpecialDay,
  });
  
  @override
  Widget build(BuildContext context) {
    if (day == null) {
      return const SizedBox(width: 22, height: 22);
    }
    
    final Color textColor;
    final Color? backgroundColor;
    final Border? border;
    
    if (!isCurrentMonth) {
      textColor = Colors.white.withOpacity(0.3);
      backgroundColor = null;
      border = null;
    } else if (isCurrentDay) {
      textColor = Colors.white;
      backgroundColor = const Color(0xFF4318FF);
      border = null;
    } else if (isSpecialDay) {
      textColor = Colors.white;
      backgroundColor = Colors.purple.withOpacity(0.3);
      border = null;
    } else {
      textColor = Colors.white;
      backgroundColor = null;
      border = null;
    }
    
    return Container(
      width: 22, // Slightly reduce size to prevent overflow
      height: 22,
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
        border: border,
      ),
      child: Center(
        child: Text(
          day.toString(),
          style: TextStyle(
            color: textColor,
            fontSize: 11,
            fontWeight: isCurrentDay ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
