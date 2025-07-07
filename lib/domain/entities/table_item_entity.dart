enum TableItemStatus {
  approved,
  disabled,
  error,
  pending
}

class TableItemEntity {
  final String name;
  final double? progress;
  final String? quantity;
  final String? date;
  final TableItemStatus? status;
  final bool isChecked;
  
  const TableItemEntity({
    required this.name,
    this.progress,
    this.quantity,
    this.date,
    this.status,
    this.isChecked = false,
  });
}
