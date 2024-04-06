part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable{
   @override

  List<Object?> get props => throw [];
}
class LanguageChange extends LanguageEvent{
int language;
LanguageChange({required this.language});
 
}

