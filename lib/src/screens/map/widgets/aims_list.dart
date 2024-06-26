import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:wom_pocket/src/blocs/map/bloc.dart';
import 'package:wom_pocket/src/models/source_group_wom.dart';

import '../../../my_logger.dart';

class AimsList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mapNotifierProvider);
    logger.i("build aims list");
    if (state is! AsyncData) {
      return Text(
        '-',
        style: TextStyle(color: Colors.white),
      );
    }
    if (state.valueOrNull!.aims.isEmpty) {
      return Text(
        'no_aims'.tr(),
        style: TextStyle(color: Colors.white),
      );
    }

    return ChipFilter(
      aims: state.valueOrNull?.aims ?? [],
      onAdd: (type) {
        ref.read(mapNotifierProvider.notifier).addAimToFilter(type);
      },
      onRemove: (type) {
        ref.read(mapNotifierProvider.notifier).removeAimFromFilter(type);
      },
    );
  }
}

class ChipFilter extends StatefulWidget {
  final Function? onAdd;
  final Function? onRemove;
  final List<WomGroupBy> aims;

  const ChipFilter({Key? key,required this.aims, this.onAdd, this.onRemove})
      : super(key: key);

  @override
  _ChipFilterState createState() => _ChipFilterState();
}

class _ChipFilterState extends State<ChipFilter> {
  Set<String?> chips = Set();

  @override
  void initState() {
    chips.addAll(widget.aims.map((a) => a.type));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final languageCode = context.locale.languageCode;
    return Container(
      height: 50.0,
      padding: const EdgeInsets.only(top: 8),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.aims.length,
          itemBuilder: (context, index) {
            final a = widget.aims[index];
            return Padding(
              padding: const EdgeInsets.only(right: 2.0),
              child: FilterChip(
                label: Text(
                  '${(a.titles ?? const {})[languageCode] ?? '-'} (${a.count})',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                selectedColor: Theme.of(context).colorScheme.secondary,
                selected: chips.contains(a.type),
                onSelected: (selected) {
                  if (selected) {
                    chips.add(a.type);
                    widget.onAdd!(a.type);
                  } else {
                    chips.remove(a.type);
                    widget.onRemove!(a.type);
                  }
                  setState(() {});
                },
              ),
            );
          }),
    );
  }
}
