class LocalQuestion {
  final List<String>? tags;
  final bool? isAnswered;
  final int? viewCount;
  final int? answerCount;
  final int? score;
  final int? lastActivityDate;
  final int? creationDate;
  final int? questionId;
  final String? contentLicense;
  final String? link;
  final String? title;
  final int? lastEditDate;
  final int? closedDate;
  final String? closedReason;
  final int? acceptedAnswerId;

  LocalQuestion({
    required this.tags,
    required this.isAnswered,
    required this.viewCount,
    required this.answerCount,
    required this.score,
    required this.lastActivityDate,
    required this.creationDate,
    required this.questionId,
    required this.contentLicense,
    required this.link,
    required this.title,
    required this.lastEditDate,
    required this.closedDate,
    required this.closedReason,
    required this.acceptedAnswerId,
  });

  // Convert Question object to a Map
  Map<String, dynamic> toMap() {
    return {
      'tags': tags?.join(','),
      // Store tags as a comma-separated string
      'isAnswered': isAnswered == true ? 1 : 0,
      // Store as 1 for true, 0 for false
      'viewCount': viewCount,
      'answerCount': answerCount,
      'score': score,
      'lastActivityDate': lastActivityDate,
      'creationDate': creationDate,
      'questionId': questionId,
      'contentLicense': contentLicense,
      'link': link,
      'title': title,
      'lastEditDate': lastEditDate,
      'closedDate': closedDate,
      'closedReason': closedReason,
      'acceptedAnswerId': acceptedAnswerId,
    };
  }

  // Create a Question object from a Map
  factory LocalQuestion.fromMap(Map<String, dynamic> map) {
    return LocalQuestion(
      tags: map['tags']?.split(','),
      // Split the comma-separated string to get a list
      isAnswered: map['isAnswered'] == 1 ? true : false,
      // Convert 1 to true, 0 to false
      viewCount: map['viewCount'],
      answerCount: map['answerCount'],
      score: map['score'],
      lastActivityDate: map['lastActivityDate'],
      creationDate: map['creationDate'],
      questionId: map['questionId'],
      contentLicense: map['contentLicense'],
      link: map['link'],
      title: map['title'],
      lastEditDate: map['lastEditDate'],
      closedDate: map['closedDate'],
      closedReason: map['closedReason'],
      acceptedAnswerId: map['acceptedAnswerId'],
    );
  }
}

class LocalOwner {
  final int? accountId;
  final int? reputation;
  final int? userId;
  final String? userType;
  final int? acceptRate;
  final String? profileImage;
  final String? displayName;
  final String? link;

  LocalOwner({
    required this.accountId,
    required this.reputation,
    required this.userId,
    required this.userType,
    required this.acceptRate,
    required this.profileImage,
    required this.displayName,
    required this.link,
  });

  // Convert Owner object to a Map
  Map<String, dynamic> toMap() {
    return {
      'accountId': accountId,
      'reputation': reputation,
      'userId': userId,
      'userType': userType,
      'acceptRate': acceptRate,
      'profileImage': profileImage,
      'displayName': displayName,
      'link': link,
    };
  }

  // Create an Owner object from a Map
  factory LocalOwner.fromMap(Map<String, dynamic> map) {
    return LocalOwner(
      accountId: map['accountId'],
      reputation: map['reputation'],
      userId: map['userId'],
      userType: map['userType'],
      acceptRate: map['acceptRate'],
      profileImage: map['profileImage'],
      displayName: map['displayName'],
      link: map['link'],
    );
  }
}
