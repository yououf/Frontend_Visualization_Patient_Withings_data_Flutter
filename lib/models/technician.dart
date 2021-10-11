import 'package:equatable/equatable.dart';

class Intervention extends Equatable {
  //This class uses a boolean to indicate if the intervention has been clicked, but this boolean does not appear on the database, this is only used for the interface
  //To change if a better solution exists

  final int addressId;
  final String agreed;
  final String comment;
  final String deliveryWindEnd;
  final String deliveryWindStart;
  final int duration;
  final DateTime forecastedDate;
  final int interventionId;
  final String lastOptimizationDate;
  final String letter;
  final String letterSent;
  final String mandatoryTechId;
  final String modemIssue;
  final int newTttReason;
  final String noModem;
  final bool onHold;
  final String onHoldUntil;
  final int optimizationCount;
  final int orderInTrip;
  final String pathology;
  final int patientId;
  final String pdaStatus;
  final String prescId;
  final int regionId;
  final int renderedTreatmentId;
  final int requestId;
  final String serviceType;
  final String site;
  final int smsStatus;
  final String status;
  final String tRCRealizationDate;
  final String therapy;
  final String trcAgreed;
  final String trcComment;
  final DateTime trcForecastedDate;
  final int treatmentId;
  final String treatmentStatus;
  final int tripId;
  final Trip trip;
  final bool hasBeenClicked;

  Intervention(
      {this.addressId,
      this.agreed,
      this.comment,
      this.deliveryWindEnd,
      this.deliveryWindStart,
      this.duration,
      this.forecastedDate,
      this.interventionId,
      this.lastOptimizationDate,
      this.letter,
      this.letterSent,
      this.mandatoryTechId,
      this.modemIssue,
      this.newTttReason,
      this.noModem,
      this.onHold,
      this.onHoldUntil,
      this.optimizationCount,
      this.orderInTrip,
      this.pathology,
      this.patientId,
      this.pdaStatus,
      this.prescId,
      this.regionId,
      this.renderedTreatmentId,
      this.requestId,
      this.serviceType,
      this.site,
      this.smsStatus,
      this.status,
      this.tRCRealizationDate,
      this.therapy,
      this.trcAgreed,
      this.trcComment,
      this.trcForecastedDate,
      this.treatmentId,
      this.treatmentStatus,
      this.tripId,
      this.trip,
      this.hasBeenClicked = false});

