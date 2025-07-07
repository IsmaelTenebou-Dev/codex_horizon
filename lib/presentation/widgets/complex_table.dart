import 'package:flutter/material.dart';
import '../../data/models/table_item_model.dart';
import '../../domain/entities/table_item_entity.dart';

class ComplexTable extends StatelessWidget {
  final String title;
  final List<TableItemModel> items;
  final Widget? trailing;
  final double? height;

  const ComplexTable({
    super.key,
    required this.title,
    required this.items,
    this.trailing,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF111C44),
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
            padding: const EdgeInsets.all(16.0),
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
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              border: const Border(
                bottom: BorderSide(color: Colors.white10),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              children: [
                // Name column
                Expanded(
                  flex: 3,
                  child: Text(
                    'NAME',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 11,
                    ),
                  ),
                ),
                // Status column
                Expanded(
                  flex: 2,
                  child: Text(
                    'STATUS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 11,
                    ),
                  ),
                ),
                // Date column
                Expanded(
                  flex: 2,
                  child: Text(
                    'DATE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 11,
                    ),
                  ),
                ),
                // Progress column
                Expanded(
                  flex: 3,
                  child: Text(
                    'PROGRESS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Scrollable table content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: List.generate(items.length, (index) {
                  final item = items[index];
                  return Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: index == items.length - 1 ? null : Border(
                        bottom: BorderSide(
                          color: Colors.white.withOpacity(0.05),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        // Name
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        
                        // Status
                        Expanded(
                          flex: 2,
                          child: _buildStatusChip(item.status),
                        ),
                        
                        // Date
                        Expanded(
                          flex: 2,
                          child: Text(
                            item.date ?? '',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        
                        // Progress bar
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Container(
                              height: 6.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.white.withOpacity(0.1),
                              ),
                              child: FractionallySizedBox(
                                widthFactor: (item.progress ?? 0) / 100,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFF6C5CE7), Color(0xFFA29BFE)],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildStatusChip(TableItemStatus? status) {
    if (status == null) return const SizedBox.shrink();
    
    Color backgroundColor;
    IconData iconData;
    String label;
    
    switch (status) {
      case TableItemStatus.approved:
        backgroundColor = Colors.green;
        iconData = Icons.check;
        label = 'Approved';
        break;
      case TableItemStatus.disabled:
        backgroundColor = Colors.red;
        iconData = Icons.close;
        label = 'Disable';
        break;
      case TableItemStatus.error:
        backgroundColor = Colors.amber;
        iconData = Icons.error;
        label = 'Error';
        break;
      case TableItemStatus.pending:
        backgroundColor = Colors.blue;
        iconData = Icons.hourglass_empty;
        label = 'Pending';
        break;
    }
    
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              iconData,
              color: Colors.white,
              size: 16,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
  

}
