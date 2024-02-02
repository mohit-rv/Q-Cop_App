

class UserMappingModel {

  final int? UID;
  final int? PrjID;
  final String PrjAccess;
  final String QaAccess;
  final String HseAccess;
  final String SnagAccess;
  final String ObsAccess;
  final String BoqAccess;
  final String PmAccess;
  final String MatAccess;
  final String DlrAccess;

  UserMappingModel({required this.UID,required this.PrjID,required this.PrjAccess,required this.QaAccess,required this.HseAccess,
  required this.SnagAccess,required this.ObsAccess,required this.BoqAccess,required this.PmAccess,required this.DlrAccess,
    required this.MatAccess
  });


  UserMappingModel.fromMap(Map<String, dynamic> res):
      UID = res['uid'],
      PrjID= res['prjid'],
      PrjAccess= res['prjacces'],
        QaAccess = res['qaacces'],
        HseAccess= res['hseacces'],
      SnagAccess = res['snagacces'],
      ObsAccess = res['obsacces'],
      BoqAccess = res['boqacces'],
      PmAccess = res['pmacces'],
      MatAccess = res['matacces'],
      DlrAccess = res['dlracces'];

  Map<String, Object?> toMap() {
    return {
          'uid': UID,
          'PrjID': PrjID,
          'PrjAccess': PrjAccess,
          'QaAccess': QaAccess,
          'HseAccess': HseAccess,
          'SnagAccess': SnagAccess,
          'ObsAccess': ObsAccess,
          'BoqAccess': BoqAccess,
          'PmAccess': PmAccess,
          'MatAccess': MatAccess,
          'DlrAccess': DlrAccess
    };
  }

}
