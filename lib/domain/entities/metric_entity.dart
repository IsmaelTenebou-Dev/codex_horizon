class MetricEntity {
  final String title;
  final String value;
  final String? subtitle;
  final List<String>? items;
  final double? percentChange;
  
  const MetricEntity({
    required this.title,
    required this.value,
    this.subtitle,
    this.items,
    this.percentChange,
  });
}
