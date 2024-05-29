import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app_admin/features/home/presentation/manager/navigation_cubit.dart';
import 'package:library_app_admin/features/home/presentation/pages/book_screen.dart';
import 'package:library_app_admin/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  destinations: const [
                    NavigationRailDestination(label: Text("Books"), icon: Icon(Icons.book)),
                    NavigationRailDestination(label: Text("Inventory"), icon: Icon(Icons.inventory)),
                    NavigationRailDestination(label: Text("Settings"), icon: Icon(Icons.settings)),
                  ],
                  extended: state.isExtended,
                  // labelType: NavigationRailLabelType.selected,
                  selectedIndex: state.index,
                  onDestinationSelected: (value) {
                    context.read<NavigationCubit>().changeIndex(value);
                  },
                  labelType: NavigationRailLabelType.all,
                ),
                Expanded(
                  child: IndexedStack(
                    index: state.index,
                    children: const [
                      BooksScreen(),
                      Center(child: Text("Inventory")),
                      Center(child: Text("Settings")),
                    ],
                  ),
                )
              ],
            ),
            // appBar: AppBar(
            //   // leading: IconButton(
            //   //   onPressed: () => context.read<NavigationCubit>().changeExtended(),
            //   //   icon: const Icon(Icons.menu),
            //   // ),
            //
            //   title: const Text("Home"),
            //   actions: [
            //     IconButton(
            //       onPressed: () => supabase.auth.signOut(),
            //       icon: const Icon(Icons.logout),
            //     )
            //   ],
            // ),
          );
        },
      ),
    );
  }
}
