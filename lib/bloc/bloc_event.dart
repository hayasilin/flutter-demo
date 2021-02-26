import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A convenient event class with implementing [Equatable] for event instance comparison in [Bloc]. The following is an
/// example to demonstrate how to utilize this in a subclass cooperated with [BlocDataLoadingState].
///
/// ```dart
/// class LoadUserProfileEvent extends BlocEvent {
///   LoadUserProfileEvent(this.userId) : super([userId]);
///
///   final String userId;
/// }
///
/// class UserProfileLoadingState extends BlocDataLoadingState<UserProfile> {
///   UserProfileLoadingState.success(UserProfile userProfile) : super(data: userProfile);
///
///   UserProfileLoadingState.error(Object error) : super(error: error);
///
///   UserProfileLoadingState.loading() : super(isLoading: true);
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
abstract class BlocEvent extends Equatable {
  const BlocEvent([List<Object> props]) : _props = props ?? const <Object>[];

  final List<Object> _props;

  @override
  List<Object> get props => _props;

  @override
  bool get stringify => true;
}
