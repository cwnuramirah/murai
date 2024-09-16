import 'package:flutter/material.dart';
import 'package:frontend/theme.dart';

class CancelNewPostConfirmationModal extends StatelessWidget {
  const CancelNewPostConfirmationModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(StyledSize.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () => Navigator.of(context)
              ..pop()
              ..pop(),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
              backgroundColor: StyledColor.greyLight,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              padding: const EdgeInsets.symmetric(
                vertical: StyledSize.md,
                horizontal: StyledSize.lg,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.delete_rounded),
                Spacing.horizontal.md,
                const Text('Delete'),
              ],
            ),
          ),
          Spacing.vertical.md,
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              backgroundColor: StyledColor.greyLight,
              foregroundColor: StyledColor.black,
              side: const BorderSide(color: StyledColor.black),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              padding: const EdgeInsets.symmetric(
                vertical: StyledSize.md,
                horizontal: StyledSize.lg,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.cancel_rounded),
                Spacing.horizontal.md,
                const Text('Cancel'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
