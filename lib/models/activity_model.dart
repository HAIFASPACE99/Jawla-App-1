class Activity {
  int? activityId;
  String? activityName;
  String? activityPrice;
  String? activityCity;
  String? activityDescription;
  String? activityPic;
  String? activityMapLocation;
  List<ActivityDuration>? activityDuration;
  List<ActivityPictures>? activityPictures;

  Activity(
      {this.activityId,
      this.activityName,
      this.activityPrice,
      this.activityCity,
      this.activityDescription,
      this.activityPic,
      this.activityMapLocation,
      this.activityDuration,
      this.activityPictures});

  Activity.fromJson(Map<String, dynamic> json) {
    activityId = json['id'];
    activityName = json['activity_name'];
    activityPrice = json['activity_price'];
    activityCity = json['activity_city'];
    activityDescription = json['activity_description'];
    activityPic = json['activity_pic'];
    activityMapLocation = json['activity_map_location'];
    if (json['activity_duration'] != null) {
      activityDuration = <ActivityDuration>[];
      json['activity_duration'].forEach((v) {
        activityDuration!.add(ActivityDuration.fromJson(v));
      });
    }
    if (json['activity_pictures'] != null) {
      activityPictures = <ActivityPictures>[];
      json['activity_pictures'].forEach((v) {
        activityPictures!.add(ActivityPictures.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = activityId;
    data['activity_name'] = activityName;
    data['activity_price'] = activityPrice;
    data['activity_city'] = activityCity;
    data['activity_description'] = activityDescription;
    data['activity_pic'] = activityPic;
    data['activity_map_location'] = activityMapLocation;
    if (activityDuration != null) {
      data['activity_duration'] =
          activityDuration!.map((v) => v.toJson()).toList();
    }
    if (activityPictures != null) {
      data['activity_pictures'] =
          activityPictures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ActivityDuration {
  String? activityDate;
  String? activityStartTime;
  String? activityEndTime;

  ActivityDuration(
      {this.activityDate, this.activityStartTime, this.activityEndTime});

  ActivityDuration.fromJson(Map<String, dynamic> json) {
    activityDate = json['activity_date'];
    activityStartTime = json['activity_start_time'];
    activityEndTime = json['activity_end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activity_date'] = activityDate;
    data['activity_start_time'] = activityStartTime;
    data['activity_end_time'] = activityEndTime;
    return data;
  }
}

class ActivityPictures {
  String? pictureUrl;

  ActivityPictures({this.pictureUrl});

  ActivityPictures.fromJson(Map<String, dynamic> json) {
    pictureUrl = json['picture_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['picture_url'] = pictureUrl;
    return data;
  }
}
