class UsersTableListAPI {
  int? uid;
  int? userGroupID;
  String? loginName;
  String? password;
  String? firstName;
  String? lastName;
  String? emailID;
  String? accessRights;
  String? designation;
  String? pAssigned;
  String? active;
  int? companyID;
  String? phoneNumber;
  String? lastWebLogin;
  String? lastWebAction;
  String? lastTabAction;
  String? lastActionOn;
  int? escLevel;
  String? deletion;
  String? policyAccepted;
  String? policyAcceptedOn;

  UsersTableListAPI(
      {this.uid,
        this.userGroupID,
        this.loginName,
        this.password,
        this.firstName,
        this.lastName,
        this.emailID,
        this.accessRights,
        this.designation,
        this.pAssigned,
        this.active,
        this.companyID,
        this.phoneNumber,
        this.lastWebLogin,
        this.lastWebAction,
        this.lastTabAction,
        this.lastActionOn,
        this.escLevel,
        this.deletion,
        this.policyAccepted,
        this.policyAcceptedOn});

  UsersTableListAPI.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    userGroupID = json['UserGroupID'];
    loginName = json['LoginName'];
    password = json['Password'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    emailID = json['EmailID'];
    accessRights = json['AccessRights'];
    designation = json['Designation'];
    pAssigned = json['PAssigned'];
    active = json['Active'];
    companyID = json['CompanyID'];
    phoneNumber = json['PhoneNumber'];
    lastWebLogin = json['LastWebLogin'];
    lastWebAction = json['LastWebAction'];
    lastTabAction = json['LastTabAction'];
    lastActionOn = json['LastActionOn'];
    escLevel = json['EscLevel'];
    deletion = json['Deletion'];
    policyAccepted = json['PolicyAccepted'];
    policyAcceptedOn = json['PolicyAcceptedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['UserGroupID'] = this.userGroupID;
    data['LoginName'] = this.loginName;
    data['Password'] = this.password;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['EmailID'] = this.emailID;
    data['AccessRights'] = this.accessRights;
    data['Designation'] = this.designation;
    data['PAssigned'] = this.pAssigned;
    data['Active'] = this.active;
    data['CompanyID'] = this.companyID;
    data['PhoneNumber'] = this.phoneNumber;
    data['LastWebLogin'] = this.lastWebLogin;
    data['LastWebAction'] = this.lastWebAction;
    data['LastTabAction'] = this.lastTabAction;
    data['LastActionOn'] = this.lastActionOn;
    data['EscLevel'] = this.escLevel;
    data['Deletion'] = this.deletion;
    data['PolicyAccepted'] = this.policyAccepted;
    data['PolicyAcceptedOn'] = this.policyAcceptedOn;
    return data;
  }
}