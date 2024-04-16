import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wom_pocket/src/blocs/map/bloc.dart';
import '../../../../src/models/source_group_wom.dart';
import '../../../my_logger.dart';

class SourcesList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mapNotifierProvider);
    logger.i("build source list");

    if (state is! AsyncData) {
      return Text(
        '-',
        style: TextStyle(color: Colors.white),
      );
    }
    if (state.valueOrNull!.sources.isEmpty) {
      return Text(
        'no_sources'.tr(),
        style: TextStyle(color: Colors.white),
      );
    }
    return ChipFilter(
      sources: state.valueOrNull!.sources,
      onAdd: (type) {
        ref.read(mapNotifierProvider.notifier).addSourceToFilter(type);
      },
      onRemove: (type) {
        ref.read(mapNotifierProvider.notifier).removeSourceFromFilter(type);
      },
    );
  }
}

class ChipFilter extends StatefulWidget {
  final Function? onAdd;
  final Function? onRemove;
  final List<WomGroupBy>? sources;

  const ChipFilter({Key? key, this.sources, this.onAdd, this.onRemove})
      : super(key: key);

  @override
  _ChipFilterState createState() => _ChipFilterState();
}

class _ChipFilterState extends State<ChipFilter> {
  Set<String?> chips = Set();

  @override
  void initState() {
    chips.addAll(widget.sources!.map((a) => a.type));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      padding: const EdgeInsets.only(top: 8),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.sources!.length,
          itemBuilder: (context, index) {
            final a = widget.sources![index];
            return Padding(
              padding: const EdgeInsets.only(right: 2.0),
              child: FilterChip(
                label: Text(
                  '${a.type} (${a.count})',
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
