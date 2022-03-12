import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hangman/data/leaderboard_model.dart';

class Leaderboard extends StatefulWidget {
  Leaderboard({Key? key}) : super(key: key);

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('Leaderboard').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<LeaderboardModel> _listOfWins =
                  snapshot.data!.docs.map((DocumentSnapshot e) {
                Map<String, dynamic> data = e.data()! as Map<String, dynamic>;

                return LeaderboardModel.fromJson(data);
              }).toList();

              return ListView.builder(
                  itemCount: _listOfWins.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    LeaderboardModel _result = _listOfWins[index];
                    return ListTile(
                      title: Text(_result.login!),
                      subtitle: Text(_result.score!.toString()),
                      trailing: Text(_result.time!.toString()),
                    );
                  });
            }
          }),
    );
  }
}
