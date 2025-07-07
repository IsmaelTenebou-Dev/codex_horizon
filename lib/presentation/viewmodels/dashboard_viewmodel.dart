import 'package:flutter/material.dart';
import '../../data/models/metric_model.dart';
import '../../data/models/table_item_model.dart';
import '../../data/models/team_member_model.dart';
import '../../domain/entities/table_item_entity.dart';

class DashboardViewModel extends ChangeNotifier {
  // Sample data for the dashboard
  // In a real application, this would come from repositories and use cases
  
  // Metrics
  MetricModel get earningsMetric => const MetricModel(
    title: 'Earnings',
    value: '\$350.4',
    percentChange: 12.3,
  );
  
  MetricModel get spendThisMonth => const MetricModel(
    title: 'Spend this Month',
    value: '\$682.5',
    percentChange: -2.3,
  );
  
  MetricModel get revenue => const MetricModel(
    title: 'Weekly Revenue',
    value: '\$1000',
    subtitle: 'Year Indoor',
  );
  
  MetricModel get monthlySpent => const MetricModel(
    title: 'Total Spent',
    value: '\$37.5K',
    subtitle: 'Total Spent',
    percentChange: 2.45,
  );
  
  MetricModel get dailyTraffic => const MetricModel(
    title: 'Daily Traffic',
    value: '2,579',
    subtitle: 'visitors',
    percentChange: 12.4,
  );
  
  MetricModel get newTasks => const MetricModel(
    title: 'New Tasks',
    value: '154',
  );
  
  MetricModel get totalProjects => const MetricModel(
    title: 'Total Projects',
    value: '2935',
  );
  
  // Check Table Items
  List<TableItemModel> get checkTableItems => const [
    TableItemModel(
      name: 'Horizon UI PRO',
      progress: 17.5,
      quantity: '2,458',
      date: '24-Jan-2021',
    ),
    TableItemModel(
      name: 'Horizon UI Free',
      progress: 10.8,
      quantity: '1,485',
      date: '12-Jun-2021',
    ),
    TableItemModel(
      name: 'Weekly Update',
      progress: 21.3,
      quantity: '1,024',
      date: '5-Jun-2021',
    ),
    TableItemModel(
      name: 'Venus 3D Asset',
      progress: 31.5,
      quantity: '858',
      date: '7-Mar-2021',
    ),
    TableItemModel(
      name: 'Marketplace',
      progress: 12.2,
      quantity: '258',
      date: '17-Dec-2021',
    ),
  ];
  
  // Complex Table Items
  List<TableItemModel> get complexTableItems => const [
    TableItemModel(
      name: 'Horizon UI PRO',
      date: '18 Apr 2022',
      status: TableItemStatus.approved,
      progress: 75.5,
    ),
    TableItemModel(
      name: 'Horizon UI Free',
      date: '18 Apr 2022',
      status: TableItemStatus.disabled,
      progress: 25.0,
    ),
    TableItemModel(
      name: 'Marketplace',
      date: '20 May 2021',
      status: TableItemStatus.error,
      progress: 90.0,
    ),
    TableItemModel(
      name: 'Weekly Updates',
      date: '13 Jul 2021',
      status: TableItemStatus.approved,
      progress: 50.0,
    ),
  ];
  
  // Team Members
  List<TeamMemberModel> get teamMembers => const [
    TeamMemberModel(
      name: 'Adela Parkson',
      role: 'Creative Director',
      avatar: 'assets/images/adela.jpg',
    ),
    TeamMemberModel(
      name: 'Christian Mad',
      role: 'Product Designer',
      avatar: 'assets/images/christian.jpg',
    ),
    TeamMemberModel(
      name: 'Jason Statham',
      role: 'Senior Graphic Designer',
      avatar: 'assets/images/jason.jpg',
    ),
  ];
  
  // Tasks
  List<Map<String, dynamic>> get tasks => const [
    {
      'title': 'Landing Page Design',
      'isCompleted': false,
    },
    {
      'title': 'Dashboard Builder',
      'isCompleted': true,
    },
    {
      'title': 'Mobile App Design',
      'isCompleted': true,
    },
    {
      'title': 'Illustrations',
      'isCompleted': false,
    },
    {
      'title': 'Promotional LP',
      'isCompleted': true,
    },
  ];
  
  // Toggle task completion
  void toggleTaskCompletion(int index) {
    if (index >= 0 && index < tasks.length) {
      final updatedTasks = List<Map<String, dynamic>>.from(tasks);
      updatedTasks[index] = {
        ...updatedTasks[index],
        'isCompleted': !updatedTasks[index]['isCompleted'],
      };
      // In a real application we would update the data source
      notifyListeners();
    }
  }
  
  // Toggle table item selection
  void toggleTableItemSelection(int index) {
    if (index >= 0 && index < checkTableItems.length) {
      // In a real application we would update the data source
      notifyListeners();
    }
  }
}
