import 'dart:async';

import 'package:flutter/material.dart';
import 'package:listings/list_element_state/list_element_state_refresh.dart';

/// Header list element for the [ListElementStateRefreshBehaviour].
class ListElementStateRefreshHeader extends StatelessWidget {
  final bool isElementStateRefreshWorking;

  /// Creates a header list element that indicates by an icon
  /// whether the list element state refresh is working or not.
  const ListElementStateRefreshHeader({
    required this.isElementStateRefreshWorking,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "List State",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(width: 4),
        Icon(isElementStateRefreshWorking ? Icons.check : Icons.close),
      ],
    );
  }
}

/// List element for the [ListElementStateRefreshBehaviour].
class ListElementStateRefreshItem extends StatefulWidget {
  final String id;

  /// Creates a list element that indicates its current state
  /// by an alive timer followed by its identifier.
  const ListElementStateRefreshItem({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ListElementStateRefreshItem> createState() =>
      ListElementStateRefreshItemState();
}

class ListElementStateRefreshItemState
    extends State<ListElementStateRefreshItem> {
  int _aliveSinceSeconds = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          _aliveSinceSeconds++;
        });
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "I am alive since $_aliveSinceSeconds sec.",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      subtitle: Text(
        "Widget ID: ${widget.id}",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
