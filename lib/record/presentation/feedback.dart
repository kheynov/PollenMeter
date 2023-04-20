import 'package:flutter/material.dart';
import 'package:pollen_meter/core/domain/profile/model/profile_data_model.dart';
import 'package:pollen_meter/core/extensions/localized_build_context.dart';

class FeedbackWidget extends StatefulWidget {
  const FeedbackWidget({
    Key? key,
    required this.themeType,
  }) : super(key: key);

  final List<ThemeTypes> themeType;

  @override
  State<FeedbackWidget> createState() => _FeedbackWidgetState();
}

class _FeedbackWidgetState extends State<FeedbackWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.loc.themeMessage,
              style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 20),
        ],
      ),
    );
    // child: GridView.builder(
    //   physics: const NeverScrollableScrollPhysics(),
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     childAspectRatio: 1,
    //     crossAxisSpacing: widget.spacing,
    //     mainAxisSpacing: widget.spacing,
    //     crossAxisCount: widget.crossAxisCount,
    //   ),
    //   itemCount: widget.listPollens.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return SquareTileWidget(
    //       text: widget.listPollens[index].allergen.name,
    //       image: widget.listPollens[index].pathImage != null
    //           ? Image.asset(widget.listPollens[index].pathImage!)
    //           : const Icon(
    //               Icons.local_florist,
    //               size: 40,
    //             ),
    //       selected: widget.listPollens[index].selected,
    //       onTap: (bool selected) {
    //         log(widget.listPollens[index].toString(),
    //             name:
    //                 'SquareTileWidget - ${widget.listPollens[index].allergen.name}');
    //         widget.listPollens[index].selected = selected;
    //         widget.onChoiceOfTile.call(widget.listPollens[index]);
    //         setState(() {});
    //       },
    //     );
    //   },
    // ),
  }
}
