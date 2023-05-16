/// baseUrl: 'http://3.28.14.143:4000/star-backend/api/',

class ApiEndPoints {
  /// OnBoarding EndPoints
  final String loginNewUser = "auth/send-otp";
  final String otp = "auth/login";

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

  /// Get Staff Data
  final String getStaffData = "complaintReport/staff";

  /// Notifications EndPoints
  final String getNotificationList = "notification/list";
}