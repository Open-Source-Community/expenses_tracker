import 'package:expense_tracker/cubit/write_data_cubit/write_data_cubit.dart';
import 'package:flutter/material.dart';

import '../../../components/constants/constants.dart';
import 'list_icon.dart';

class IconRow extends StatelessWidget {
  IconRow({
    super.key,
    required this.activeIndex,
  });
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 17),
      child: SizedBox(
        height: 50,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return IconButton(
              shoppingIconslist: shoppingIconsList,
              activeIndex: activeIndex,
              index: index,
            );
          },
          itemCount: shoppingIconsList.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(width: 7),
        ),
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  const IconButton({
    super.key,
    required List<IconData> shoppingIconslist,
    required this.activeIndex,
    required this.index,
  }) : _shoppingIconslist = shoppingIconslist;

  final List<IconData> _shoppingIconslist;
  final int activeIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => WriteDataCubit.get(context).updateIndexIcon(index),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: ColorManager.black,
            shape: BoxShape.circle,
            border: _shoppingIconslist[activeIndex] == _shoppingIconslist[index]
                ? Border.all(color: Colors.red, width: 1.8)
                : null),
        child: ListIcon(
          icon: _shoppingIconslist[index],
        ),
      ),
    );
  }
}
