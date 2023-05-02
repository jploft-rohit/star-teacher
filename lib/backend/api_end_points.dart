/// baseUrl: 'http://3.28.14.143:4000/star-backend/api/',

class ApiEndPoints {
  final String loginNewUser = "auth/send-otp";
  final String otp = "auth/login";
  final String getComplaintReport = "complaintReport/get/";
  final String getAllComplaintReport = "complaintReport/get-all";
  final String updateComplaintReport = "complaintReport/update/";
  final String createComplaintReport = "complaintReport/add";
  final String deleteComplaintReport = "complaintReport/delete/";
  final String getAllLostFound = "lostFound/get-all";
  final String getMyProfile = "user/profileDetails";
}