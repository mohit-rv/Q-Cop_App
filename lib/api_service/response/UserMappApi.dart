class UserMap {
  int? internalID;
  int? uID;
  int? prjID;
  String? prjAccess;
  String? qaAccess;
  String? hseAccess;
  String? snagAccess;
  String? obsAccess;
  String? boQAccess;
  String? pMAccess;
  String? matAccess;
  String? dlrAccess;

  UserMap(
      {this.internalID,
        this.uID,
        this.prjID,
        this.prjAccess,
        this.qaAccess,
        this.hseAccess,
        this.snagAccess,
        this.obsAccess,
        this.boQAccess,
        this.pMAccess,
        this.matAccess,
        this.dlrAccess});

  UserMap.fromJson(Map<String, dynamic> json) {
    internalID = json['InternalID'];
    uID = json['UID'];
    prjID = json['PrjID'];
    prjAccess = json['PrjAccess'];
    qaAccess = json['QaAccess'];
    hseAccess = json['HseAccess'];
    snagAccess = json['SnagAccess'];
    obsAccess = json['ObsAccess'];
    boQAccess = json['BoQAccess'];
    pMAccess = json['PMAccess'];
    matAccess = json['MatAccess'];
    dlrAccess = json['DlrAccess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['InternalID'] = this.internalID;
    data['UID'] = this.uID;
    data['PrjID'] = this.prjID;
    data['PrjAccess'] = this.prjAccess;
    data['QaAccess'] = this.qaAccess;
    data['HseAccess'] = this.hseAccess;
    data['SnagAccess'] = this.snagAccess;
    data['ObsAccess'] = this.obsAccess;
    data['BoQAccess'] = this.boQAccess;
    data['PMAccess'] = this.pMAccess;
    data['MatAccess'] = this.matAccess;
    data['DlrAccess'] = this.dlrAccess;
    return data;
  }
}