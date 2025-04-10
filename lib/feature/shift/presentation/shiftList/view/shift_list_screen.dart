import '../bloc/shift_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShiftListScreen extends StatelessWidget {
  const ShiftListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShiftListBloc(),
      child: ShiftListView(),
    );
  }
}

class ShiftListView extends StatelessWidget {
  const ShiftListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder(child: Text("ShiftList Placeholder"));
  }
}
