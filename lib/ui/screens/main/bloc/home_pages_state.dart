part of home_pages;

class _AboutMeState extends Equatable {
  final String? extraMessage;

  _AboutMeState({this.extraMessage});

  @override
  List<Object?> get props => [extraMessage];
}

class _AboutMeLoadingState extends _AboutMeState {
  _AboutMeLoadingState({String? extraMessage}) : super(extraMessage: extraMessage);
}

class _AboutMeLoadedFromStorageState extends _AboutMeState {
  final AboutMe aboutMe;

  _AboutMeLoadedFromStorageState(this.aboutMe, {String? extraMessage})
      : super(extraMessage: extraMessage);

  @override
  List<Object?> get props => [aboutMe];
}

class _AboutMeLoadedFromNetworkState extends _AboutMeState {
  final AboutMe aboutMe;

  _AboutMeLoadedFromNetworkState(this.aboutMe, {String? extraMessage})
      : super(extraMessage: extraMessage);

  @override
  List<Object?> get props => [aboutMe];
}

class _AboutMeErrorState extends _AboutMeState {
  _AboutMeErrorState(String extraMessage) : super(extraMessage: extraMessage);

  @override
  List<Object?> get props => [extraMessage];
}
