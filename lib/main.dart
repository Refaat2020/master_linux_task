import 'file_export.dart';

import 'confing/app_router.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  final  AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => BlocProvider(
        create: (context) => QuestionCubit(),
        child: MaterialApp(
          title: 'Quiz App',
          onGenerateRoute:_appRouter.onGenerateRoute ,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          builder: (context, widget) {
            ScreenUtil.setContext(context);
            return MediaQuery(
              //Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
        ),
      ),

    );
  }
}

