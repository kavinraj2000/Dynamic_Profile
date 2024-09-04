import 'package:bloc/bloc.dart';
import 'package:profile/bloc/profileevent.dart';
import 'package:profile/bloc/profilesttate.dart';
import 'package:profile/repository/repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repository;

  ProfileBloc({required this.repository}) : super(ProfileInitial()) {
    on<LoadProfile>((event, emit) async {
      try {
        emit(ProfileLoading());
        final profile = await repository.loadProfile();
        emit(ProfileLoaded(profile: profile));
      } catch (e) {
        emit(ProfileError("Failed to load profile"));
      }
    });
  }
}
