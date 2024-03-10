import 'package:flutter/material.dart';
import 'package:gimimanager/util/mod/ModList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GIMI Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'GIMI Manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: Column(
                    children: (ModList.all.map((mod) {
                  return Row(
                    children: [
                      Text(
                        mod.path!,
                        style: TextStyle(fontSize: 20),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            mod.status = !mod.status;
                          });
                        },
                        tooltip: mod.status ? 'Enabled' : 'Disabled',
                        child: Icon(mod.status ? Icons.check : Icons.close),
                      ),
                    ],
                  );
                })).toList()),
              ),
            );
          },
        ));
  }
}
