import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/bloc/profilebloc.dart';
import 'package:profile/bloc/profileevent.dart';
import 'package:profile/bloc/profilesttate.dart';
import 'package:profile/model/model.dart';
import 'package:profile/repository/repository.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) =>
            ProfileBloc(repository: ProfileRepository())..add(LoadProfile()),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              return _buildProfileView(state.profile);
            } else if (state is ProfileError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildProfileView(Profile profile) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage:
                AssetImage(profile.profile_picture), // Fixed camelCase naming
            radius: 50,
          ),
          SizedBox(height: 16),
          Text(profile.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(profile.email,
              style: TextStyle(fontSize: 16, color: Colors.grey)),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
