part of 'question_cubit.dart';

@immutable
abstract class QuestionState {}

class QuestionInitial extends QuestionState {}
class QuestionLoading extends QuestionState {}
class NextQuestion extends QuestionState {}
class QuestionDone extends QuestionState {}
