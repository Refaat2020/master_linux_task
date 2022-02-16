

import '../../file_export.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final questionCubit = context.watch<QuestionCubit>;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/background.svg", height: ScreenUtil().screenHeight,width: ScreenUtil().screenWidth,fit: BoxFit.fill,),
          Column(
            children: [
              const Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: kSecondaryColor),
              ),
              const Spacer(),
              Text(
                questionCubit.call().getScore(),
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: kSecondaryColor),
              ),
              const Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
