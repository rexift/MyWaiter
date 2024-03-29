import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mywaiter_design/components/item_tile.dart';
import 'package:mywaiter_design/config/constants.dart';
import 'package:mywaiter_design/config/theme/palette.dart';
import 'package:mywaiter_design/pages/home_page.dart';
import 'package:mywaiter_design/pages/restaurant_page.dart';
import 'package:mywaiter_design/widgets/suffix_icon.dart';
import 'package:mywaiter_design/widgets/svg_icon.dart';

class SearchTab extends StatefulWidget with HomeTab {
  @override
  final String label = 'Search';
  @override
  final Widget icon = SvgIcon('assets/search.svg');
  @override
  final Widget activeIcon = SvgIcon('assets/search_filled.svg');
  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  // late final scrollController = ScrollController()
  //   ..addListener(() => setState(() {}));
  late final textController = TextEditingController()
    ..addListener(() => setState(() {}));

  // bool get isScrolled =>
  //     scrollController.hasClients && scrollController.offset > 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          // controller: scrollController,
          padding: EdgeInsets.only(top: 8 + 48 + 8),
          itemCount: 15,
          itemBuilder: (context, i) => RestaurantTile(),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8).add(
            EdgeInsets.symmetric(horizontal: kScreenPadding),
          ),
          child: Material(
            // elevation: isScrolled ? 4 : 0,
            borderRadius: BorderRadius.circular(kBorderRadius),
            child: TextField(
              controller: textController,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Search',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                prefixIcon: Icon(LucideIcons.search),
                suffixIcon: textController.text.isEmpty
                    ? null
                    : SuffixIcon(
                        LucideIcons.x,
                        onTap: () => textController.text = '',
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RestaurantTile extends StatelessWidget {
  final String name = 'Fábrica Bolina';
  final bool opened = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ItemTile(
      imageUrl: 'https://via.placeholder.com/'
          '150/FFD800/FFFFFF/?text=${name.substring(0, 2)}',
      title: name,
      onTap: () => Navigator.pushNamed(context, RestaurantPage.route),
      subtitle: Text.rich(
        TextSpan(
          style: theme.textTheme.caption,
          children: [
            opened
                ? TextSpan(
                    text: 'Opened',
                    style: TextStyle(color: Palette.green),
                  )
                : TextSpan(
                    text: 'Closed',
                    style: TextStyle(color: Palette.red),
                  ),
            TextSpan(text: ' ∙ Closes at 23pm'),
          ],
        ),
      ),
    );
  }
}
