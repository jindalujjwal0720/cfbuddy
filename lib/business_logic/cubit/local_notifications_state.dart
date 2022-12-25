// ignore_for_file: must_be_immutable

part of 'local_notifications_cubit.dart';

abstract class LocalNotificationsState extends Equatable {
  List<int> scheduledIds;
  LocalNotificationsState(this.scheduledIds);

  @override
  List<Object> get props => [];
}

class LocalNotificationsInitial extends LocalNotificationsState {
  LocalNotificationsInitial(super.scheduledIds);
}

class LocalNotificationsLoading extends LocalNotificationsState {
  LocalNotificationsLoading(super.scheduledIds);
}

class LocalNotificationsScheduled extends LocalNotificationsState {
  LocalNotificationsScheduled(super.scheduledIds);
}

class LocalNotificationsRemoved extends LocalNotificationsState {
  LocalNotificationsRemoved(super.scheduledIds);
}
