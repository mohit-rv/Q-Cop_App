

import 'dart:typed_data';

class UserModel {
    final int? CompanyID;
    final int? uid;
    final String LoginName;
    final String Password;
    final String FirstName;
    final String LastName;
    final String AccessRights;
    final String Designation;
    final String PAssigned;
    final String Active;

  UserModel({required this.CompanyID,required this.uid,required this.LoginName,required this.Password,required this.FirstName,required this.LastName,
    required this.AccessRights,required this.Designation,required this.PAssigned,required this.Active});

  UserModel.fromMap(Map<String, dynamic> res):
          CompanyID = res['companyID'],
          uid = res['Uid'],
          LoginName = res['LoginName'],
          LastName = res['LastName'],
          FirstName = res['firstName'],
          Password  = res['Password'],
          AccessRights = res['AccessRights'],
          Designation = res['Designation'],
          PAssigned = res['PAssigned'],
          Active = res['Active'];

    Map<String, Object?> toMap(){
      return {
          'companyID': CompanyID,
          'Uid': uid,
          'LoginName': LoginName,
          'LastName': LastName,
          'firstName': FirstName,
          'Password': Password,
          'AccessRights': AccessRights,
          'Designation': Designation,
          'PAssigned': PAssigned,
          'Active': Active

      };
    }


}