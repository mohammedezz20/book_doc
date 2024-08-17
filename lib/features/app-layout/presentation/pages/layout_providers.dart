import 'package:book_doc/features/app-layout/presentation/cubit/app_layout_cubit.dart';
import 'package:book_doc/features/app-layout/presentation/pages/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutProviders extends StatelessWidget {
  const LayoutProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AppLayoutCubit()),
      ],
      child: const AppLayout(),
    );
  }
}