  static Intervention fromJson(Map<String, dynamic> json) {
    Trip trip = json['trip'] != null ? Trip.fromJson(json['trip']) : null;
    Intervention intervention = new Intervention(
      addressId: json['AddressId'],
      agreed: json['Agreed'],
      comment: json['Comment'],
      deliveryWindEnd: json['DeliveryWindEnd'],
      deliveryWindStart: json['DeliveryWindStart'],
      duration: json['Duration'],
      forecastedDate: DateTime.parse(json['ForecastedDate']),
      interventionId: json['InterventionId'],
      lastOptimizationDate: json['LastOptimizationDate'],
      letter: json['Letter'],
      letterSent: json['LetterSent'],
      mandatoryTechId: json['MandatoryTechId'],
      modemIssue: json['ModemIssue'],
      newTttReason: json['NewTttReason'],
      noModem: json['NoModem'],
      onHold: json['OnHold'],
      onHoldUntil: json['OnHoldUntil'],
      optimizationCount: json['OptimizationCount'],
      orderInTrip: json['OrderInTrip'],
      pathology: json['Pathology'],
      patientId: json['PatientId'],
      pdaStatus: json['PdaStatus'],
      prescId: json['PrescId'],
      regionId: json['RegionId'],
      renderedTreatmentId: json['RenderedTreatmentId'],
      requestId: json['RequestId'],
      serviceType: json['ServiceType'],
      site: json['Site'],
      smsStatus: json['SmsStatus'],
      status: json['Status'],
      tRCRealizationDate: json['TRCRealdateimeizationDate'],
      therapy: json['Therapy'],
      trcAgreed: json['TrcAgreed'],
      trcComment: json['TrcComment'],
      trcForecastedDate: DateTime.parse(json['TrcForecastedDate']),
      treatmentId: json['TreatmentId'],
      treatmentStatus: json['TreatmentStatus'],
      trip: trip,
      tripId: json['TripId'],
    );

    return intervention;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AddressId'] = this.addressId;
    data['Agreed'] = this.agreed;
    data['Comment'] = this.comment;
    data['DeliveryWindEnd'] = this.deliveryWindEnd;
    data['DeliveryWindStart'] = this.deliveryWindStart;
    data['Duration'] = this.duration;
    data['ForecastedDate'] = this.forecastedDate;
    data['InterventionId'] = this.interventionId;
    data['LastOptimizationDate'] = this.lastOptimizationDate;
    data['Letter'] = this.letter;
    data['LetterSent'] = this.letterSent;
    data['MandatoryTechId'] = this.mandatoryTechId;
    data['ModemIssue'] = this.modemIssue;
    data['NewTttReason'] = this.newTttReason;
    data['NoModem'] = this.noModem;
    data['OnHold'] = this.onHold;
    data['OnHoldUntil'] = this.onHoldUntil;
    data['OptimizationCount'] = this.optimizationCount;
    data['OrderInTrip'] = this.orderInTrip;
    data['Pathology'] = this.pathology;
    data['PatientId'] = this.patientId;
    data['PdaStatus'] = this.pdaStatus;
    data['PrescId'] = this.prescId;
    data['RegionId'] = this.regionId;
    data['RenderedTreatmentId'] = this.renderedTreatmentId;
    data['RequestId'] = this.requestId;
    data['ServiceType'] = this.serviceType;
    data['Site'] = this.site;
    data['SmsStatus'] = this.smsStatus;
    data['Status'] = this.status;
    data['TRCRealizationDate'] = this.tRCRealizationDate;
    data['Therapy'] = this.therapy;
    data['TrcAgreed'] = this.trcAgreed;
    data['TrcComment'] = this.trcComment;
    data['TrcForecastedDate'] = this.trcForecastedDate;
    data['TreatmentId'] = this.treatmentId;
    data['TreatmentStatus'] = this.treatmentStatus;
    data['TripId'] = this.tripId;
    if (this.trip != null) {
      data['trip'] = this.trip.toJson();
    }
    return data;
  }

  @override
  List<Object> get props => [
        this.addressId,
        this.agreed,
        this.comment,
        this.deliveryWindEnd,
        this.deliveryWindStart,
        this.duration,
        this.forecastedDate,
        this.interventionId,
        this.lastOptimizationDate,
        this.letter,
        this.letterSent,
        this.mandatoryTechId,
        this.modemIssue,
        this.newTttReason,
        this.noModem,
        this.onHold,
        this.onHoldUntil,
        this.optimizationCount,
        this.orderInTrip,
        this.pathology,
        this.patientId,
        this.pdaStatus,
        this.prescId,
        this.regionId,
        this.renderedTreatmentId,
        this.requestId,
        this.serviceType,
        this.site,
        this.smsStatus,
        this.status,
        this.tRCRealizationDate,
        this.therapy,
        this.trcAgreed,
        this.trcComment,
        this.trcForecastedDate,
        this.treatmentId,
        this.treatmentStatus,
        this.tripId,
        this.trip
      ];
}

class Trip extends Equatable {
  final bool done;
  final String finishHour;
  final bool isOptimized;
  final double kms;
  final String lunchTime;
  final String startHour;
  final int techId;
  final int trcExpedId;
  final String tripComment;
  final String tripDate;
  final int tripId;
  final String tripType;
  final Technician technician;

  Trip(
      {this.done,
      this.finishHour,
      this.isOptimized,
      this.kms,
      this.lunchTime,
      this.startHour,
      this.techId,
      this.trcExpedId,
      this.tripComment,
      this.tripDate,
      this.tripId,
      this.tripType,
      this.technician});

  static Trip fromJson(Map<String, dynamic> json) {
    Technician technician = json['technician'] != null
        ? Technician.fromJson(json['technician'])
        : null;
    Trip trip = new Trip(
        done: json['Done'],
        finishHour: json['FinishHour'],
        isOptimized: json['IsOptimized'],
        kms: json['Kms'],
        lunchTime: json['LunchTime'],
        startHour: json['StartHour'],
        techId: json['TechId'],
        technician: technician,
        trcExpedId: json['TrcExpedId'],
        tripComment: json['TripComment'],
        tripDate: json['TripDate'],
        tripId: json['TripId'],
        tripType: json['TripType']);

    return trip;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Done'] = this.done;
    data['FinishHour'] = this.finishHour;
    data['IsOptimized'] = this.isOptimized;
    data['Kms'] = this.kms;
    data['LunchTime'] = this.lunchTime;
    data['StartHour'] = this.startHour;
    data['TechId'] = this.techId;
    data['TrcExpedId'] = this.trcExpedId;
    data['TripComment'] = this.tripComment;
    data['TripDate'] = this.tripDate;
    data['TripId'] = this.tripId;
    data['TripType'] = this.tripType;
    if (this.technician != null) {
      data['technician'] = this.technician.toJson();
    }
    return data;
  }

