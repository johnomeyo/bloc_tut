import 'package:bloc_tut/data/api/api_client.dart';
import 'package:bloc_tut/data/repositories/cat_fact_repository.dart';
import 'package:bloc_tut/dormain/repositories/cat_fact_repository_interface.dart';
import 'package:bloc_tut/presentation/cubit/cat_fact_cubit.dart';
import 'package:bloc_tut/presentation/screens/cat_facts_page.dart';
import 'package:bloc_tut/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
         create: (context) {
        final ApiClient apiClient = ApiClient();
        final CatFactRepositoryInterface repository = CatFactRepository(apiClient);
        return CatFactCubit(repository);
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF075FB1)),
          useMaterial3: true,
        ),
        home: const CatFactsPage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.wasIncremented) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Counter Incremented!')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Counter Decremented!')),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    "${state.counterValue} is less than 0",
                    style: Theme.of(context).textTheme.headlineLarge,
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    "${state.counterValue} is equal to 5",
                    style: const TextStyle(color: Colors.red, fontSize: 20),
                  );
                } else {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headlineLarge,
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton.icon(
                    onPressed: () {
                      // context.read<CounterCubit>().decrement();
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    icon: const Icon(Icons.remove),
                    label: const Text('Decrement')),
                const SizedBox(width: 20),
                FilledButton.icon(
                    onPressed: () {
                      // context.read<CounterCubit>().increment();
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Increment')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
