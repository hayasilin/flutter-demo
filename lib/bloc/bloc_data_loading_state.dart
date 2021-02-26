import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A convenient class representing data loading state used for [Bloc]. The following is an example to demonstrate how
/// to utilize this in a subclass cooperated with [BlocEvent].
///
/// ```dart
/// class UserProfileLoadingState extends BlocDataLoadingState<UserProfile> {
///   UserProfileLoadingState.success(UserProfile userProfile) : super(data: userProfile);
///
///   UserProfileLoadingState.error(Object error) : super(error: error);
///
///   UserProfileLoadingState.loading() : super(isLoading: true);
/// }
///
/// class LoadUserProfileEvent extends BlocEvent {
///   LoadUserProfileEvent(this.userId) : super([userId]);
///
///   final String userId;
/// }
///
/// class UserProfileBloc extends Bloc<LoadUserProfileEvent, UserProfileLoadingState> {
///   @override
///   UserProfileLoadingState get initialState => UserProfileLoadingState.loading();
///
///   @override
///   Stream<UserProfileLoadingState> mapEventToState(LoadUserProfileEvent event) async* {
///     try {
///       UserProfile userProfile = // snip
///       yield UserProfileLoadingState.success(userProfile);
///     } on Exception catch (error) {
///       yield UserProfileLoadingState.error(error);
///     }
///   }
/// }
///
/// class UserProfile {
///   UserProfile({this.name, this.address, this.phoneNumber});
///
///   final String name;
///   final String address;
///   final String phoneNumber;
/// }
/// ```
abstract class BlocDataLoadingState<T> extends Equatable {
  const BlocDataLoadingState({
    bool isLoading,
    this.data,
    this.error,
  }) : isLoading = isLoading ?? false;

  final bool isLoading;
  final T data;
  final Object error;

  bool get hasData => data != null;

  bool get hasError => error != null;

  @override
  List<Object> get props => [isLoading, data, error];

  @override
  bool get stringify => true;
}
