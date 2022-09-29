import 'package:flutter/material.dart';

import '../../../../resources/res.dart';

class PaginatedList extends StatefulWidget {
  /// Function to init the cards list
  final Future<dynamic> Function() initFunction;
  final bool showPageLoader;

  /// The lenght of the current fetched cards
  final int cardsLength;

  /// The maximum fetchable cards
  final int maxCardsLenght;

  /// Function that is triggered when you reach the end of the current fetched cards list
  final Future<dynamic> Function() scrollNextPageFunc;

  /// Creates a scrollable, linear array of widgets that are created on demand with pagination.
  final Widget Function(BuildContext, int) itemBuilder;
  final ScrollPhysics? physics;
  final ScrollController? externalScrollController;

  const PaginatedList(
      {Key? key,
      this.physics,
      required this.initFunction,
      required this.showPageLoader,
      required this.cardsLength,
      required this.maxCardsLenght,
      required this.scrollNextPageFunc,
      required this.externalScrollController,
      required this.itemBuilder})
      : super(key: key);

  @override
  State<PaginatedList> createState() {
    return _PaginatedListState();
  }
}

class _PaginatedListState extends State<PaginatedList> {
  @override
  void initState() {
    widget.initFunction();

    widget.externalScrollController!.addListener(() async {
      if (widget.externalScrollController!.position.pixels == widget.externalScrollController!.position.maxScrollExtent && !widget.showPageLoader && (widget.cardsLength < widget.maxCardsLenght)) {
        widget.scrollNextPageFunc();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.externalScrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: widget.physics,
      children: [
        SizedBox(height: Sizes.padding),
        ListView.builder(
          shrinkWrap: true,
          //scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: widget.itemBuilder,
          itemCount: widget.cardsLength,
        ),
        if (widget.cardsLength < widget.maxCardsLenght)
          Padding(
            padding: EdgeInsets.only(bottom: Sizes.padding),
            child: Center(child: CircularProgressIndicator()),
          )
      ],
    );
  }
}
