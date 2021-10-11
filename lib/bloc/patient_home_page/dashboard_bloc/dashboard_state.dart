part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  @override
  List<Object> get props => [];
}

class DashboardEmpty extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
 final List<DataPatient> patientData;

 DashboardLoaded ({@required this.patientData});

 @override
 List<Object> get props => [patientData];

}

class DashboardError extends DashboardState{}