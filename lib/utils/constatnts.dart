import 'package:masoyinbo_mobile/app/app.dart';

const increaseKnowledgeList = [
  businessOrCareerYr,
  travelYr,
  friendsYr,
  schoolOrExamYr,
  funYr,
];

const doWithYorubaLanguageList = [
  sendTextYr,
  haveConversationsYr,
  culturalValuesYr,
  interactWithLocalsYr,
  artsMoveYr,
];

const timeToCommitList = [
  tenMinsYr,
  fifteenMinsYr,
  twentyMinsYr,
  thirtyMinsYr,
];

const ageList = [
  under18En,
  eighteenToTwentyFourEn,
  twentyFiveToThirtyFour,
  thirtyFiveToFourtyFour,
  fourtyFiveToFiftyFour,
  fiftyFiveToSixtyFour,
  sixtyFiveAndAbove,
];

const surveyText = {
  0: [increaseKnowledgeYr, increaseKnowledgeEr, increaseKnowledgeList],
  1: [likeToDoYr, likeToDoEn, doWithYorubaLanguageList],
  2: [timeToCommitYr, timeToCommitEn, timeToCommitList],
  3: [howOldYr, howOldEn, ageList],
};

final surveyDeleteOptions = [
  cantAffordAPremiumAccountEn,
  tooManyAdsEn,
  yourubaIsDifficultToLearnEn,
];

enum DifficultyLevel { easy, medium, hard, random }

enum PracticeSection { proverb, qAndA, meaning, numbers }
