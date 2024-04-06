part of 'language_bloc.dart';

 class LanguageState extends Equatable {
  int curentvalue;
  LanguageState({this.curentvalue =0});
  LanguageState copyWith({int? curentvalue }){return  LanguageState(curentvalue: curentvalue ??this.curentvalue);}
  @override
  List<Object?> get props => [curentvalue];
 }

