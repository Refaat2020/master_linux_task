
import '../../file_export.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final questionCubit = context.watch<QuestionCubit>();

    return BlocConsumer<QuestionCubit,QuestionState>(
      listener: (context, state) {
        if (state is QuestionDone) {
          Navigator.pushNamedAndRemoveUntil(
              context, "/scoreScreen", (route) => false);
        }
      },
      builder: (context, state) {
      return InkWell(
        onTap: press,
        child: Container(
          margin: const EdgeInsets.only(top: kDefaultPadding),
          padding: const EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
            border: Border.all(color: questionCubit.getTheRightColor(index)),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${index + 1}. $text",
                style: TextStyle(color: questionCubit.getTheRightColor(index), fontSize: 14.sp),
              ),
              Container(
                height: 26.h,
                width: 26.w,
                decoration: BoxDecoration(
                  color: questionCubit.getTheRightColor(index) == kGrayColor
                      ? Colors.transparent
                      : questionCubit.getTheRightColor(index),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: questionCubit.getTheRightColor(index)),
                ),
                child: questionCubit.getTheRightColor(index) == kGrayColor
                    ? null
                    : Icon(questionCubit.getTheRightIcon(index), size: 14.sp),
              )
            ],
          ),
        ),
      );
    },
    );
  }
}
