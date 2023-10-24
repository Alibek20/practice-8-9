import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_8_9/navigation_bar/home/repository/home_repository.dart';

import 'bloc/http_bloc.dart';
import 'model/home_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BlocProvider(
                create: (context) => HttpBloc(
                      HttpRepository(),
                    )..add(LoadHttpEvent()),
                child: BlocBuilder<HttpBloc, HttpState>(builder: (context, state) {
                  if (state is HttpLoadingState) {
                    return const Center(
                                child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: CircularProgressIndicator(
                                      color: Colors.blue,
                                      strokeWidth: 4,
                                    )),
                              );
                  }
                  if (state is HttpLoadedState) {
                    List<HttpModel> httpList = state.data;
                    return SizedBox(
                          child: ListView.builder(
                              itemCount: httpList.length,
                              itemBuilder: (context, index) {
                                return Center(child: Text(httpList[index].title));
                              }));
                  }
                  if (state is HttpErrorState) {}
                  return Container();
                  })),
      ),
    );
  }
}