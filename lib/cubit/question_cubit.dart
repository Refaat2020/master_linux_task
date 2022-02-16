

import '../file_export.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit() : super(QuestionInitial());

  AnimationController? animationController;
  Animation? animation;
  PageController ?pageController;

  final List<Question> questions = sampleData
      .map(
        (question) => Question(
        id: question['id'],
        question: question['question'],
        options: question['options'],
        answer: question['answer_index']),
  )
      .toList();


  bool isAnswered = false;
  int ?correctAns;
  int ?selectedAns;
   int questionNumber = 1;
  int numOfCorrectAns = 0;


  void updateAnimation(){
    emit(QuestionLoading());
    animation = Tween<double>(begin: 0, end: 1).animate(animationController!)
      ..addListener(() {
        emit(NextQuestion());
      });
  }

  void checkAnswer(Question question, int selectedIndex) {
    emit(QuestionLoading());
    isAnswered = true;
    correctAns = question.answer;
    selectedAns = selectedIndex;

    if (correctAns == selectedAns) numOfCorrectAns++;

    // It will stop the counter
    animationController?.stop();
    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(const Duration(seconds: 3), () {
      nextQuestion();

    });
    emit(NextQuestion());

  }

  void nextQuestion() {
    if (questionNumber != questions.length) {
      isAnswered = false;
      pageController?.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.bounceInOut);

      // Reset the counter
      animationController?.reset();

      animationController?.forward().whenComplete(nextQuestion);
    } else {
      emit(QuestionDone());
    }
  }

  void updateTheQnNum(int index) {
    questionNumber = index + 1;
  }

  String getScore(){
    String score = "${numOfCorrectAns *10} / ${questions.length *10}";
    return score;
  }
  Color getTheRightColor(int index) {
    if (isAnswered) {
      if (index == correctAns) {
        return kGreenColor;
      } else if (index == selectedAns && selectedAns != correctAns) {
        return kRedColor;
      }
    }
    return kGrayColor;
  }

  IconData getTheRightIcon(int index) {
    return getTheRightColor(index) == kRedColor ? Icons.close : Icons.done;
  }
  @override
  Future<void> close() {
    // TODO: implement close
    animationController?.dispose();
    pageController?.dispose();
    return super.close();
  }
}
