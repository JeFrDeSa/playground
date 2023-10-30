/// Merges two LinkedList structured data sets.
///
/// Provides a ListNode that links to all list1 and list2 related ListNodes.
ListNode? mergeLinkedList(ListNode? list1, ListNode? list2) {
  // If one of the lists is empty we return the other one.
  if (list1 == null) {
    return list2;
  }
  if (list2 == null) {
    return list1;
  }

  // Determine the first (smallest) element of both lists.
  ListNode? currentElement;
  if (list1.val <= list2.val) {
    currentElement = list1;
    list1 = list1.next;
  } else {
    currentElement = list2;
    list2 = list2.next;
  }

  // Cache the first (smallest) element as list head.
  final listHead = currentElement;

  // Loop threw the lists until we reach the end of one
  while (list1 != null && list2 != null) {
    // Point "next" to the next smaller value of either list1 or list2
    if (list1.val <= list2.val) {
      currentElement!.next = list1;
      currentElement = list1;
      list1 = list1.next;
    } else {
      currentElement!.next = list2;
      currentElement = list2;
      list2 = list2.next;
    }
  }

  // If one list had less entries than the other,
  // we point "next" to the list with the remaining elements.
  if (list1 == null && list2 != null) {
    currentElement!.next = list2;
  } else if (list1 != null && list2 == null) {
    currentElement!.next = list1;
  }

  // Return the previously cached list head.
  return listHead;
}

/// Dart exercise: https://leetcode.com/problems/merge-two-sorted-lists/
///
/// * Understand Dart LinkedList:
/// https://api.dart.dev/stable/3.0.3/dart-collection/LinkedList-class.html
void main() {
  final list1 = <int>[1, 2, 4];
  final list2 = <int>[1, 3, 4];

  ListNode? result = mergeLinkedList(
    _generateTestList(list1),
    _generateTestList(list2),
  );

  _printResult(result);
}

/// Generates one ListNode for each entry of the given values.
///
/// The ListNode's refer to each other by their next attribute
/// in the given order.
ListNode? _generateTestList(List<int> values) {
  if(values.isEmpty) {
    return null;
  }
  ListNode? previous;
  ListNode? current;
  for (final entry in values.reversed) {
    current = ListNode(entry, previous);
    previous = current;
  }
  return current!;
}

/// An element of a custom LinkedList.
class ListNode {
  int val;
  ListNode? next;

  ListNode([this.val = 0, this.next]);
}

/// Debug print of the resulting list head and the following ListNodes.
void _printResult(ListNode? result) {
  print("List entries:");

  String entries = "";
  do {
    entries = "$entries ${result!.val} -[next]->";
    result = result.next;
  } while (result != null);
  entries = "$entries null";

  print(entries);
}