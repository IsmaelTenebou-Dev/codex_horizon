import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../data/models/team_member_model.dart';

class TeamMembersWidget extends StatelessWidget {
  final String title;
  final List<TeamMemberModel> members;
  final Widget? trailing;

  const TeamMembersWidget({
    super.key,
    this.title = 'Team members',
    required this.members,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
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
                style: Theme.of(context).textTheme.titleLarge,
              ),
              if (trailing != null) trailing!,
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Member list
          ...List.generate(members.length, (index) {
            final member = members[index];
            final isLast = index == members.length - 1;
            
            return Column(
              children: [
                Row(
                  children: [
                    // Avatar
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.lightGray,
                        image: member.avatar != null
                            ? DecorationImage(
                                image: AssetImage(member.avatar!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: member.avatar == null
                          ? Center(
                              child: Text(
                                _getInitials(member.name),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.grayText,
                                ),
                              ),
                            )
                          : null,
                    ),
                    
                    const SizedBox(width: 16),
                    
                    // Name and role
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            member.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.darkText,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            member.role,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppTheme.grayText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Action button
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
                
                // Divider if not last item
                if (!isLast) ...[
                  const SizedBox(height: 16),
                  const Divider(height: 1),
                  const SizedBox(height: 16),
                ],
              ],
            );
          }),
        ],
      ),
    );
  }
  
  String _getInitials(String name) {
    final nameParts = name.split(' ');
    if (nameParts.length > 1) {
      return '${nameParts[0][0]}${nameParts[1][0]}'.toUpperCase();
    }
    return nameParts[0][0].toUpperCase();
  }
}