  @override
  List<Object> get props => [
        this.done,
        this.finishHour,
        this.isOptimized,
        this.kms,
        this.lunchTime,
        this.startHour,
        this.techId,
        this.trcExpedId,
        this.tripComment,
        this.tripDate,
        this.tripId,
        this.tripType,
        this.technician
      ];
}

class Technician extends Equatable {
  final int agencyFriday;
  final int agencyFridayDuration;
  final int agencyMonday;
  final int agencyMondayDuration;
  final int agencySatursday;
  final int agencySatursdayDuration;
  final int agencyThursday;
  final int agencyThursdayDuration;
  final int agencyTuesday;
  final int agencyTuesdayDuration;
  final int agencyWednesday;
  final int agencyWednesdayDuration;
  final String commentFriday;
  final String commentMonday;
  final String commentSatursday;
  final String commentThursday;
  final String commentTuesday;
  final String commentWednesday;
  final int defaultRegionId;
  final String email;
  final String emailCopy;
  final String endDate;
  final int endingPointId;
  final int exportTechId;
  final String finishHourJ1;
  final String finishHourMail;
  final String firstName;
  final String hasMaps;
  final String hasStats;
  final String initials;
  final bool isLoxTechnician;
  final bool isPdaHS;
  final int jobPerDayTarget;
  final String lastName;
  final int longTermTripId;
  final int mealDuration;
  final String otherParticularities;
  final String packageType;
  final String phone;
  final int preferedBranchAgency;
  final int profileId;
  final int regionFriday;
  final int regionMonday;
  final int regionWednesday;
  final int regionsaturday;
  final int regionthursday;
  final int regiontuesday;
  final double speedFactor;
  final String startDate;
  final String startHourFriday;
  final String startHourJ1;
  final String startHourMail;
  final String startHourMonday;
  final String startHourSatursday;
  final String startHourThursday;
  final String startHourTuesday;
  final String startHourWednesday;
  final int startingPointId;
  final int techId;
  final int vehiculeTypeId;
  final int workDuration;
  final int workDurationFriday;
  final int workDurationSaturday;

  Technician(
      {this.agencyFriday,
      this.agencyFridayDuration,
      this.agencyMonday,
      this.agencyMondayDuration,
      this.agencySatursday,
      this.agencySatursdayDuration,
      this.agencyThursday,
      this.agencyThursdayDuration,
      this.agencyTuesday,
      this.agencyTuesdayDuration,
      this.agencyWednesday,
      this.agencyWednesdayDuration,
      this.commentFriday,
      this.commentMonday,
      this.commentSatursday,
      this.commentThursday,
      this.commentTuesday,
      this.commentWednesday,
      this.defaultRegionId,
      this.email,
      this.emailCopy,
      this.endDate,
      this.endingPointId,
      this.exportTechId,
      this.finishHourJ1,
      this.finishHourMail,
      this.firstName,
      this.hasMaps,
      this.hasStats,
      this.initials,
      this.isLoxTechnician,
      this.isPdaHS,
      this.jobPerDayTarget,
      this.lastName,
      this.longTermTripId,
      this.mealDuration,
      this.otherParticularities,
      this.packageType,
      this.phone,
      this.preferedBranchAgency,
      this.profileId,
      this.regionFriday,
      this.regionMonday,
      this.regionWednesday,
      this.regionsaturday,
      this.regionthursday,
      this.regiontuesday,
      this.speedFactor,
      this.startDate,
      this.startHourFriday,
      this.startHourJ1,
      this.startHourMail,
      this.startHourMonday,
      this.startHourSatursday,
      this.startHourThursday,
      this.startHourTuesday,
      this.startHourWednesday,
      this.startingPointId,
      this.techId,
      this.vehiculeTypeId,
      this.workDuration,
      this.workDurationFriday,
      this.workDurationSaturday});

