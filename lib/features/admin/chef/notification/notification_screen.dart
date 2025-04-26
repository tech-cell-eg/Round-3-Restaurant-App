import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/features/admin/chef/notification/model/massage_model.dart';
import 'package:food_app/features/admin/chef/notification/model/notification_model.dart';

class NotificationScreen extends StatefulWidget {
  final List<NotificationModel> notifications;
  final List<MessageModel> messages;

  const NotificationScreen({
    super.key,
    required this.notifications,
    required this.messages,
  });

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final unreadNotifications =
        widget.notifications.where((n) => !n.isRead).length;
    final unreadMessages = widget.messages.where((m) => !m.isRead).length;

    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: AppColor.kPrimaryColor,
          indicatorColor: AppColor.kPrimaryColor,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Notifications'),
                  if (unreadNotifications > 0) ...[
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColor.kPrimaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                      child: Text(
                        unreadNotifications.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Messages'),
                  if (unreadMessages > 0) ...[
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColor.kPrimaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                      child: Text(
                        unreadMessages.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [buildNotificationsTab(), buildMessagesTab()],
      ),
    );
  }

  Widget buildNotificationsTab() {
    final notificationGroups = groupNotifications(widget.notifications);
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      itemCount: notificationGroups.length,
      itemBuilder: (context, index) {
        final group = notificationGroups[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            ...group.notifications.map((notification) {
              return buildNotificationItem(notification);
            }),
          ],
        );
      },
    );
  }

  Widget buildMessagesTab() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      itemCount: widget.messages.length + 1, // +1 for the header
      itemBuilder: (context, index) {
        if (index == 0) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          );
        }
        final message = widget.messages[index - 1];
        return buildMessageItem(message);
      },
    );
  }

  Widget buildNotificationItem(NotificationModel notification) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Icon(
            getNotificationIcon(notification.type),
            color: AppColor.kPrimaryColor,
            size: 20,
          ),
        ),
        title: Text(
          notification.title,
          style: TextStyle(
            fontWeight:
                notification.isRead ? FontWeight.normal : FontWeight.bold,
          ),
        ),
        subtitle: Text(
          notification.timeAgo,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ),
    );
  }

  Widget buildMessageItem(MessageModel message) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        leading: Stack(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Text(
                message.sender.initial,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            if (message.sender.isActive)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
          ],
        ),
        title: Row(
          children: [
            Text(
              message.sender.name,
              style: TextStyle(
                fontWeight:
                    message.isRead ? FontWeight.normal : FontWeight.bold,
              ),
            ),
            if (message.sender.isActive) ...[
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Active',
                  style: TextStyle(
                    color: Colors.green[800],
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ],
        ),
        subtitle: Text(
          message.content,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 13),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message.timeAgo,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            if (!message.isRead)
              Container(
                margin: const EdgeInsets.only(top: 4),
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }

  IconData getNotificationIcon(NotificationType type) {
    switch (type) {
      case NotificationType.order:
        return Icons.shopping_bag;
      case NotificationType.review:
        return Icons.star;
      case NotificationType.cancellation:
        return Icons.cancel;
      default:
        return Icons.notifications;
    }
  }

  List<NotificationGroup> groupNotifications(
    List<NotificationModel> notifications,
  ) {
    return [NotificationGroup(notifications: notifications)];
  }
}

class NotificationGroup {
  final List<NotificationModel> notifications;

  NotificationGroup({required this.notifications});
}

// Demo Data
final demoNotifications = [
  NotificationModel(
    id: '1',
    title: 'Tanbir Ahmed Placed a new order',
    description: 'New order received',
    time: DateTime.now().subtract(const Duration(minutes: 20)),
    type: NotificationType.order,
  ),
  NotificationModel(
    id: '2',
    title: 'Salim Smith left a 5 star review',
    description: 'Customer review',
    time: DateTime.now().subtract(const Duration(minutes: 20)),
    type: NotificationType.review,
  ),
  NotificationModel(
    id: '3',
    title: 'Royal Bengal agreed to cancel',
    description: 'Order cancellation',
    time: DateTime.now().subtract(const Duration(minutes: 20)),
    type: NotificationType.cancellation,
  ),
  NotificationModel(
    id: '4',
    title: 'Pabel Vuiya Placed a new order',
    description: 'New order received',
    time: DateTime.now().subtract(const Duration(minutes: 20)),
    type: NotificationType.order,
  ),
];

final demoMessages = [
  MessageModel(
    id: '1',
    sender: User(
      id: '1',
      name: 'Royal Parvej',
      lastActive: DateTime.now().subtract(const Duration(minutes: 2)),
    ),
    content: 'Sounds awesome!',
    time: DateTime.now().subtract(const Duration(minutes: 20)),
    isActive: true,
  ),
  MessageModel(
    id: '2',
    sender: User(
      id: '2',
      name: 'Cameron Williamson',
      lastActive: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    content: 'Ok, just hurry up little bit...😊',
    time: DateTime.now().subtract(const Duration(minutes: 20)),
  ),
  MessageModel(
    id: '3',
    sender: User(
      id: '3',
      name: 'Ralph Edwards',
      lastActive: DateTime.now().subtract(const Duration(minutes: 1)),
    ),
    content: 'Thanks dude.',
    time: DateTime.now().subtract(const Duration(minutes: 20)),
    isActive: true,
  ),
  MessageModel(
    id: '4',
    sender: User(
      id: '4',
      name: 'Cody Fisher',
      lastActive: DateTime.now().subtract(const Duration(days: 1)),
    ),
    content: 'How is going...?',
    time: DateTime.now().subtract(const Duration(minutes: 20)),
  ),
  MessageModel(
    id: '5',
    sender: User(
      id: '5',
      name: 'Eleanor Pena',
      lastActive: DateTime.now().subtract(const Duration(minutes: 3)),
    ),
    content: 'Thanks for the awesome food man...!',
    time: DateTime.now().subtract(const Duration(minutes: 20)),
    isActive: true,
  ),
];
