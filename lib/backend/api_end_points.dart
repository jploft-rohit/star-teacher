/// baseUrl: 'http://3.28.14.143:4000/star-backend/api/',
/// baseUrl: 'http://3.28.14.143:5000/star-backend/api/',

class ApiEndPoints {

  final String imageBaseUrl = "http://3.28.14.143:4000/star-backend/";

  /// OnBoarding EndPoints
  final String loginNewUser = "auth/send-otp";
  final String otp = "auth/login";

  /// About Us EndPoints
  final String aboutUs = "settings/page/aboutus";

  /// DashBoard EndPoints
  final String getNewsBroadCast = "newsBroadcast/list";
  final String getHomeData = "home/teacher-home";
  final String agreeNewsBroadCast = "newsBroadcast/update/";

  /// Class
  final String getClassList = "class/getAll";

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
  final String createNotification = "notification/create";
  final String getNotificationSettingsList = "notificationSetting/get-all";
  final String changeNotificationSetting = "notificationSetting/change-notification";

  /// Stars EndPoints
  // Star List
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
  final String getAttendanceStarsList = "starAttendence/star-list";
  final String updateManualAttendanceStatus = "starAttendence/add";

  /// Task & Reminder EndPoints
  final String getAllTaskReminders = "reminder/get-all";
  final String deleteTaskReminder = "reminder/delete/";
  final String updateTaskReminder = "reminder/update/";
  final String createTaskReminder = "reminder/add-request";

  /// Schedule Meeting EndPoints
  final String scheduleNewMeeting = "requestRoutes/create";
  final String getScheduledMeetings = "requestRoutes/list";
  // final String rescheduleMeeting = "requestRoutes/updateRequestStatus/";
  final String rescheduleMeeting = "requestRoutes/update/";
  final String updateScheduledMeetingStatus = "requestRoutes/updateRequestStatus/";

  /// Subject EndPoint
  final String getSubjects = "subject/get/all";

  /// Leave Request EndPoint
  final String getLeaveRequests = "requestRoutes/list";
  final String deleteLeaveRequest = "requestRoutes/delete/";
  final String createLeaveRequest = "requestRoutes/create";
  final String getLeaveTypes = "requestRoutes/leaveTypeList";
  final String uploadEvidence = "requestRoutes/update/";
  final String getLeaveBalance = "staffLeave/list";

  /// Wallet
  final String addWalletMoney = "wallet/transaction/create";
  final String getTransactionHistory = "wallet/transaction/get/";
  final String getWalletData = "wallet/get/";

  /// E-Library
  final String getAssignmentsList = "assignments/list";
  final String createAssignment = "assignments/create";
  final String deleteAssignment = "assignments/delete";
  final String saveAssignment = "assignments/save/";
  final String editAssignment = "assignments/update/";
  final String postAssignment = "assignments/post/";

  /// Early Leave
  final String getEarlyLeaves = "requestRoutes/list?typeOfRequest=earlyLeave";
  final String createEarlyLeave = "requestRoutes/create";
  final String deleteEarlyLeave = "requestRoutes/delete/";
  final String updateEarlyLeave = "requestRoutes/update/";

  /// Medical Record
  final String getAllDisease = "disease/get/all";
  final String updateDisease = "registerStar/add-update-diease";
  final String getAllFood = "food/get-all";
  final String saveDisease = "registerStar/save_disease";
  final String addMedicalRecord = "medicalRecord/add";
  final String getAllMedicalRecord = "medicalRecord/get-all";
  final String addMedicalSurvey = "registerStar/add-medical-survey";
  final String getAllMedicalSurvey = "registerStar/get_medical_survey/";

  /// Online Class Request
  final String getOnlineClassRequests = "requestRoutes/list?typeOfRequest=onlineClass";
  final String updateOnlineClassRequest = "requestRoutes/update/";
  final String createOnlineClassRequest = "requestRoutes/create";
  final String deleteOnlineClassRequest = "requestRoutes/delete/";

  /// Performance
  final String getPerformance = "teacherRating/get_performance";

  /// Today Schedule List
  final String getTodayScheduledList = "home/today-schedule";

  /// Star Gallery EndPoints
  final String getStarGallery = "starGallery/list";
  final String getStarGalleryCategory = "starGallery/galleryCategory";
  final String createStarGallery = "starGallery/create";

  /// Class EndPoints
  // final String getClasses = "class/getAllClass";
  final String getClassSection = "class/section/getall";

  /// Annual Schedule EndPoints
  final String getAnnualScheduled = "annualSchedule/get-all";

  /// Teacher Attendance
  final String getTeacherAttendance = "staffAttendence/list";
  final String updateAbsentReason = "staffAttendence/updateReason/";

  /// Transportation
  final String getTransportationData = "transport/trip/passenger/getTransportDetail/";
  final String notifyTransportAuthority = "transport/trip/passenger/notifyAuthority";
  final String getLocationData = "transport/trip/passenger/getTransportLocation";
  final String deleteLocation = "requestRoutes/delete/";
  final String createLocation = "requestRoutes/create";
  final String updateLocation = "requestRoutes/update/";

  /// Rating
  final String rateBus = "transport/rate_bus";

  /// Exam Time Table
  final String getExamTimeTable = "exam-timetable/getExamTimetableApp";

  /// Assign Assignment
  final String getAssignedAssignmentList = "assignments/get_assign_assignment_list";
  final String deleteAssignedAssignment = "assignments/delete_assign_assignment/";
  final String assignAssignment = "assignments/assign_assignment";

  /// Roles & Delegation
  final String getRolesDelegation = "role-delegation/list";
  final String updateRolesDelegationStatus = "role-delegation/update-status/";

  /// Location
  final String deleteUserLocation = "userAddress/delete/";
  final String getUserAddress = "userAddress/get_all";
  final String createUserAddress = "userAddress/add_or_update";
  final String updateUserAddress = "userAddress/add_or_update";

  /// Shop
  final String getShopProducts = "shop/product/getall";
  final String getShopCategoryListData = "shop/category/getall";
  final String getShopOrdersData = "shop/order/get-all";
  final String cancelOrder = "shop/order/cancel/";
  final String getSingleOrderDetail = "shop/order/single/";
  final String addItemToCart = "shop/cart/add-product";
  final String getUserCart = "shop/cart/user-cart/";
  final String removeCartItem = "shop/cart/remove-product";
  final String createOrder = "shop/order/create";

  /// Account Activation
  final String sendAccountActivationRequest = "auth/sendAccountActivationRequest";
  final String verifyAccountActivationRequest = "auth/verifyAccountActivationRequest";
  final String sendRequestForActivation = "requestRoutes/create";
  final String getActivationRequests = "requestRoutes/list";

  /// Cards & Tags
  final String getCardTag = "user/getusertags";
  final String updateCardTagStatus = "user/change-card-status";

  /// MCQ
  final String getAssignmentList = "assignments/get_assign_assignment_list";
  final String getAssignmentQuestionList = "assignments/get_assign_assignment";
  final String evaluateQuestion = "assignments/evaluate_question";
  final String createMCQ = "assignments/add_question";
  final String getELibraryQuestions = "assignments/single/";

  /// Class Schedule
  final String getWeeklyClassSchedule = "timeTable/teacher/week-plan/";

  /// Payment Gateway
  final String checkStripeStatus = "fees/check_intent/";
}