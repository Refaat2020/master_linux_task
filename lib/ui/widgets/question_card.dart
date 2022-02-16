
import '../../file_export.dart';
import 'option.dart';


class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key ?key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    final questionCubit = context.watch<QuestionCubit>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: kBlackColor),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          ListView.builder(
            itemCount:  question.options.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Option(
                  index: index,
                  text: question.options[index],
                  press: () => questionCubit.checkAnswer(question, index),
                );
              },
          ),

        ],
      ),
    );
  }
}
