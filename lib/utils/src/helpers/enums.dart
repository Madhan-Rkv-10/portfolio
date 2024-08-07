enum LottieAnimation {
  dataNotFound(name: 'data_not_found'),
  empty(name: 'empty'),
  loading(name: 'loading'),
  error(name: 'error'),
  smalError(name: 'small_error');

  final String name;
  const LottieAnimation({required this.name});
}

extension GetFullPath on LottieAnimation {
  String get fullPath => 'assets/animations/data.json';
}
// class EmptyContentAnimationView extends LottieAnimationView {
//   const EmptyContentAnimationView({super.key})
//       : super(animation: LottieAnimation.empty);
// }