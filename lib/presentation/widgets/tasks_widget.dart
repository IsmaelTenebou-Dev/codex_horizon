import 'package:flutter/material.dart';
import '../../core/theme.dart';

class TasksWidget extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> tasks;
  final Function(int)? onToggleTask;
  final Widget? trailing;
  final double? height;

  const TasksWidget({
    super.key,
    this.title = 'Tasks',
    required this.tasks,
    this.onToggleTask,
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
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and trailing
          Row(
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
          
          const SizedBox(height: 16),
          
          // Make tasks list scrollable
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: List.generate(tasks.length, (index) {
                  final task = tasks[index];
                  final isCompleted = task['isCompleted'] as bool;
                  
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Row(
                      children: [
                        // Checkbox
                        Checkbox(
                          value: isCompleted,
                          onChanged: (_) => onToggleTask?.call(index),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        
                        const SizedBox(width: 8),
                        
                        // Task title
                        Expanded(
                          child: Text(
                            task['title'],
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              decoration: isCompleted ? TextDecoration.lineThrough : null,
                              decorationColor: Colors.white38,
                              decorationThickness: 1.5,
                            ),
                          ),
                        ),
                        
                        // Task options menu
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert,
                            color: AppTheme.grayText,
                            size: 20,
                          ),
                          visualDensity: VisualDensity.compact,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
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
}
