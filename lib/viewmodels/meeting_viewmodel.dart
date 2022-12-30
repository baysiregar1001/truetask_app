import 'package:truetask_app/models/meeting.dart';

class ListMeetingViewModel {
  ListMeeting? listMeeting;
  List<MeetingViewModel>? listMeetingViewModel;
}

class MeetingViewModel {
  final MeetingModel? meetingModel;
  MeetingViewModel(this.meetingModel);
}
