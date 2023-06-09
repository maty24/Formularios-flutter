import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cubits conter'),
            subtitle: const Text('Gestor de estado simple'),
            trailing: const Icon(Icons.arrow_back_ios_new_rounded),
            onTap: () => context.push('/cubits'),
          ),
          ListTile(
            title: const Text('Bloc counter'),
            subtitle: const Text('Gestor de estado simple'),
            trailing: const Icon(Icons.arrow_back_ios_new_rounded),
            onTap: () => context.push('/bloc'),
          ),
        ],
      ),
    );
  }
}
