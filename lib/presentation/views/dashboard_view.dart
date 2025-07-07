import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/dashboard_viewmodel.dart';
import '../widgets/metrics_card.dart';
import '../widgets/chart_card.dart';
// No need for tasks_card as we're using tasks_widget.dart
import '../widgets/team_card.dart';
import '../widgets/calendar_card.dart';
import '../widgets/promo_card.dart';
import '../widgets/side_menu.dart';
import '../widgets/daily_traffic_chart.dart';
import '../widgets/pie_chart_widget.dart';
import '../widgets/weekly_revenue_chart.dart';
import '../widgets/check_table.dart';
// import '../widgets/right_sidebar.dart'; // Not needed for this layout
import '../widgets/complex_table.dart';
import '../widgets/tasks_widget.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DashboardViewModel>(context);
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 1100;
    final isTablet = size.width < 1100 && size.width >= 650;

    return Scaffold(
      backgroundColor: const Color(0xFF111C44),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Side Menu
          if (isDesktop || isTablet)
            const SideMenu(currentRoute: '/'),

          // Main Content
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    _buildHeader(context, isDesktop),
                    
                    const SizedBox(height: 24),
                    
                    // Left Column and Right Section
                    Row(  
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        
                        // Main Content Section
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              // Top metrics in one row - 5 cards
                              _buildTopMetrics(context, viewModel, isDesktop, isTablet),
                              
                              const SizedBox(height: 24),
                              
                              // Charts Row - Total Spent and Weekly Revenue
                              if (isDesktop) Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Total Spent Chart
                                  Expanded(
                                    flex: 1,
                                    child: ChartCard(
                                      title: viewModel.monthlySpent.title,
                                      value: viewModel.monthlySpent.value,
                                      percentChange: viewModel.monthlySpent.percentChange,
                                      subtitle: 'On track',
                                      chartType: ChartType.area,
                                      isSmall: false,
                                      height: 300,
                                    ),
                                  ),
                                  const SizedBox(width: 24),
                                  // Weekly Revenue Chart
                                  Expanded(
                                    flex: 1,
                                    child: WeeklyRevenueChart(height: 300),
                                  ),
                                ],
                              ),
                              
                              const SizedBox(height: 24),
                              
                              // Second row with Check Table, Daily Traffic, and Pie Chart
                              if (isDesktop) Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Left column: Check Table and Complex Table
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        // Check Table
                                        CheckTable(
                                          title: 'Check Table',
                                          items: viewModel.checkTableItems,
                                          onItemToggle: viewModel.toggleTableItemSelection,
                                          trailing: _iconButton(Icons.more_horiz),
                                          height: 300,
                                        ),
                                        const SizedBox(height: 24),
                                        // Complex Table
                                        ComplexTable(
                                          title: 'Complex Table',
                                          items: viewModel.complexTableItems,
                                          trailing: _iconButton(Icons.more_horiz),
                                          height: 300,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 24),
                                  // Right column: Daily Traffic, Pie Chart, Tasks and Calendar
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        // Daily Traffic and Pie Chart in a row
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            // Daily Traffic Chart
                                            Expanded(
                                              flex: 1,
                                              child: DailyTrafficChart(
                                                value: viewModel.dailyTraffic.value,
                                                subtitle: viewModel.dailyTraffic.subtitle ?? 'visitors',
                                                percentChange: viewModel.dailyTraffic.percentChange,
                                                height: 300,
                                              ),
                                            ),
                                            const SizedBox(width: 24),
                                            // Pie Chart
                                            Expanded(
                                              flex: 1,
                                              child: PieChartWidget(
                                                title: 'Your Pie Chart',
                                                sections: PieChartWidget.generateDefaultSections(),
                                                labels: const ['System', 'Storage', 'Network'],
                                                colors: const [Color(0xFF805AD5), Color(0xFF76E4F7), Color(0xFF4299E1)],
                                                height: 300,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 24),
                                        // Tasks and Calendar in a row
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            // Tasks Widget
                                            Expanded(
                                              flex: 1,
                                              child: TasksWidget(
                                                title: 'Tasks',
                                                tasks: viewModel.tasks,
                                                onToggleTask: viewModel.toggleTaskCompletion,
                                                trailing: _iconButton(Icons.more_horiz),
                                                height: 300,
                                              ),
                                            ),
                                            const SizedBox(width: 24),
                                            // Calendar
                                            Expanded(
                                              flex: 1,
                                              child: CalendarCard(
                                                height: 300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              
                              // Mobile layout - follow same structure as desktop but stacked vertically
                              if (!isDesktop) Column(
                                children: [
                                  // Check Table
                                  CheckTable(
                                    title: 'Check Table',
                                    items: viewModel.checkTableItems,
                                    onItemToggle: viewModel.toggleTableItemSelection,
                                    trailing: _iconButton(Icons.more_horiz),
                                  ),
                                  const SizedBox(height: 24),
                                  // Complex Table
                                  ComplexTable(
                                    title: 'Complex Table',
                                    items: viewModel.complexTableItems,
                                    trailing: _iconButton(Icons.more_horiz),
                                  ),
                                  const SizedBox(height: 24),
                                  // Daily Traffic Chart
                                  DailyTrafficChart(
                                    value: viewModel.dailyTraffic.value,
                                    subtitle: viewModel.dailyTraffic.subtitle ?? 'visitors',
                                    percentChange: viewModel.dailyTraffic.percentChange,
                                  ),
                                  const SizedBox(height: 24),
                                  // Pie Chart
                                  PieChartWidget(
                                    title: 'Your Pie Chart',
                                    sections: PieChartWidget.generateDefaultSections(),
                                    labels: const ['System', 'Storage', 'Network'],
                                    colors: const [Color(0xFF805AD5), Color(0xFF76E4F7), Color(0xFF4299E1)],
                                  ),
                                  const SizedBox(height: 24),
                                  // Tasks Widget
                                  TasksWidget(
                                    title: 'Tasks',
                                    tasks: viewModel.tasks,
                                    onToggleTask: viewModel.toggleTaskCompletion,
                                    trailing: _iconButton(Icons.more_horiz),
                                  ),
                                  const SizedBox(height: 24),
                                  // Calendar
                                  const CalendarCard(),
                                  const SizedBox(height: 24),
                                  // Weekly Revenue Chart
                                  WeeklyRevenueChart(),
                                ],
                              ),
                              

                              
                              const SizedBox(height: 24),
                              
                              // Team and Promo Row
                              _buildTeamPromoRow(context, viewModel, isDesktop),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDesktop) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Main Dashboard',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Pages / Dashboard',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 240,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF192555),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            _iconButton(Icons.notifications_outlined),
            const SizedBox(width: 8),
            _iconButton(Icons.dark_mode_outlined),
            const SizedBox(width: 8),
            _iconButton(Icons.help_outline),
            const SizedBox(width: 16),
            const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTopMetrics(BuildContext context, DashboardViewModel viewModel,
      bool isDesktop, bool isTablet) {
    final metrics = [
      viewModel.earningsMetric,
      viewModel.spendThisMonth,
      viewModel.revenue,
      viewModel.newTasks,
      viewModel.totalProjects,
      viewModel.dailyTraffic,
    ];

    if (isDesktop) {
      return Row(
        children: metrics.asMap().entries.map((entry) => Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: entry.key < metrics.length - 1 ? 16.0 : 0),
            child: MetricsCard(
              metric: entry.value,
              height: 105, 
            ),
          ),
        )).toList(),
      );
    } else {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isTablet ? 3 : 2,
          childAspectRatio: isTablet ? 2.5 : 1.8,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: metrics.length,
        itemBuilder: (context, index) {
          return MetricsCard(
          metric: metrics[index],
          height: 105, // Fixed height as requested
        );
        },
      );
    }
  }
  
  // Removed unused function _buildLeftColumnMetrics
  
  // Removed unused function _buildRightSectionMetrics
  

  
  Widget _buildTeamPromoRow(BuildContext context, DashboardViewModel viewModel, bool isDesktop) {
    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Business Design Card
          const Expanded(
            child: PromoCard(
              type: PromoType.businessDesign,
            ),
          ),
          const SizedBox(width: 16),
          // Team Members Card
          Expanded(
            child: TeamCard(members: viewModel.teamMembers),
          ),
          const SizedBox(width: 16),
          // Security Card
          const Expanded(
            child: PromoCard(
              type: PromoType.security,
            ),
          ),
          const SizedBox(width: 16),
          // Starbucks Card
          const Expanded(
            child: PromoCard(
              type: PromoType.starbucks,
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          const PromoCard(type: PromoType.businessDesign),
          const SizedBox(height: 16),
          TeamCard(members: viewModel.teamMembers),
          const SizedBox(height: 16),
          const PromoCard(type: PromoType.security),
          const SizedBox(height: 16),
          const PromoCard(type: PromoType.starbucks),
        ],
      );
    }
  }






  Widget _iconButton(IconData icon) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: const Color(0xFF192555),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
