class MeetingModel {
  String? meetName, meetTime, meetDate;

  MeetingModel(
    this.meetName,
    this.meetDate,
    this.meetTime,
  );
}

class ListMeeting {
  static List<MeetingModel>? listMeeting = [
    MeetingModel("Daily Design Meeting", "07/12/2022", "09.00 AM - 10.00 AM"),
  ];
}
