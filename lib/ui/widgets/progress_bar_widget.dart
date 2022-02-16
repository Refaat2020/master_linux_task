

import '../../file_export.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questionCubit = context.watch<QuestionCubit>();

    return Container(
      width: double.infinity,
      height: 35.h,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF3F4768), width: 3),
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: BlocBuilder<QuestionCubit,QuestionState>(
        builder: (context, state) {
          return Stack(
            children: [

              LayoutBuilder(
                builder: (context, constraints) => Container(
                  // from 0 to 1 it takes 60s
                  width: constraints.maxWidth * questionCubit.animation?.value,
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${( questionCubit.animation?.value * 60).round()} sec"),
                      SvgPicture.asset("assets/icons/clock.svg"),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
