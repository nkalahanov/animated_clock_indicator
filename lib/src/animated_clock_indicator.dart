import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'animated_clock_indicator_options.dart';

/// A widget that displays an animated clock with customizable appearance and behavior.
///
/// The [AnimatedClockIndicator] widget leverages the [AnimatedClockIndicatorOptions]
/// to provide extensive customization options, allowing developers to tailor the clock's
/// visual aspects and animation characteristics to fit their application's design requirements.
///
/// ## Example Usage
///
/// ```dart
/// AnimatedClockIndicator(
///   options: AnimatedClockIndicatorOptions(
///     borderWidth: 3.0,
///     minuteHandWidth: 2.0,
///     hourHandWidth: 2.5,
///     handInset: 2.5,
///     clockHandsLengthRatio: 0.618, // Golden ratio for harmonious proportions
///     minuteHandRotationDuration: Duration(milliseconds: 800),
///     minuteToHourRotationRatio: 12.0,
///     borderColor: Colors.orange,
///     minuteHandColor: Colors.deepOrange,
///     hourHandColor: Colors.orangeAccent,
///   ),
/// )
/// ```
///
@immutable
final class AnimatedClockIndicator extends StatefulWidget {
  /// Creates an [AnimatedClockIndicator] widget with optional [AnimatedClockIndicatorOptions].
  /// **Important:** Since [AnimatedClockIndicator] already includes a [RepaintBoundary],
  /// you should avoid wrapping it with another [RepaintBoundary] to maintain optimal performance.
  ///
  /// The [options] parameter allows customization of the clock's appearance and behavior.
  /// If not provided, default values defined in [AnimatedClockIndicatorOptions] are used.
  ///
  /// ## Parameters
  ///
  /// - [options]: An instance of [AnimatedClockIndicatorOptions] that defines the
  ///   clock's visual properties and animation settings.
  ///
  /// ## Constraints
  ///
  /// The [AnimatedClockIndicator] does not impose its own size constraints. To ensure proper rendering,
  /// you must provide explicit size constraints by wrapping it with widgets like [SizedBox], [Container],
  /// or by placing it within layouts that provide size constraints.
  ///
  /// ## Example
  ///
  /// ```dart
  /// SizedBox(
  ///   width: 100.0,
  ///   height: 100.0,
  ///   child: AnimatedClockIndicator(
  ///     options: AnimatedClockIndicatorOptions(
  ///       borderWidth: 3.0,
  ///       minuteHandWidth: 2.0,
  ///       hourHandWidth: 2.5,
  ///       handInset: 2.5,
  ///       clockHandsLengthRatio: 0.618, // Golden ratio for harmonious proportions
  ///       minuteHandRotationDuration: Duration(milliseconds: 800),
  ///       minuteToHourRotationRatio: 12.0,
  ///       borderColor: Colors.orange,
  ///       minuteHandColor: Colors.deepOrange,
  ///       hourHandColor: Colors.orangeAccent,
  ///     ),
  ///   ),
  /// )
  /// ```
  const AnimatedClockIndicator({
    super.key,
    this.options = const AnimatedClockIndicatorOptions(),
  });

  /// The options to customize the appearance and behavior of the clock.
  ///
  /// This includes parameters such as border width, hand widths, colors, rotation durations,
  /// and ratios that determine the relationship between the minute and hour hands.
  final AnimatedClockIndicatorOptions options;

  @override
  State<AnimatedClockIndicator> createState() => _AnimatedClockIndicatorState();
}

