class JobElementData {
  String? type;
  CardData? cardData;

  JobElementData({this.type, this.cardData});

  JobElementData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    cardData = json['cardData'] != null
        ? new CardData.fromJson(json['cardData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.cardData != null) {
      data['cardData'] = this.cardData!.toJson();
    }
    return data;
  }
}

class CardData {
  int? showOrganisation;
  int? offerId;
  int? userId;
  String? companyName;
  int? offerTypeId;
  String? description;
  String? url;
  int? lowerworkex;
  int? upperworkex;
  String? monthlyCompensation;
  Null? hourlyCompensation;
  int? monthlyCompensationId;
  Null? hourlyCompensationId;
  int? isRemote;
  Null? redirectUrl;
  Null? minScore;
  Null? minAge;
  Null? maxAge;
  String? locationCity;
  double? distance;
  int? isOrganic;
  String? title;
  Null? industryTypeId;
  Null? industryType;
  int? jobFunctionId;
  int? designationId;
  String? designation;
  String? date;
  bool? hasApplied;
  bool? needToRedirect;
  bool? jobSaved;
  bool? isBusinessOpportunity;
  bool? showRelocateModal;
  List<Skills>? skills;
  List<JobType>? jobType;
  String? displayCompensation;
  String? relativeTime;
  String? postedAtRelative;
  bool? hasLiked;
  UserInfo? userInfo;

  CardData(
      {this.showOrganisation,
      this.offerId,
      this.userId,
      this.companyName,
      this.offerTypeId,
      this.description,
      this.url,
      this.lowerworkex,
      this.upperworkex,
      this.monthlyCompensation,
      this.hourlyCompensation,
      this.monthlyCompensationId,
      this.hourlyCompensationId,
      this.isRemote,
      this.redirectUrl,
      this.minScore,
      this.minAge,
      this.maxAge,
      this.locationCity,
      this.distance,
      this.isOrganic,
      this.title,
      this.industryTypeId,
      this.industryType,
      this.jobFunctionId,
      this.designationId,
      this.designation,
      this.date,
      this.hasApplied,
      this.needToRedirect,
      this.jobSaved,
      this.isBusinessOpportunity,
      this.showRelocateModal,
      this.skills,
      this.jobType,
      this.displayCompensation,
      this.relativeTime,
      this.postedAtRelative,
      this.hasLiked,
      this.userInfo});

