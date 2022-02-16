
import 'package:quiz_app_master/ui/widgets/progress_bar_widget.dart';
import 'package:quiz_app_master/ui/widgets/question_card.dart';

import '../../file_export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  @override
  void initState() {
    final question = context.read<QuestionCubit>();

    question.animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    question.updateAnimation();
    question.animationController?.forward().whenComplete(question.nextQuestion);
    question.pageController = PageController();
    question.questions.shuffle();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final questionCubit = context.watch<QuestionCubit>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SvgPicture.asset("assets/background.svg", height: ScreenUtil().screenHeight,width: ScreenUtil().screenWidth,fit: BoxFit.fill,),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: ProgressBar(),
                ),
                const SizedBox(height: kDefaultPadding),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Text.rich(
                    TextSpan(
                      text:
                      "Question ${questionCubit.questionNumber}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: kSecondaryColor),
                      children: [
                        TextSpan(
                          text: "/${questionCubit.questions.length}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: kSecondaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(thickness: 1.5),
                const SizedBox(height: kDefaultPadding),
                Expanded(
                  child: PageView.builder(
                    // Block swipe to next qn
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: questionCubit.pageController,
                    onPageChanged: questionCubit.updateTheQnNum,
                    itemCount: questionCubit.questions.length,
                    itemBuilder: (context, index) => QuestionCard(
                        question: questionCubit.questions[index]),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
