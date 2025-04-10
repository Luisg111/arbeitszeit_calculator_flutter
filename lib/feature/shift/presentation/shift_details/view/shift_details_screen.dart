import '../bloc/shift_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShiftDetailsScreen extends StatelessWidget {
  const ShiftDetailsScreen({super.key, this.id});

  final int? id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShiftDetailsBloc(),
      child: ShiftDetailsView(),
    );
  }
}

class ShiftDetailsView extends StatelessWidget {
  const ShiftDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder(child: Text("ShiftDetails Placeholder"));
  }
}
