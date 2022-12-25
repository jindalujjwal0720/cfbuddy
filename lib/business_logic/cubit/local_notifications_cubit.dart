import 'package:bloc/bloc.dart';
import 'package:bloc1/utils/services/local_notifications_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

part 'local_notifications_state.dart';

class LocalNotificationsCubit extends Cubit<LocalNotificationsState> {
  LocalNotificationsCubit() : super(LocalNotificationsInitial(const []));

  Future<void> initialiseLocalNotifications() async {
    List<PendingNotificationRequest> pendingNotifications =
        await localNotificationsPlugin.pendingNotificationRequests();
    List<int> scheduledIds = [];
    for (var request in pendingNotifications) {
      scheduledIds.add(request.id);
    }

    state.scheduledIds = scheduledIds;
    emit(LocalNotificationsInitial(scheduledIds));
  }

  Future<void> scheduleLocalNotification(
      {required int id,
      required String title,
      required String body,
      required DateTime time}) async {
    emit(LocalNotificationsLoading(state.scheduledIds));
    await LocalNotificationsService()
        .scheduleNotification(id, title, body, time);

    List<PendingNotificationRequest> pendingNotifications =
        await localNotificationsPlugin.pendingNotificationRequests();
    List<int> scheduledIds = [];
    for (var request in pendingNotifications) {
      scheduledIds.add(request.id);
    }

    state.scheduledIds = scheduledIds;
    emit(LocalNotificationsScheduled(state.scheduledIds));
  }

  Future<void> removeLocalNotification(List<int> ids) async {
    emit(LocalNotificationsLoading(state.scheduledIds));

    for (var id in ids) {
      await localNotificationsPlugin.cancel(id);
    }

    List<PendingNotificationRequest> pendingNotifications =
        await localNotificationsPlugin.pendingNotificationRequests();
    List<int> scheduledIds = [];
    for (var request in pendingNotifications) {
      scheduledIds.add(request.id);
    }

    state.scheduledIds = scheduledIds;
    emit(LocalNotificationsRemoved(state.scheduledIds));
  }

  
}
