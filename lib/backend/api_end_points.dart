/// baseUrl: 'http://3.28.14.143:4000/star-backend/api/',

class ApiEndPoints {

  final String imageBaseUrl = "http://3.28.14.143:4000/star-backend/";

  /// OnBoarding EndPoints
  final String loginNewUser = "auth/send-otp";
  final String otp = "auth/login";

  /// About Us EndPoints
  final String aboutUs = "settings/page/aboutus";

  /// DashBoard EndPoints
  final String getNewsBroadCast = "newsBroadcast/list";

  /// Complaint & Report EndPoints
  final String getAllComplaintReport = "complaintReport/get-all";
  final String updateComplaintReport = "complaintReport/update/";
  final String createComplaintReport = "complaintReport/add";
  final String deleteComplaintReport = "complaintReport/delete/";
  final String getComplaintType = "complaintType/get-all/";
  final String acceptComplaintReport = "complaintReport/resolve/";
  final String addCommentComplaintReport = "complaintReport/add-comment/";

  /// Feedback & Help EndPoints
  final String getAllFeedbackHelp = "feedbackHelp/get-all";
  final String updateFeedbackHelp = "feedbackHelp/update/";
  final String createFeedbackHelp = "feedbackHelp/add";
  final String deleteFeedbackHelp = "feedbackHelp/delete/";
  final String sendCommentFeedbackHelp = "feedbackHelp/add-comment/";
  final String acceptFeedbackHelp = "feedbackHelp/resolve/";

  /// Lost & Found EndPoints
  final String getAllLostFound = "lostFound/get-all";
  final String deleteLostFound = "lostFound/delete/";
  final String returnLostFound = "lostFound/return-request/";
  final String createLostFound = "lostFound/add-request";

  /// My Profile EndPoints
  final String getMyProfile = "user/profileDetails";
  final String updateMyProfile = "staff/update/";

  /// School Data EndPoints
  final String getSchoolList = "school/get/list";

  /// Family EndPoints
  final String familyMemberDetail = "staff/family/detail/";
  final String deleteFamilyMember = "staff/family/delete/";
  final String createFamilyMember = "staff/family/create";
  final String editFamilyMember = "staff/family/update/";

  /// Roles EndPoints
  final String getAllRoles = "role/getAll";

  /// Notebook EndPoints
  final String getNotebookList = "notebook/list";
  final String updateNotebook = "notebook/update/";
  final String createNotebook = "notebook/create";
  final String getDetailNotebook = "notebook/detail/";
  final String deleteNotebook = "notebook/delete/";

  /// Sticky Notes (My Notes)
  final String getStickyNotesList = "stickyNotes/list";
  final String createStickyNote = "stickyNotes/create";
  final String getStickyNoteDetail = "stickyNotes/detail/";
  final String updateStickyNote = "stickyNotes/update/";
  final String deleteStickyNote = "stickyNotes/delete/";

  /// Staff EndPoints
  final String getStaffData = "complaintReport/staff";

  /// Notifications EndPoints
  final String getNotificationList = "notification/list";

  /// Stars EndPoints
  final String getStarsList = "registerStar/star_list";

  /// Star Reward EndPoints
  final String getStarsReward = "reward/get-all?user[]=";
  final String viewRewardHistory = "reward/view-history/";
  final String createReward = "reward/add";
  final String giveReward = "reward/add-reward";
  final String updateRewardImage = "reward/update/";

  /// Star Attendance EndPoints
  final String getStarAttendanceList = "starAttendence/list";
  final String addStarAttendance = "starAttendence/add";
  final String changeStarAttendanceStatus = "starAttendence/change-status/";

  /// Task & Reminder EndPoints
  final String getAllTaskReminders = "reminder/get-all";
  final String deleteTaskReminder = "reminder/delete/";
  final String updateTaskReminder = "reminder/update/";
  final String createTaskReminder = "reminder/add-request";

  /// Schedule Meeting EndPoints
  final String scheduleNewMeeting = "requestRoutes/create";
  final String getScheduledMeetings = "requestRoutes/list";
  final String rescheduleMeeting = "requestRoutes/updateRequestStatus/";
  final String updateScheduledMeetingStatus = "requestRoutes/updateRequestStatus/";

  /// Star Gallery EndPoints
  final String getStarGallery = "starGallery/list";
  final String getStarGalleryCategory = "starGallery/galleryCategory";
  final String createStarGallery = "starGallery/create";

  /// Class EndPoints
  final String getClasses = "class/getAllClass";
  final String getClassSection = "class/section/getall";
}