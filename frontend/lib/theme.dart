import 'package:flutter/material.dart';

/// Use for sizing elements using 8-point grid.
///
/// A [SizedBox] has 32 pixel of height and 16 pixel of width:
///
/// ```dart
/// const SizedBox(height: ThemedSize.xl, width: ThemedSize.md)
/// ```
/// {@end-tool}
///
abstract class StyledSize {
  const StyledSize(double infinity);
  static const double grid = 8.0;

  static const double xs = grid / 2;
  static const double sm = grid;
  static const double md = grid * 2;
  static const double lg = grid * 3;
  static const double xl = grid * 4;
}

abstract class StyledColor {
  const StyledColor();

  // Color(0xFF<HEX>)
  static const Color white = Color(0xFFFAFAFA);
  static const Color greyLight = Color(0xFFF2F2F2);
  static const Color grey = Color(0xFFD9D9D9);
  static const Color greyDark = Color(0xFF7F7F7F);
  static const Color black = Color(0xFF262626);
  static const Color blue = Color(0xFF59AAF2);
}

abstract class StyledText {
  /// Creates a typography instance.
  const StyledText();

  static const title = TitleTextStyle();
}

class TitleTextStyle {
  const TitleTextStyle();

  TextStyle get lg {
    return const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle get sm {
    return const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
    );
  }
}

/// Allow spacing between widgets by inserting a fixed size spacer into a [Flex] container.
/// - `horizontal` variant used in a horizontal array, [Row]
/// - `vertical` variant used in a vertical array, [Column]
/// {@tool snippet}
///
/// 16 pixel space size between two [Text] widget in a [Column] :
///
/// ```dart
/// Column(
///   children: [
///     Text("Title", style: StyledText.title.md),
///     Spacing.vertical.md,
///     Text("Long paragraph text here", style: StyledText.body.md)
///   ],
/// ),
/// ```
/// {@end-tool}
///
abstract class Spacing {
  const Spacing();

  static const vertical = VerticalSpacing();
  static const horizontal = HorizontalSpacing();
}

class VerticalSpacing {
  const VerticalSpacing();

  SizedBox get xs {
    return const SizedBox(height: StyledSize.xs);
  }

  SizedBox get sm {
    return const SizedBox(height: StyledSize.sm);
  }

  SizedBox get md {
    return const SizedBox(height: StyledSize.md);
  }

  SizedBox get lg {
    return const SizedBox(height: StyledSize.lg);
  }

  SizedBox get xl {
    return const SizedBox(height: StyledSize.xl);
  }
}

class HorizontalSpacing {
  const HorizontalSpacing();

  SizedBox get xs {
    return const SizedBox(width: StyledSize.xs);
  }

  SizedBox get sm {
    return const SizedBox(width: StyledSize.sm);
  }

  SizedBox get md {
    return const SizedBox(width: StyledSize.md);
  }

  SizedBox get lg {
    return const SizedBox(width: StyledSize.lg);
  }

  SizedBox get xl {
    return const SizedBox(width: StyledSize.xl);
  }
}

abstract class StyledBorder {
  const StyledBorder();

  static final BoxBorder allGrey = Border.all(
    color: StyledColor.grey,
    width: 1,
  );

  static const BorderRadius rounded = BorderRadius.all(Radius.circular(10.0));

  static const BorderRadius roundedTop = BorderRadius.only(
    topLeft: Radius.circular(10.0),
    topRight: Radius.circular(10.0),
  );
}