/// The state class for [AnimatedClockIndicator], responsible for managing the animation controller and rendering.
///
/// This class handles the initialization, animation control, and disposal of resources
/// required for the clock's animation. It ensures that the clock hands rotate smoothly
/// based on the provided [AnimatedClockIndicatorOptions].
class _AnimatedClockIndicatorState extends State<AnimatedClockIndicator>
    with SingleTickerProviderStateMixin {
  /// Controls the rotation animation of the clock hands.
  ///
  /// The [AnimationController] manages the animation's duration and repetition.
  late final AnimationController _animationController;

  /// Initializes the animation controller with a calculated duration based on the provided options.
  ///
  /// The [animationDuration] is determined by multiplying the [minuteHandRotationDuration]
  /// with the [minuteToHourRotationRatio], ensuring that the hour hand rotates at the correct speed
  /// relative to the minute hand.
  ///
  /// This method sets up the animation to repeat indefinitely, creating a continuous rotation effect.
  @override
  void initState() {
    super.initState();

    final options = widget.options;

    final Duration minuteHandDuration = options.minuteHandRotationDuration;

    final Duration animationDuration = Duration(
      microseconds: (minuteHandDuration.inMicroseconds *
              options.minuteToHourRotationRatio)
          .round(),
    );

    _animationController = AnimationController(
      vsync: this,
      upperBound: 2.0 * pi, // Represents a full 360-degree rotation.
      duration: animationDuration,
    )..repeat(); // Repeats the animation indefinitely.
  }

  /// Builds the widget tree for the animated clock.
  ///
  /// This method constructs the visual representation of the clock using a [CustomPaint]
  /// widget, which delegates the painting responsibilities to [_AnimatedClockIndicatorPainter].
  ///
  /// The [RepaintBoundary] widget optimizes performance by containing repaints within its subtree,
  /// preventing unnecessary redraws of parent widgets.
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        painter: _AnimatedClockIndicatorPainter(
          repaint: _animationController,
          options: widget.options,
        ),
      ),
    );
  }

  /// Disposes the animation controller to free up resources.
  ///
  /// This method ensures that the [AnimationController] is properly disposed of
  /// when the widget is removed from the widget tree, preventing memory leaks.
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

/// A custom painter responsible for rendering the animated clock, including the clock border and rotating hands.
final class _AnimatedClockIndicatorPainter extends CustomPainter {
  /// Creates an [_AnimatedClockIndicatorPainter] with the given [options] and [repaint] animation.
  _AnimatedClockIndicatorPainter({
    required this.options,
    required this.repaint,
  })  : _borderPaint = Paint()
          ..style = PaintingStyle.stroke
          ..color = options.borderColor
          ..strokeWidth = options.borderWidth,
        _minuteHandPaint = Paint()
          ..style = PaintingStyle.stroke
          ..color = options.minuteHandColor
          ..strokeWidth = options.minuteHandWidth
          ..strokeCap = options.minuteHandStrokeCap,
        _hourHandPaint = Paint()
          ..style = PaintingStyle.stroke
          ..color = options.hourHandColor
          ..strokeWidth = options.hourHandWidth
          ..strokeCap = options.hourHandStrokeCap,
        super(repaint: repaint);

  /// The options that customize the appearance of the clock.
  final AnimatedClockIndicatorOptions options;

  /// The animation that drives the rotation of the clock hands.
  final Animation<double> repaint;

  /// The paint used to draw the clock border.
  final Paint _borderPaint;

  /// The paint used to draw the minute hand.
  final Paint _minuteHandPaint;

  /// The paint used to draw the hour hand.
  final Paint _hourHandPaint;

  /// Offset adjustment flipped for stroke caps.
  Offset calculateStartOffset(Paint paint) {
    // Only apply the offset when the stroke cap is NOT square or round.
    return paint.strokeCap == StrokeCap.butt
        ? Offset(0, -paint.strokeWidth / 2)
        : Offset.zero;
  }

  /// Paints the clock on the given [canvas] with the specified [size].
  @override
  void paint(Canvas canvas, Size size) {
    final side = size.shortestSide;
    final r = (side - options.borderWidth) / 2;
    final minuteHandHeight = -r + options.borderWidth / 2 + options.handInset;
    final hourHandHeight = minuteHandHeight * options.clockHandsLengthRatio;

    final hourHandAngle = repaint.value;
    final minuteHandAngle = hourHandAngle * options.minuteToHourRotationRatio;

    final hourStartOffset = calculateStartOffset(_hourHandPaint);
    final minuteStartOffset = calculateStartOffset(_minuteHandPaint);

    canvas
      ..save()
      ..translate(size.width / 2, size.height / 2)
      ..drawCircle(Offset.zero, r, _borderPaint)
      ..save()
      ..rotate(hourHandAngle)
      ..drawLine(
        hourStartOffset,
        Offset(0, hourHandHeight),
        _hourHandPaint,
      )
      ..restore()
      ..save()
      ..rotate(minuteHandAngle)
      ..drawLine(
        minuteStartOffset,
        Offset(0, minuteHandHeight),
        _minuteHandPaint,
      )
      ..restore()
      ..restore();
  }

  /// Determines whether the painter should repaint based on the old delegate.
  @override
  bool shouldRepaint(_AnimatedClockIndicatorPainter oldDelegate) =>
      options != oldDelegate.options;
}
