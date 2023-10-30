import 'package:flutter/material.dart';
import 'package:listings/list_element_state/list_elements.dart';

/// List element state refresh due to wrong indexing
///
/// If a list can't determine the correct index of its elements, the list
/// will always recreate all list elements as soon as the list changes.
///
/// If the list determines the index of its elements correctly, it can recognize
/// them and don't need to recreate each element even if the list get updated.
class ListElementStateRefreshBehaviour extends StatefulWidget {
  /// Creates two [ListView] widgets to illustrate the behaviour of a
  /// working indexing and the recreation of the list elements in case
  /// of an incorrect indexing.
  const ListElementStateRefreshBehaviour({Key? key}) : super(key: key);

  @override
  State<ListElementStateRefreshBehaviour> createState() =>
      _ListElementStateRefreshBehaviourState();
}

class _ListElementStateRefreshBehaviourState
    extends State<ListElementStateRefreshBehaviour> {
  final _itemIds = <String>[];
  String _removedItem = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 48),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _add, child: const Icon(Icons.add)),
            const SizedBox(width: 24),
            ElevatedButton(onPressed: _remove, child: const Icon(Icons.remove)),
          ],
        ),
        const SizedBox(height: 24),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: _generateListView(),
              ),
              Expanded(
                child: _generateListView(canDetermineIndex: false),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Creates a list widget that can or can not
  // determine the list element indices correctly.
  Widget _generateListView({bool canDetermineIndex = true}) {
    return ListView.builder(
      itemCount: _itemIds.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return ListElementStateRefreshHeader(
            key: const ValueKey("header"),
            isElementStateRefreshWorking: canDetermineIndex,
          );
        }

        return ListElementStateRefreshItem(
          key: ValueKey(_itemIds[index - 1]),
          id: _getItemId(index - 1),
        );
      },
      findChildIndexCallback: (key) {
        const methodName = "findChildIndexCallback";

        final value = (key as ValueKey<String>).value;
        if (value == "header") {
          // Additional information for better understanding.
          if (canDetermineIndex) ignorePrint("$methodName: $value -> 0");
          return 0;
        }

        // The actual index of the [_itemIds] needs to be increased by 1 to
        // respect the header, which is not part of it. Otherwise the list
        // widget would not be able to recognize the elements based on their
        // index and recreates them when updating the list.
        final indexCorrection = canDetermineIndex ? 1 : 0;
        final index = _itemIds.indexOf(value) + indexCorrection;

        // Additional information for better understanding.
        if (canDetermineIndex) {
          // TODO(Understand): Why is this working?
          // Index 0 will be returned IF
          // 1. The value of the given key is 'header'
          // 2. The value of the given key was deleted from the [_itemsIds]
          //    and [].indexOf(value) returns -1 (+ indexCorrection)
          //
          // [findChildIndexCallback] returns two times index 0 without issue?
          if (index == 0) {
            ignorePrint("$methodName: $_removedItem -> Deleted");
          } else {
            ignorePrint("$methodName: ${_getItemId(index - 1)} -> $index");
          }
        }
        return index;
      },
    );
  }

  // Adds a new timestamp to the [_itemIds] to generate a new list entry.
  void _add() {
    setState(() {
      _itemIds.add("${DateTime.now().millisecondsSinceEpoch}");
    });
  }

  // Removes the first timestamp of the [_itemIds] to reduce the list.
  void _remove() {
    if (_itemIds.isEmpty) return;

    setState(() {
      _removedItem = _getItemId(0);
      _itemIds.removeAt(0);
    });
  }

  // Creates a more readable item identifier based on the 4
  // last digits (skips 9 of 13 digits) of the unique item key.
  String _getItemId(int index) {
    return "item-${_itemIds[index].characters.skip(9).toList().join()}";
  }

  void ignorePrint(String message) {
    // ignore: avoid_print
    print(message);
  }
}
