import 'package:flutter/material.dart';
import 'package:fpflutter/home/home_controller.dart';
import 'package:fpflutter/home/home_repository.dart';
import 'package:fpflutter/home/home_state.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(repository: HomeRepositoryImpl());

  @override
  void initState() {
    controller.getNames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<HomeState>(
          valueListenable: controller.stateNotifier,
          builder: (_, state, __) => state.maybeWhen(
              success: (names) => ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (_, index) => ListTile(
                        title: Text(names[index]),
                      )),
              loading: () => Center(
                    child: CircularProgressIndicator(),
                  ),
              error: (message) => Center(child: Text(message ?? "OPS!")),
              orElse: () => Container())),
    );
  }
}
