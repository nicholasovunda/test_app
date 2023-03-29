import 'package:flutter/material.dart';
import 'api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter API Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter API Demo'),
        ),
        body: Center(
          child: FutureBuilder<dynamic>(
            future: ApiService.getUsers(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data;
                return ListView.builder(
                  itemCount: data["data"].length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(data["data"][index]["first_name"]),
                      subtitle: Text(data["data"][index]["email"]),
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(data["data"][index]["avatar"]),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
