import 'package:flutter/material.dart';

import 'package:appflowy/workspace/presentation/command_palette/widgets/search_result_tile.dart';
import 'package:appflowy_backend/protobuf/flowy-search/entities.pb.dart';
import 'package:flowy_infra_ui/flowy_infra_ui.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({
    super.key,
    required this.results,
  });

  final List<SearchResultPB> results;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      separatorBuilder: (_, __) => const Divider(height: 0),
      itemCount: results.length + 1,
      itemBuilder: (_, index) {
        if (index == 0) {
          return const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: FlowyText('Best matches'),
          );
        }

        return SearchResultTile(
          result: results[index - 1],
          onSelected: () => FlowyOverlay.pop(context),
        );
      },
    );
  }
}