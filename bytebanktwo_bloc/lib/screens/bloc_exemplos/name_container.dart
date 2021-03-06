import 'package:bytebanktwo/components/bloc_container.dart';
import 'package:bytebanktwo/model/cubit/name_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameContainer extends BlocContainer {
  const NameContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NameView();
  }
}

class NameView extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  NameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _nameController.text = context.read<NameCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Name'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Desired name'
              ),
              style: const TextStyle(fontSize: 28),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.maxFinite,
                child: ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                context.read<NameCubit>().change(name);
              },
              child: const Text('Salvar', style: TextStyle(fontSize: 24)),
            )),
          )
        ],
      ),
    );
  }
}
