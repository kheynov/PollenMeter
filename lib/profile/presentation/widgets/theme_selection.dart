import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:pollen_meter/core/domain/profile/model/profile_data_model.dart';
import 'package:pollen_meter/core/extensions/localized_build_context.dart';

class ThemeSelectionWidget extends StatefulWidget {
  const ThemeSelectionWidget({
    Key? key,
    required this.onChoiceOfTile,
    required this.themeType,
  }) : super(key: key);

  /// Функция, реагирующая на изменение состояния элементов
  final Function(ThemeTypes themeType) onChoiceOfTile;

  final List<ThemeTypes> themeType;

  @override
  State<ThemeSelectionWidget> createState() => _ThemeSelectionWidgetState();
}

class _ThemeSelectionWidgetState extends State<ThemeSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    Map<ThemeTypes, int> indicesByTheme = {
      ThemeTypes.light: 0,
      ThemeTypes.dark: 1,
      ThemeTypes.system: 2,
    };
    Map<int, ThemeTypes> themesByIndex = {
      0: ThemeTypes.light,
      1: ThemeTypes.dark,
      2: ThemeTypes.system,
    };
    GroupButtonController tabController = GroupButtonController(
      selectedIndex: indicesByTheme[widget.themeType[0]]!,
    );
    List<String> buttonNames = [
      context.loc.lightTheme,
      context.loc.darkTheme,
      context.loc.systemTheme,
    ];
    tabController.addListener(() {
      widget.themeType[0] = themesByIndex[tabController.selectedIndex]!;
      widget.onChoiceOfTile.call(themesByIndex[tabController.selectedIndex]!);
      setState(() {});
    });
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
          GroupButton(
            isRadio: true,
            enableDeselect: false,
            controller: tabController,
            onSelected: (dynamic, int index, bool selected) {
              widget.themeType[0] = themesByIndex[index]!;

              widget.onChoiceOfTile.call(themesByIndex[index]!);
              setState(() {});
            },
            options: GroupButtonOptions(
              mainGroupAlignment: MainGroupAlignment.spaceBetween,
              borderRadius: BorderRadius.circular(15),
              selectedShadow: [],
              unselectedShadow: [],
              unselectedColor: Theme.of(context).colorScheme.background,
              selectedTextStyle: Theme.of(context).textTheme.labelSmall,
              unselectedTextStyle: Theme.of(context).textTheme.headlineMedium,
            ),

            buttons: buttonNames,

            buttonIndexedBuilder:
                (bool isSelected, int index, BuildContext context) {
              return ListTile(
                title: Text(
                  buttonNames[index],
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                trailing: isSelected
                    ? SizedBox(
                        width: 38,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1,
                                ),
                                shape: BoxShape.circle,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.4),
                              ),
                              height: 28,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              height: 18,
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        width: 38,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1,
                                ),
                                shape: BoxShape.circle,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.4),
                              ),
                              height: 28,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1,
                                ),
                                shape: BoxShape.circle,
                                color: Theme.of(context).colorScheme.background,
                              ),
                              height: 18,
                            ),
                          ],
                        ),
                      ),
              );
            },
            //buttons: widget.listPollens.map((e) => context.fromAllergen(e.allergen)).toList(),
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
