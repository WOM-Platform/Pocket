import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_appbar.dart';
import 'package:wom_pocket/src/core/utils/colors.dart';
import 'package:wom_pocket/src/features/totem/application/totem_scans_notifier.dart';
import 'package:wom_pocket/src/features/totem/ui/widgets/totem_tile.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondLevelAppBar(
        title: 'Ricerca contatti',
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: SearchBar(
            focusNode: focusNode,
            trailing: [
              IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.red,
                ),
                onPressed: () {
                  controller.clear();
                },
              ),
            ],
            overlayColor: WidgetStatePropertyAll(primaryColor),
            surfaceTintColor: WidgetStatePropertyAll(Colors.white),
            backgroundColor: WidgetStatePropertyAll(primaryColor),
            textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white)),
            elevation: WidgetStateProperty.all(0),
            controller: controller,
            padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0),
            ),
            onTap: () {
              // controller.openView();
            },
            onChanged: (query) {
              // controller.openView();
              ref
                  .read(totemSearchNotifierProvider.notifier)
                  .search(query.toLowerCase());
            },
            leading: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(totemSearchNotifierProvider);

              final list = state.filtered;

              return Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        FilterChip(
                          selected: state.showMyEvents,
                          label: Text('Eventi'),
                          onSelected: (value) {
                            ref
                                .read(totemSearchNotifierProvider.notifier)
                                .toggleMyEvents();
                          },
                        ),
                        const SizedBox(width: 8),
                        FilterChip(
                          selected: state.showMyContacts,
                          label: Text('My contacts'),
                          onSelected: (value) {
                            ref
                                .read(totemSearchNotifierProvider.notifier)
                                .toggleMyContacts();
                          },
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TotemTile(t: list[index]);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
