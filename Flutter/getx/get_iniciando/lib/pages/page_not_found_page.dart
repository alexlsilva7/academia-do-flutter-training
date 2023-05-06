import 'package:flutter/material.dart';

class PageNotFoundPage extends StatelessWidget {
  const PageNotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página não encontrada!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '404',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              'Página não encontrada!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
