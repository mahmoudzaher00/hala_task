part of 'signin_cubit.dart';

abstract class SigninState extends Equatable {
  const SigninState();
}

class SigninInitial extends SigninState {
  @override
  List<Object> get props => [];
}
class SigninLoading extends SigninState {
  @override
  List<Object> get props => [];
}
class SigninLoaded extends SigninState {
  @override
  List<Object> get props => [];
}
class SigninError extends SigninState {
  @override
  List<Object> get props => [];
}
class  VisiblePassword extends SigninState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class InvisiblePassword extends SigninState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
