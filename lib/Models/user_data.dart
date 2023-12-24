class UserObtainedData {
  String? message;
  Data? data;

  UserObtainedData({this.message, this.data});

  UserObtainedData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? userId;
  String? countryCode;
  String? imageId;
  String? name;
  String? emailId;
  int? status;
  int? accountTypeId;
  String? purchaseValidity;
  String? inviteLink;
  String? token;
  String? mobileNumber;
  int? isPremium;

  bool? isHiringSelected;
  bool? atLeastHiringSelected;
  String? userMode;
  bool? needToDoOnboarding;
  PreviousUserMode? previousUserMode;

  Data(
      {this.userId,
      this.countryCode,
      this.imageId,
      this.name,
      this.emailId,
      this.status,
      this.accountTypeId,
      this.purchaseValidity,
      this.inviteLink,
      this.token,
      this.mobileNumber,
      this.isPremium,
      this.isHiringSelected,
      this.atLeastHiringSelected,
      this.userMode,
      this.needToDoOnboarding,
      this.previousUserMode});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    countryCode = json['country_code'];
    imageId = json['image_id'];
    name = json['name'];
    emailId = json['email_id'];
    status = json['status'];
    accountTypeId = json['account_type_id'];
    purchaseValidity = json['purchase_validity'];
    inviteLink = json['invite_link'];
    token = json['token'];
    mobileNumber = json['mobile_number'];
    isPremium = json['is_premium'];
    inviteLink = json['inviteLink'];
    isHiringSelected = json['isHiringSelected'];
    atLeastHiringSelected = json['atLeastHiringSelected'];
    userMode = json['userMode'];
    needToDoOnboarding = json['needToDoOnboarding'];
    previousUserMode = json['previousUserMode'] != null
        ? new PreviousUserMode.fromJson(json['previousUserMode'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['country_code'] = this.countryCode;
    data['image_id'] = this.imageId;
    data['name'] = this.name;
    data['email_id'] = this.emailId;
    data['status'] = this.status;
    data['account_type_id'] = this.accountTypeId;
    data['purchase_validity'] = this.purchaseValidity;
    data['invite_link'] = this.inviteLink;
    data['token'] = this.token;
    data['mobile_number'] = this.mobileNumber;
    data['is_premium'] = this.isPremium;
    data['inviteLink'] = this.inviteLink;
    data['isHiringSelected'] = this.isHiringSelected;
    data['atLeastHiringSelected'] = this.atLeastHiringSelected;
    data['userMode'] = this.userMode;
    data['needToDoOnboarding'] = this.needToDoOnboarding;
    if (this.previousUserMode != null) {
      data['previousUserMode'] = this.previousUserMode!.toJson();
    }
    return data;
  }
}

class PreviousUserMode {
  String? mode;
  String? createdAt;

  PreviousUserMode({this.mode, this.createdAt});

  PreviousUserMode.fromJson(Map<String, dynamic> json) {
    mode = json['mode'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mode'] = this.mode;
    data['created_at'] = this.createdAt;
    return data;
  }
}
