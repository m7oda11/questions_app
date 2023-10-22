class Question {
  List<QuestionItem>? items;
  bool? hasMore;
  int? quotaMax;
  int? quotaRemaining;

  Question({this.items, this.hasMore, this.quotaMax, this.quotaRemaining});

  Question.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <QuestionItem>[];
      json['items'].forEach((v) {
        items!.add(QuestionItem.fromJson(v));
      });
    }
    hasMore = json['has_more'];
    quotaMax = json['quota_max'];
    quotaRemaining = json['quota_remaining'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['has_more'] = hasMore;
    data['quota_max'] = quotaMax;
    data['quota_remaining'] = quotaRemaining;
    return data;
  }
}

class QuestionItem {
  List<String>? tags;
  Owner? owner;
  bool? isAnswered;
  int? viewCount;
  int? answerCount;
  int? score;
  int? lastActivityDate;
  int? creationDate;
  int? questionId;
  String? contentLicense;
  String? link;
  String? title;
  int? lastEditDate;
  int? closedDate;
  String? closedReason;
  int? acceptedAnswerId;

  QuestionItem(
      {this.tags,
      this.owner,
      this.isAnswered,
      this.viewCount,
      this.answerCount,
      this.score,
      this.lastActivityDate,
      this.creationDate,
      this.questionId,
      this.contentLicense,
      this.link,
      this.title,
      this.lastEditDate,
      this.closedDate,
      this.closedReason,
      this.acceptedAnswerId});

  QuestionItem.fromJson(Map<String, dynamic> json) {
    tags = json['tags'].cast<String>();
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    isAnswered = json['is_answered'];
    viewCount = json['view_count'];
    answerCount = json['answer_count'];
    score = json['score'];
    lastActivityDate = json['last_activity_date'];
    creationDate = json['creation_date'];
    questionId = json['question_id'];
    contentLicense = json['content_license'];
    link = json['link'];
    title = json['title'];
    lastEditDate = json['last_edit_date'];
    closedDate = json['closed_date'];
    closedReason = json['closed_reason'];
    acceptedAnswerId = json['accepted_answer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tags'] = tags;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    data['is_answered'] = isAnswered;
    data['view_count'] = viewCount;
    data['answer_count'] = answerCount;
    data['score'] = score;
    data['last_activity_date'] = lastActivityDate;
    data['creation_date'] = creationDate;
    data['question_id'] = questionId;
    data['content_license'] = contentLicense;
    data['link'] = link;
    data['title'] = title;
    data['last_edit_date'] = lastEditDate;
    data['closed_date'] = closedDate;
    data['closed_reason'] = closedReason;
    data['accepted_answer_id'] = acceptedAnswerId;
    return data;
  }
}

class Owner {
  int? accountId;
  int? reputation;
  int? userId;
  String? userType;
  int? acceptRate;
  String? profileImage;
  String? displayName;
  String? link;

  Owner(
      {this.accountId,
      this.reputation,
      this.userId,
      this.userType,
      this.acceptRate,
      this.profileImage,
      this.displayName,
      this.link});

  Owner.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    reputation = json['reputation'];
    userId = json['user_id'];
    userType = json['user_type'];
    acceptRate = json['accept_rate'];
    profileImage = json['profile_image'];
    displayName = json['display_name'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['account_id'] = accountId;
    data['reputation'] = reputation;
    data['user_id'] = userId;
    data['user_type'] = userType;
    data['accept_rate'] = acceptRate;
    data['profile_image'] = profileImage;
    data['display_name'] = displayName;
    data['link'] = link;
    return data;
  }
}
