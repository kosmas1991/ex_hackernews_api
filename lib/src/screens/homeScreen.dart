import '../models/stories.dart';
import 'package:flutter/material.dart';
import '../services/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> _ids;
  int counter = 0;
  Story story;

  @override
  void initState() {
    Services.getIds().then((value) {
      setState(() {
        _ids = value;
      });
    });
    super.initState();
  }

  Future<Story> getDaStory(int x) async {
    Services.getStory(_ids[x]).then((value) {
      setState(() {
        story = value;
      });
    });
      return story;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hacker News'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: FutureBuilder(
            future: getDaStory(counter),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Story story = snapshot.data;
                return Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          story.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(story.url),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () {
          setState(() {
            counter++;
            if (counter == 500) {
              counter = 0;
            }
          });
        },
      ),
    );
  }
}