  static Technician fromJson(Map<String, dynamic> json) {
    Technician technician = new Technician(
        agencyFriday: json['AgencyFriday'],
        agencyFridayDuration: json['AgencyFridayDuration'],
        agencyMonday: json['AgencyMonday'],
        agencyMondayDuration: json['AgencyMondayDuration'],
        agencySatursday: json['AgencySatursday'],
        agencySatursdayDuration: json['AgencySatursdayDuration'],
        agencyThursday: json['AgencyThursday'],
        agencyThursdayDuration: json['AgencyThursdayDuration'],
        agencyTuesday: json['AgencyTuesday'],
        agencyTuesdayDuration: json['AgencyTuesdayDuration'],
        agencyWednesday: json['AgencyWednesday'],
        agencyWednesdayDuration: json['AgencyWednesdayDuration'],
        commentFriday: json['CommentFriday'],
        commentMonday: json['CommentMonday'],
        commentSatursday: json['CommentSatursday'],
        commentThursday: json['CommentThursday'],
        commentTuesday: json['CommentTuesday'],
        commentWednesday: json['CommentWednesday'],
        defaultRegionId: json['DefaultRegionId'],
        email: json['Email'],
        emailCopy: json['EmailCopy'],
        endDate: json['EndDate'],
        endingPointId: json['EndingPointId'],
        exportTechId: json['ExportTechId'],
        finishHourJ1: json['FinishHourJ1'],
        finishHourMail: json['FinishHourMail'],
        firstName: json['FirstName'],
        hasMaps: json['HasMaps'],
        hasStats: json['HasStats'],
        initials: json['Initials'],
        isLoxTechnician: json['IsLoxTechnician'],
        isPdaHS: json['IsPdaHS'],
        jobPerDayTarget: json['JobPerDayTarget'],
        lastName: json['LastName'],
        longTermTripId: json['LongTermTripId'],
        mealDuration: json['MealDuration'],
        otherParticularities: json['OtherParticularities'],
        packageType: json['PackageType'],
        phone: json['Phone'],
        preferedBranchAgency: json['PreferedBranchAgency'],
        profileId: json['ProfileId'],
        regionFriday: json['RegionFriday'],
        regionMonday: json['RegionMonday'],
        regionWednesday: json['RegionWednesday'],
        regionsaturday: json['Regionsaturday'],
        regionthursday: json['Regionthursday'],
        regiontuesday: json['Regiontuesday'],
        speedFactor: json['SpeedFactor'],
        startDate: json['StartDate'],
        startHourFriday: json['StartHourFriday'],
        startHourJ1: json['StartHourJ1'],
        startHourMail: json['StartHourMail'],
        startHourMonday: json['StartHourMonday'],
        startHourSatursday: json['StartHourSatursday'],
        startHourThursday: json['StartHourThursday'],
        startHourTuesday: json['StartHourTuesday'],
        startHourWednesday: json['StartHourWednesday'],
        startingPointId: json['StartingPointId'],
        techId: json['TechId'],
        vehiculeTypeId: json['VehiculeTypeId'],
        workDuration: json['WorkDuration'],
        workDurationFriday: json['WorkDurationFriday'],
        workDurationSaturday: json['WorkDurationSaturday']);

    return technician;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AgencyFriday'] = this.agencyFriday;
    data['AgencyFridayDuration'] = this.agencyFridayDuration;
    data['AgencyMonday'] = this.agencyMonday;
    data['AgencyMondayDuration'] = this.agencyMondayDuration;
    data['AgencySatursday'] = this.agencySatursday;
    data['AgencySatursdayDuration'] = this.agencySatursdayDuration;
    data['AgencyThursday'] = this.agencyThursday;
    data['AgencyThursdayDuration'] = this.agencyThursdayDuration;
    data['AgencyTuesday'] = this.agencyTuesday;
    data['AgencyTuesdayDuration'] = this.agencyTuesdayDuration;
    data['AgencyWednesday'] = this.agencyWednesday;
    data['AgencyWednesdayDuration'] = this.agencyWednesdayDuration;
    data['CommentFriday'] = this.commentFriday;
    data['CommentMonday'] = this.commentMonday;
    data['CommentSatursday'] = this.commentSatursday;
    data['CommentThursday'] = this.commentThursday;
    data['CommentTuesday'] = this.commentTuesday;
    data['CommentWednesday'] = this.commentWednesday;
    data['DefaultRegionId'] = this.defaultRegionId;
    data['Email'] = this.email;
    data['EmailCopy'] = this.emailCopy;
    data['EndDate'] = this.endDate;
    data['EndingPointId'] = this.endingPointId;
    data['ExportTechId'] = this.exportTechId;
    data['FinishHourJ1'] = this.finishHourJ1;
    data['FinishHourMail'] = this.finishHourMail;
    data['FirstName'] = this.firstName;
    data['HasMaps'] = this.hasMaps;
    data['HasStats'] = this.hasStats;
    data['Initials'] = this.initials;
    data['IsLoxTechnician'] = this.isLoxTechnician;
    data['IsPdaHS'] = this.isPdaHS;
    data['JobPerDayTarget'] = this.jobPerDayTarget;
    data['LastName'] = this.lastName;
    data['LongTermTripId'] = this.longTermTripId;
    data['MealDuration'] = this.mealDuration;
    data['OtherParticularities'] = this.otherParticularities;
    data['PackageType'] = this.packageType;
    data['Phone'] = this.phone;
    data['PreferedBranchAgency'] = this.preferedBranchAgency;
    data['ProfileId'] = this.profileId;
    data['RegionFriday'] = this.regionFriday;
    data['RegionMonday'] = this.regionMonday;
    data['RegionWednesday'] = this.regionWednesday;
    data['Regionsaturday'] = this.regionsaturday;
    data['Regionthursday'] = this.regionthursday;
    data['Regiontuesday'] = this.regiontuesday;
    data['SpeedFactor'] = this.speedFactor;
    data['StartDate'] = this.startDate;
    data['StartHourFriday'] = this.startHourFriday;
    data['StartHourJ1'] = this.startHourJ1;
    data['StartHourMail'] = this.startHourMail;
    data['StartHourMonday'] = this.startHourMonday;
    data['StartHourSatursday'] = this.startHourSatursday;
    data['StartHourThursday'] = this.startHourThursday;
    data['StartHourTuesday'] = this.startHourTuesday;
    data['StartHourWednesday'] = this.startHourWednesday;
    data['StartingPointId'] = this.startingPointId;
    data['TechId'] = this.techId;
    data['VehiculeTypeId'] = this.vehiculeTypeId;
    data['WorkDuration'] = this.workDuration;
    data['WorkDurationFriday'] = this.workDurationFriday;
    data['WorkDurationSaturday'] = this.workDurationSaturday;
    return data;
  }

