import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../data/models/table_item_model.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CheckTable extends StatelessWidget {
  final String title;
  final List<TableItemModel> items;
  final Function(int)? onItemToggle;
  final Widget? trailing;
  final double? height;

  const CheckTable({
    super.key,
    required this.title,
    required this.items,
    this.onItemToggle,
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
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and trailing widget
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                if (trailing != null) trailing!,
              ],
            ),
          ),
          
          // Table header
          Container(
            decoration: const BoxDecoration(
              color: AppTheme.tableHeaderBg,
              border: Border(
                top: BorderSide(color: AppTheme.borderLight),
                bottom: BorderSide(color: AppTheme.borderLight),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    'NAME',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkText,
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      'PROGRESS',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.darkText,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'QUANTITY',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.darkText,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      'DATE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.darkText,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Table rows
          ...List.generate(items.length, (index) {
            final item = items[index];
            return Container(
              height: 38,
              decoration: BoxDecoration(
                color: index.isEven ? Colors.black.withOpacity(0.1) : Colors.transparent,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white24,
                    width: index == items.length - 1 ? 0 : 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  // Name with checkbox
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Checkbox(
                              value: item.isChecked,
                              onChanged: (_) => onItemToggle?.call(index),
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              item.name,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Progress
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        '${item.progress?.toStringAsFixed(1)}%',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  
                  // Quantity
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Text(
                          item.quantity ?? '',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  // Date
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        item.date ?? '',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.darkText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
