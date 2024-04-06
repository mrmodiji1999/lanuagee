import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState()) {
  
  on<LanguageChange>(languageChange);
  }

  FutureOr<void> languageChange(LanguageChange event, Emitter<LanguageState> emit)async {
   
    SharedPreferences sp =await SharedPreferences.getInstance();
   

    sp.setInt('lan', event.language);
    emit(state.copyWith(curentvalue: event.language));

  }
}