  @override
  List<Object> get props => [
        this.agencyFriday,
        this.agencyFridayDuration,
        this.agencyMonday,
        this.agencyMondayDuration,
        this.agencySatursday,
        this.agencySatursdayDuration,
        this.agencyThursday,
        this.agencyThursdayDuration,
        this.agencyTuesday,
        this.agencyTuesdayDuration,
        this.agencyWednesday,
        this.agencyWednesdayDuration,
        this.commentFriday,
        this.commentMonday,
        this.commentSatursday,
        this.commentThursday,
        this.commentTuesday,
        this.commentWednesday,
        this.defaultRegionId,
        this.email,
        this.emailCopy,
        this.endDate,
        this.endingPointId,
        this.exportTechId,
        this.finishHourJ1,
        this.finishHourMail,
        this.firstName,
        this.hasMaps,
        this.hasStats,
        this.initials,
        this.isLoxTechnician,
        this.isPdaHS,
        this.jobPerDayTarget,
        this.lastName,
        this.longTermTripId,
        this.mealDuration,
        this.otherParticularities,
        this.packageType,
        this.phone,
        this.preferedBranchAgency,
        this.profileId,
        this.regionFriday,
        this.regionMonday,
        this.regionWednesday,
        this.regionsaturday,
        this.regionthursday,
        this.regiontuesday,
        this.speedFactor,
        this.startDate,
        this.startHourFriday,
        this.startHourJ1,
        this.startHourMail,
        this.startHourMonday,
        this.startHourSatursday,
        this.startHourThursday,
        this.startHourTuesday,
        this.startHourWednesday,
        this.startingPointId,
        this.techId,
        this.vehiculeTypeId,
        this.workDuration,
        this.workDurationFriday,
        this.workDurationSaturday
      ];
}
