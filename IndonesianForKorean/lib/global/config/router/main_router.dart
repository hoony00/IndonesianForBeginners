import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inde/global/config/router/r_main.dart';

import '../../../app.dart';
import '../../../domain/screen/main/s_main.dart';

final GoRouter router = GoRouter(
  initialLocation: '/main',
  routes: [
    ...mainRoutes,
  ],
  /// todo : Splash 넣기
  // initialLocation: ,


  errorPageBuilder: (context, state) {

    void goHome(){
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  MainScreen()));
    }

    return MaterialPage(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Error Page'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => goHome(),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('페이지가 삭제되거나 유효하지 않습니다.'),
              Text(
                'Error: ${state.error}',
                style: const TextStyle(color: Colors.red),
              ),
              Text(
                '경로(uri): ${state.uri}',
                style: const TextStyle(color: Colors.red),
              ),
              Text('경로 파라미터: ${state.pathParameters}'),
              Text('path: ${state.path}'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                goHome();
                  },
                child: const Text('홈으로 이동'),
              ),
            ],
          ),
        ),
      ),
    );
  },
);
