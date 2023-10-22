import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:questions/Models/Api_Models/Question.dart';
import 'package:questions/res/colors.dart';

class QuestionDetailsScreen extends StatelessWidget {
  final List<QuestionItem> currentQuestions;
  final RxInt index;
  const QuestionDetailsScreen(
      {super.key, required this.currentQuestions, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkestColor,
        foregroundColor: thirdColor,
      ),
      body: Container(
        color: secondaryColor,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(
                    MediaQuery.sizeOf(context).shortestSide * 0.04,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                  child: Row(
                    children: [
                      Obx(() => ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: CachedNetworkImage(
                              width: MediaQuery.sizeOf(context).shortestSide *
                                  0.15,
                              height: MediaQuery.sizeOf(context).shortestSide *
                                  0.15,
                              imageUrl: currentQuestions
                                  .elementAt(index.value)
                                  .owner!
                                  .profileImage!,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.person),
                            ),
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: Obx(() => Text(
                              currentQuestions.elementAt(index.value).title!,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.textScaleFactorOf(context) *
                                          18,
                                  color: Colors.white),
                            )),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.all(
                    MediaQuery.sizeOf(context).shortestSide * 0.04,
                  ),
                  color: secondaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.textScaleFactorOf(context) * 17,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Answer Count",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.textScaleFactorOf(context) * 17,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Creation Date",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.textScaleFactorOf(context) * 17,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Score",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.textScaleFactorOf(context) * 17,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "View Count",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.textScaleFactorOf(context) * 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(() => Text(
                                currentQuestions
                                    .elementAt(index.value)
                                    .owner!
                                    .displayName!,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.textScaleFactorOf(context) *
                                          17,
                                ),
                              )),
                          Obx(() => Text(
                                currentQuestions
                                    .elementAt(index.value)
                                    .answerCount
                                    .toString(),
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.textScaleFactorOf(context) *
                                          17,
                                ),
                              )),
                          Obx(() => Text(
                                currentQuestions
                                    .elementAt(index.value)
                                    .creationDate
                                    .toString(),
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.textScaleFactorOf(context) *
                                          17,
                                ),
                              )),
                          Obx(() => Text(
                                currentQuestions
                                    .elementAt(index.value)
                                    .score
                                    .toString(),
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.textScaleFactorOf(context) *
                                          17,
                                ),
                              )),
                          Obx(() => Text(
                                currentQuestions
                                    .elementAt(index.value)
                                    .viewCount
                                    .toString(),
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.textScaleFactorOf(context) *
                                          17,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.all(
                    MediaQuery.sizeOf(context).shortestSide * 0.04,
                  ),
                  decoration: BoxDecoration(
                    color: thirdColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(() =>
                          currentQuestions.elementAt(index.value).isAnswered!
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.done,
                                      color: Colors.green,
                                      size: MediaQuery.sizeOf(context).shortestSide * 0.1,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text("Answered", style: TextStyle(fontWeight: FontWeight.w600, fontSize:
                                    MediaQuery.textScaleFactorOf(context) * 16),)
                                  ],
                                )
                              : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.red,
                                      size: MediaQuery.sizeOf(context).shortestSide * 0.1,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text("Not Answered", style: TextStyle(fontWeight: FontWeight.w600, fontSize:
                                    MediaQuery.textScaleFactorOf(context) * 16),)
                                  ],
                                )),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const Text("Tags"),
                            const SizedBox(
                              width: 10,
                            ),
                            for (var tag in currentQuestions
                                .elementAt(index.value)
                                .tags!)
                              Obx(()=> Row(
                                children: currentQuestions
                                    .elementAt(index.value)
                                    .tags!
                                    .map((tag) {
                                  return Row(
                                    children: [
                                      Wrap(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: secondaryColor.withOpacity(0.4),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "#$tag",
                                                textAlign: TextAlign.center,
                                                style:
                                                    const TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      )
                                    ],
                                  );
                                }).toList(),
                              ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.075,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).shortestSide * 0.15,
                            height: MediaQuery.sizeOf(context).shortestSide * 0.15,
                      child: Obx(()=> AbsorbPointer(
                        absorbing: currentQuestions.elementAt(index.value) == currentQuestions.first,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: currentQuestions.elementAt(index.value) != currentQuestions.first ? backgroundColor : Colors.grey,
                                foregroundColor: thirdColor,
                                padding: EdgeInsets.zero
                              ),
                                onPressed: () {
                                  if (currentQuestions.elementAt(index.value) != currentQuestions.first) {
                                    index.value--;
                                  }},
                                child: const Icon(Icons.arrow_back_ios_new_outlined)))),
                          ),
                          SizedBox(width: MediaQuery.sizeOf(context).shortestSide * 0.05,),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).shortestSide * 0.15,
                            height: MediaQuery.sizeOf(context).shortestSide * 0.15,
                            child: Obx(()=> AbsorbPointer(
                              absorbing: currentQuestions.elementAt(index.value) == currentQuestions.last,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: currentQuestions.elementAt(index.value) != currentQuestions.last ? backgroundColor : Colors.grey,
                                      foregroundColor: thirdColor,
                                      padding: EdgeInsets.zero
                                  ),
                                  onPressed: () {
                                    if (currentQuestions.elementAt(index.value) != currentQuestions.last) {
                                      index.value++;
                                    }},
                                  child: const Icon(Icons.arrow_forward_ios_outlined)),
                            )),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
