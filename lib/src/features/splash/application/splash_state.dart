sealed class SplashState{

}

class SplashStateLoading extends SplashState{}
class SplashStateLoaded extends SplashState{
  final String route;

  SplashStateLoaded({required this.route});
}