import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/names_cubit.dart';

class Cubitpage extends StatelessWidget {
  const Cubitpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Agify Age Predictor")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider(
          create: (_) => NamesCubit(),
          child: BlocBuilder<NamesCubit, NamesState>(
            builder: (context, state) {
              final cubit = context.read<NamesCubit>();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: cubit.name,
                    decoration: const InputDecoration(
                      labelText: "Enter a name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      cubit.getname(); // Trigger API call
                    },
                    child: const Text("Predict Age"),
                  ),
                  const SizedBox(height: 20),

                  if (state is Namesloading)
                    const CircularProgressIndicator(),

                  if (state is Namesloaded)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name: ${state.data.name}"),
                        Text("Age: ${state.data.age}"),
                        Text("Count: ${state.data.count}"),
                      ],
                    ),

                  if (state is Nameserror)
                    Text("Error: ${state.error}", style: TextStyle(color: Colors.red)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
