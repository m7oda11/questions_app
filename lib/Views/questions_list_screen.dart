import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:questions/Controllers/questions_list_screen_controller.dart';
import 'package:questions/res/colors.dart';

class QuestionListScreen extends StatelessWidget {
  final QuestionsListScreenController _questionsListScreenController =
      Get.put(QuestionsListScreenController());
  QuestionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Questions')),
      body: GetBuilder<QuestionsListScreenController>(builder: (controller) {
        return controller.currentQuestions.isNotEmpty
            ? Center(
                child: Container(
                  color: backgroundColor,
                  padding: EdgeInsets.all(
                      MediaQuery.sizeOf(context).shortestSide * 0.05),
                  width: double.infinity,
                  height: double.infinity,
                  child: ListView.builder(
                    itemCount: controller.currentQuestions.length,
                    itemBuilder: (context, index) {
                      final question = controller.currentQuestions[index];
                      // Define alternate background colors
                      final color = index % 2 == 0
                          ? backgroundColor.withOpacity(0.005)
                          : backgroundColor.withOpacity(0.075);

                      return Card(
                        elevation:
                            2, // Adjust the elevation for the shadow effect
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: Container(
                          color: color,
                          padding: const EdgeInsets.all(8),
                          child: ListTile(
                            leading: CircleAvatar(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CachedNetworkImage(
                                imageUrl: question.owner!.profileImage!,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.person),
                              ),
                            )),
                            title: Text(
                              question.title!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w400),
                            ),
                            onTap: () => controller.goToQuestionDetailsScreen(
                                controller.currentQuestions, index.obs),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
