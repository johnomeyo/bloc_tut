
import 'package:bloc_tut/presentation/cubit/cat_fact_cubit.dart';
import 'package:bloc_tut/presentation/cubit/cat_fact_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatFactsPage extends StatelessWidget {
  const CatFactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Facts'),
      ),
      body: BlocBuilder<CatFactCubit, CatFactState>(
        builder: (context, state) {
          if (state is CatFactLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CatFactLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  state.catFact.fact,
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else if (state is CatFactError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Press the button to get a cat fact!'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CatFactCubit>().fetchCatFact();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}