

class ProjectListResponseModel {
  int? pID;
  String? projectCode;
  String? projectName;
  String? projectDescription;
  String? startDate;
  String? endDate;
  String? customer;
  String? subContract;
  String? status;
  String? location;
  int? uid;
  String? autoEmailAlert;
  bool? rFIDBarCodeEnabled;
  String? levelScanMode;
  String? actMappingReqrd;

  ProjectListResponseModel(
      {this.pID,
        this.projectCode,
        this.projectName,
        this.projectDescription,
        this.startDate,
        this.endDate,
        this.customer,
        this.subContract,
        this.status,
        this.location,
        this.uid,
        this.autoEmailAlert,
        this.rFIDBarCodeEnabled,
        this.levelScanMode,
        this.actMappingReqrd});

  ProjectListResponseModel.fromJson(Map<String, dynamic> json) {
    pID = json['PID'];
    projectCode = json['ProjectCode'];
    projectName = json['ProjectName'];
    projectDescription = json['ProjectDescription'];
    startDate = json['StartDate'];
    endDate = json['EndDate'];
    customer = json['Customer'];
    subContract = json['SubContract'];
    status = json['Status'];
    location = json['Location'];
    uid = json['uid'];
    autoEmailAlert = json['AutoEmailAlert'];
    rFIDBarCodeEnabled = json['RFID_BarCode_Enabled'];
    levelScanMode = json['LevelScanMode'];
    actMappingReqrd = json['ActMappingReqrd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PID'] = this.pID;
    data['ProjectCode'] = this.projectCode;
    data['ProjectName'] = this.projectName;
    data['ProjectDescription'] = this.projectDescription;
    data['StartDate'] = this.startDate;
    data['EndDate'] = this.endDate;
    data['Customer'] = this.customer;
    data['SubContract'] = this.subContract;
    data['Status'] = this.status;
    data['Location'] = this.location;
    data['uid'] = this.uid;
    data['AutoEmailAlert'] = this.autoEmailAlert;
    data['RFID_BarCode_Enabled'] = this.rFIDBarCodeEnabled;
    data['LevelScanMode'] = this.levelScanMode;
    data['ActMappingReqrd'] = this.actMappingReqrd;
    return data;
  }
}