import '../../domain/entities/metric_entity.dart';

class MetricModel extends MetricEntity {
  const MetricModel({
    required super.title,
    required super.value,
    super.subtitle,
    super.items,
    super.percentChange,
  });
  
  factory MetricModel.fromJson(Map<String, dynamic> json) {
    return MetricModel(
      title: json['title'],
      value: json['value'],
      subtitle: json['subtitle'],
      items: json['items'] != null ? List<String>.from(json['items']) : null,
      percentChange: json['percentChange'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'value': value,
      'subtitle': subtitle,
      'items': items,
      'percentChange': percentChange,
    };
  }
}
