part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {}

class GetDashboard extends DashboardEvent {
  final int patientId;

  GetDashboard({@required this.patientId});

  @override
  List<Object> get props => [patientId];
}
