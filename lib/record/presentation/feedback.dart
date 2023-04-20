import 'package:flutter/material.dart';
import 'package:pollen_meter/core/extensions/localized_build_context.dart';

class FeedbackWidget extends StatefulWidget {
  const FeedbackWidget({
    Key? key,
    required this.onChoice,
  }) : super(key: key);

  final Function(String feedback) onChoice;

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
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(context.loc.describeWellBeing,
              style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 20),
          TextField(
            cursorColor: Theme.of(context).colorScheme.outline,
            cursorWidth: 1,
            keyboardType: TextInputType.multiline,
            minLines: 6,
            maxLines: null,
            style: Theme.of(context).textTheme.labelMedium,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintStyle: Theme.of(context).textTheme.labelMedium,
              floatingLabelStyle: Theme.of(context).textTheme.labelMedium,
              labelStyle: Theme.of(context).textTheme.labelMedium,
              enabledBorder: OutlineInputBorder(
                gapPadding: 7,
                borderSide: BorderSide(
                    width: 1, color: Theme.of(context).colorScheme.outline),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              focusedBorder: OutlineInputBorder(
                gapPadding: 7,
                borderSide: BorderSide(
                    width: 1, color: Theme.of(context).colorScheme.outline),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              labelText: context.loc.comment,
            ),
            onChanged: widget.onChoice,
          ),
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
