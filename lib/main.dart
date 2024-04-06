import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lanuage/bloc/language_bloc.dart';
import 'package:lanuage/homepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async {
  
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp =await SharedPreferences.getInstance();
   int savelanguage = sp.getInt('lan')??0;
  runApp( MyApp(str:  savelanguage));
}

class MyApp extends StatelessWidget {
  int? str;
   MyApp({super.key,required this.str});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageBloc(),
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
       state.curentvalue!=0?
       str=state.curentvalue:str;
      
          return   MaterialApp(
            debugShowCheckedModeBanner: false,
        
        
            locale: Locale(str==0?'en':str==1?'en':'es'),
            title: 'Localizations Sample App',
            localizationsDelegates: const [
              AppLocalizations.delegate, 
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales:[
              Locale('en'), // English
              Locale('es'), // Spanish
            ],
            home: Homepage(),
          );
        },
      ),
    );
  }
}
