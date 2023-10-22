import 'dart:io';

import 'package:get/get.dart';
import 'package:questions/Models/Api_Models/Question.dart';
import 'package:questions/Models/DB_Models/Local_Question.dart';
import 'package:questions/Views/question_details_screen.dart';
import 'package:questions/helpers/api_service.dart';
import 'package:questions/helpers/database_helper.dart';

class QuestionsListScreenController extends GetxController {
  RxList<QuestionItem> currentQuestions = <QuestionItem>[].obs;
  RxList<QuestionItem> currentLocalQuestions = <QuestionItem>[].obs;
  final ApiService _apiService = ApiService();
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    List <LocalQuestion> tempLocalQuestions = await _dbHelper.getAllQuestions();
    List<QuestionItem> tempQuestions = await _apiService.getItems();


    if (tempQuestions.isNotEmpty) {
      currentQuestions.addAll(tempQuestions);
      for (var question in currentQuestions) {
        await _dbHelper.insertQuestion(
            LocalQuestion(
                tags: question.tags,
                isAnswered: question.isAnswered,
                viewCount: question.viewCount,
                answerCount: question.answerCount,
                score: question.score,
                lastActivityDate: question.lastActivityDate,
                creationDate: question.creationDate,
                questionId: question.questionId,
                contentLicense: question.contentLicense,
                link: question.link,
                title: question.title,
                lastEditDate: question.lastEditDate,
                closedDate: question.closedDate,
                closedReason: question.closedReason,
                acceptedAnswerId: question.acceptedAnswerId));

        await _dbHelper.insertOwner(LocalOwner(
            accountId: question.owner!.accountId,
            reputation: question.owner!.reputation,
            userId: question.owner!.userId,
            userType: question.owner!.userType,
            acceptRate: question.owner!.acceptRate,
            profileImage: question.owner!.profileImage,
            displayName: question.owner!.displayName,
            link: question.owner!.link));
      }
      update();
    }
  }

  void goToQuestionDetailsScreen(List<QuestionItem> questions, RxInt index) {
    Get.to(QuestionDetailsScreen(currentQuestions: questions, index: index));
  }

  Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
