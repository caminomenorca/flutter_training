import 'package:flutter/material.dart';
import '../data/sp_helper.dart';
import '../data/session.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({super.key});

  @override
  State<SessionsScreen> createState() =>
      _SessionsScreenState();
}

class _SessionsScreenState
    extends State<SessionsScreen> {
  List<Session> sessions = [];
  final TextEditingController txtDescription =
      TextEditingController();
  final TextEditingController txtDuration =
      TextEditingController();
  final SPHelper helper = SPHelper();

  @override
  void initState() {
    helper.init().then((value) {
      updateScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
              'Your Training Sessions')),
      body: ListView(children: getContent()),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showSessionDialog(context);
          }),
    );
  }

  Future<dynamic> showSessionDialog(
      BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text(
                  'Insert Training Session'),
              content: SingleChildScrollView(
                  child: Column(children: [
                TextField(
                    controller: txtDescription,
                    decoration:
                        const InputDecoration(
                            hintText:
                                'Description')),
                TextField(
                    controller: txtDuration,
                    decoration:
                        const InputDecoration(
                            hintText: 'Duration'))
              ])),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      txtDescription.text = '';
                      txtDuration.text = '';
                    },
                    child: const Text('Cancel')),
                ElevatedButton(
                    onPressed: saveSession,
                    child: const Text('Save'))
              ]);
        });
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    String today =
        '${now.year}-${now.month}-${now.day}';
    int id = helper.getCounter() + 1;
    Session newSession = Session(
        id,
        int.tryParse(txtDuration.text) ?? 0,
        today,
        txtDescription.text);
    helper.writeSession(newSession).then((_) {
      updateScreen();
      helper.setCounter();
    });
    txtDescription.text = '';
    txtDuration.text = '';
    Navigator.pop(context);
  }

  List<Widget> getContent() {
    List<Widget> tiles = [];
    for (var session in sessions) {
      tiles.add(Dismissible(
        key: UniqueKey(),
        onDismissed: (_) {
          helper.deleteSession(session.id).then((value) => updateScreen());
        },
        child: ListTile(
            title: Text(session.description),
            subtitle: Text(
                '${session.date} -${session.duration} min')),
      ));
    }
    return tiles;
  }

  void updateScreen() {
    sessions = helper.getSessions();
    setState(() {});
    
  }
}
