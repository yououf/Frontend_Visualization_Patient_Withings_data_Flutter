import 'package:equatable/equatable.dart';

class Patient {
  int id;
  String bu;
  String gender;
  String birthday;
  bool isActive;
  int treatActiveNb;

  Patient(
      {this.id,
      this.bu,
      this.gender,
      this.birthday,
      this.isActive,
      this.treatActiveNb});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json["Pat_Id_int"];
    bu = json["Pat_BU_str"];
    gender = json["Pat_Gender_str"];
    birthday = json["Pat_BirthDate_dt"];
    isActive = json["Pat_IsActive_bl"];
    treatActiveNb = json["Pat_TreatActiveNb_in"];
  }
}

class PatientDih extends Equatable {
  final int tRCPatientId;
  final int renderedTreatmentId;
  final int treatmentId;

  PatientDih({this.tRCPatientId, this.renderedTreatmentId, this.treatmentId});

  static PatientDih fromJson(Map<String, dynamic> json) {
    return new PatientDih(renderedTreatmentId: json['rendered_treatment_id'],
        tRCPatientId: json['TRC_patient_id'],
        treatmentId: json['treatment_id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TRC_patient_id'] = this.tRCPatientId;
    data['rendered_treatment_id'] = this.renderedTreatmentId;
    data['treatment_id'] = this.treatmentId;
    return data;
  }

  @override
  List<Object> get props => [tRCPatientId, renderedTreatmentId, treatmentId];
}

class Experiences extends Equatable {
  final int tRCPatientId;
  final String endDate;
  final int idExperience;
  final PatientDih patientDih;
  final String startDate;

  Experiences({this.tRCPatientId,
    this.endDate,
    this.idExperience,
    this.patientDih,
    this.startDate});

  static Experiences fromJson(Map<String, dynamic> json) {
    PatientDih patientDih = json['patient_dih'] != null
        ? PatientDih.fromJson(json['patient_dih'])
        : null;


    return new Experiences(tRCPatientId: json['TRC_patient_id'],
        endDate: json['end_date'],
        idExperience: json['id_experience'],
        patientDih
            :patientDih,
        startDate: json['start_date']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TRC_patient_id'] = this.tRCPatientId;
    data['end_date'] = this.endDate;
    data['id_experience'] = this.idExperience;
    if (this.patientDih != null) {
      data['patient_dih'] = this.patientDih.toJson();
    }
    data['start_date'] = this.startDate;
    return data;
  }

  @override
  List<Object> get props =>
      [tRCPatientId, endDate, idExperience, patientDih, startDate];
}
