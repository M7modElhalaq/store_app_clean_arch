import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/features/main_app/presentation/manager/drawer_cubit.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final int id;
  final bool soon;
  final bool selected;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.id,
    this.soon = false,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? ManagerColors.grey : Colors.transparent,
      child: InkWell(
        onTap: () async {
          Navigator.pop(context);
          if (id == 0) {
            context
                .read<DrawerCubit>()
                .navigateToScreen(screen: DrawerSections.home);
          } else if (id == 1) {
            context
                .read<DrawerCubit>()
                .navigateToScreen(screen: DrawerSections.login);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                  child: Icon(
                icon,
                size: 20,
                color: ManagerColors.white,
              )),
              Expanded(
                  flex: 4,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 15.0, color: ManagerColors.white),
                  )),
              Expanded(
                  flex: 1,
                  child: Text(
                    soon == true ? 'soon' : '',
                    style: const TextStyle(fontSize: 12.0, color: Colors.red),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