  CardData.fromJson(Map<String, dynamic> json) {
    showOrganisation = json['showOrganisation'];
    offerId = json['offerId'];
    userId = json['userId'];
    companyName = json['companyName'];
    offerTypeId = json['offerTypeId'];
    description = json['description'];
    url = json['url'];
    lowerworkex = json['lowerworkex'];
    upperworkex = json['upperworkex'];
    monthlyCompensation = json['monthly_compensation'];
    hourlyCompensation = json['hourly_compensation'];
    monthlyCompensationId = json['monthly_compensation_id'];
    hourlyCompensationId = json['hourly_compensation_id'];
    isRemote = json['is_remote'];
    redirectUrl = json['redirectUrl'];
    minScore = json['minScore'];
    minAge = json['minAge'];
    maxAge = json['maxAge'];
    locationCity = json['location_city'];
    distance = json['distance'];
    isOrganic = json['is_organic'];
    title = json['title'];
    industryTypeId = json['industry_type_id'];
    industryType = json['industry_type'];
    jobFunctionId = json['job_function_id'];
    designationId = json['designation_id'];
    designation = json['designation'];
    date = json['date'];
    hasApplied = json['hasApplied'];
    needToRedirect = json['needToRedirect'];
    jobSaved = json['jobSaved'];
    isBusinessOpportunity = json['isBusinessOpportunity'];
    showRelocateModal = json['showRelocateModal'];
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(new Skills.fromJson(v));
      });
    }
    if (json['jobType'] != null) {
      jobType = <JobType>[];
      json['jobType'].forEach((v) {
        jobType!.add(new JobType.fromJson(v));
      });
    }
    displayCompensation = json['displayCompensation'];
    relativeTime = json['relativeTime'];
    postedAtRelative = json['postedAtRelative'];
    hasLiked = json['hasLiked'];
    userInfo = json['userInfo'] != null
        ? new UserInfo.fromJson(json['userInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['showOrganisation'] = this.showOrganisation;
    data['offerId'] = this.offerId;
    data['userId'] = this.userId;
    data['companyName'] = this.companyName;
    data['offerTypeId'] = this.offerTypeId;
    data['description'] = this.description;
    data['url'] = this.url;
    data['lowerworkex'] = this.lowerworkex;
    data['upperworkex'] = this.upperworkex;
    data['monthly_compensation'] = this.monthlyCompensation;
    data['hourly_compensation'] = this.hourlyCompensation;
    data['monthly_compensation_id'] = this.monthlyCompensationId;
    data['hourly_compensation_id'] = this.hourlyCompensationId;
    data['is_remote'] = this.isRemote;
    data['redirectUrl'] = this.redirectUrl;
    data['minScore'] = this.minScore;
    data['minAge'] = this.minAge;
    data['maxAge'] = this.maxAge;
    data['location_city'] = this.locationCity;
    data['distance'] = this.distance;
    data['is_organic'] = this.isOrganic;
    data['title'] = this.title;
    data['industry_type_id'] = this.industryTypeId;
    data['industry_type'] = this.industryType;
    data['job_function_id'] = this.jobFunctionId;
    data['designation_id'] = this.designationId;
    data['designation'] = this.designation;
    data['date'] = this.date;
    data['hasApplied'] = this.hasApplied;
    data['needToRedirect'] = this.needToRedirect;
    data['jobSaved'] = this.jobSaved;
    data['isBusinessOpportunity'] = this.isBusinessOpportunity;
    data['showRelocateModal'] = this.showRelocateModal;
    if (this.skills != null) {
      data['skills'] = this.skills!.map((v) => v.toJson()).toList();
    }
    if (this.jobType != null) {
      data['jobType'] = this.jobType!.map((v) => v.toJson()).toList();
    }
    data['displayCompensation'] = this.displayCompensation;
    data['relativeTime'] = this.relativeTime;
    data['postedAtRelative'] = this.postedAtRelative;
    data['hasLiked'] = this.hasLiked;
    if (this.userInfo != null) {
      data['userInfo'] = this.userInfo!.toJson();
    }
    return data;
  }
}

class Skills {
  int? offerId;
  int? skillId;
  String? skill;

  Skills({this.offerId, this.skillId, this.skill});

  Skills.fromJson(Map<String, dynamic> json) {
    offerId = json['offerId'];
    skillId = json['skill_id'];
    skill = json['skill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offerId'] = this.offerId;
    data['skill_id'] = this.skillId;
    data['skill'] = this.skill;
    return data;
  }
}

class JobType {
  int? offerId;
  int? jobTypeId;
  String? jobType;

  JobType({this.offerId, this.jobTypeId, this.jobType});

  JobType.fromJson(Map<String, dynamic> json) {
    offerId = json['offerId'];
    jobTypeId = json['job_type_id'];
    jobType = json['job_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offerId'] = this.offerId;
    data['job_type_id'] = this.jobTypeId;
    data['job_type'] = this.jobType;
    return data;
  }
}

class UserInfo {
  int? userId;
  String? name;
  String? imageId;

  bool? isProfileVerified;

  UserInfo({this.userId, this.name, this.imageId, this.isProfileVerified});

  UserInfo.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    imageId = json['image_id'];

    isProfileVerified = json['isProfileVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['image_id'] = this.imageId;

    data['isProfileVerified'] = this.isProfileVerified;
    return data;
  }
}
