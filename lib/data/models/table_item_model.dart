import '../../domain/entities/table_item_entity.dart';

class TableItemModel extends TableItemEntity {
  const TableItemModel({
    required super.name,
    super.progress,
    super.quantity,
    super.date,
    super.status,
    super.isChecked = false,
  });
  
  factory TableItemModel.fromJson(Map<String, dynamic> json) {
    return TableItemModel(
      name: json['name'],
      progress: json['progress'],
      quantity: json['quantity'],
      date: json['date'],
      status: json['status'] != null ? 
             _parseStatus(json['status']) : null,
      isChecked: json['isChecked'] ?? false,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'progress': progress,
      'quantity': quantity,
      'date': date,
      'status': status?.toString().split('.').last,
      'isChecked': isChecked,
    };
  }
  
  static TableItemStatus _parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return TableItemStatus.approved;
      case 'disabled':
      case 'disable':
        return TableItemStatus.disabled;
      case 'error':
        return TableItemStatus.error;
      case 'pending':
        return TableItemStatus.pending;
      default:
        return TableItemStatus.pending;
    }
  }
}
