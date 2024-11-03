import 'package:flutter/material.dart';

/// A class that defines customizable options for the [AnimatedClockIndicator] widget,
/// allowing you to adjust the appearance and animation behavior of the clock.
///
/// The [AnimatedClockIndicatorOptions] class provides a comprehensive set of parameters
/// to tailor the visual and animation aspects of the [AnimatedClockIndicator]. By adjusting
/// these options, developers can create clock indicators that align with their application's
/// design language and performance requirements.
///
/// The [clockHandsLengthRatio] utilizes the golden ratio (0.618) by default to ensure
/// aesthetically pleasing proportions between the hour and minute hands.
@immutable
class AnimatedClockIndicatorOptions {
  /// Creates an [AnimatedClockIndicatorOptions] with the given parameters.
  ///
  /// All parameters are optional and have default values, allowing for flexible
  /// customization of the clock's appearance and behavior.
  ///
  /// - [borderWidth]: The thickness of the clock's border in logical pixels. Must be non-negative.
  /// - [minuteHandWidth]: The thickness of the minute hand in logical pixels. Must be non-negative.
  /// - [hourHandWidth]: The thickness of the hour hand in logical pixels. Must be non-negative.
  /// - [handInset]: The distance from the edge of the clock to the tip of the hands in logical pixels. Must be non-negative.
  /// - [clockHandsLengthRatio]: The ratio of the hour hand length to the minute hand length.
  ///   Defaults to 0.618, adhering to the golden ratio for aesthetically pleasing proportions.
  ///   Must be greater than 0 and less than or equal to 1.
  /// - [minuteHandRotationDuration]: The duration for the minute hand to complete one full rotation.
  ///   Defaults to 1000 milliseconds.
  /// - [minuteToHourRotationRatio]: The ratio between the rotation speeds of the minute and hour hands.
  ///   A value of 12.0 maintains the standard relationship in a traditional clock.
  ///   Must be greater than 0.
  /// - [borderColor]: The color of the clock's border. Defaults to [Colors.black].
  /// - [minuteHandColor]: The color of the minute hand. Defaults to [Colors.black].
  /// - [hourHandColor]: The color of the hour hand. Defaults to [Colors.black].
  /// - [minuteHandStrokeCap] and [hourHandStrokeCap] : The stroke cap style for the clock hands,
  ///   defining the appearance of their ends (e.g., rounded, square, or flat). The stroke cap affects
  ///   the visual style and potential positioning adjustments of each hand's end on the clock face.
  ///   Both default to [StrokeCap.round] for a polished, smooth finish.
  const AnimatedClockIndicatorOptions({
    this.borderWidth = 2.0,
    this.minuteHandWidth = 1.0,
    this.hourHandWidth = 1.5,
    this.handInset = 1.8,
    this.clockHandsLengthRatio = 0.618,
    this.minuteHandRotationDuration = const Duration(milliseconds: 1000),
    this.minuteToHourRotationRatio = 12.0,
    this.borderColor = Colors.black,
    this.minuteHandColor = Colors.black,
    this.hourHandColor = Colors.black,
    this.minuteHandStrokeCap = StrokeCap.round,
    this.hourHandStrokeCap = StrokeCap.round,
  })  : assert(borderWidth >= 0, 'borderWidth must be non-negative'),
        assert(minuteHandWidth >= 0, 'minuteHandWidth must be non-negative'),
        assert(hourHandWidth >= 0, 'hourHandWidth must be non-negative'),
        assert(handInset >= 0, 'handInset must be non-negative'),
        assert(clockHandsLengthRatio >= 0 && clockHandsLengthRatio <= 1,
            'clockHandsLengthRatio must be between 0 and 1'),
        assert(minuteToHourRotationRatio > 0,
            'minuteToHourRotationRatio must be greater than 0');

  /// Creates an [AnimatedClockIndicatorOptions] with a single [color] applied uniformly
  /// to the border, minute hand, and hour hand.
  ///
  /// This named constructor simplifies the creation of options when you want all
  /// the clock elements to share the same color. It leverages the golden ratio (0.618)
  /// for the [clockHandsLengthRatio], ensuring aesthetically pleasing proportions.
  ///
  /// **Example Usage:**
  /// ```dart
  /// const options = AnimatedClockIndicatorOptions.withUniformColor(
  ///   color: Colors.blue,
  ///   borderWidth: 3.0,
  ///   minuteHandWidth: 2.0,
  ///   hourHandWidth: 2.5,
  ///   handInset: 2.5,
  ///   minuteHandRotationDuration: Duration(milliseconds: 800),
  /// );
  /// ```
  const AnimatedClockIndicatorOptions.withUniformColor({
    this.borderWidth = 2.0,
    this.minuteHandWidth = 1.0,
    this.hourHandWidth = 1.5,
    this.handInset = 1.8,
    this.clockHandsLengthRatio = 0.618,
    this.minuteHandRotationDuration = const Duration(milliseconds: 1000),
    this.minuteToHourRotationRatio = 12.0,
    this.minuteHandStrokeCap = StrokeCap.round,
    this.hourHandStrokeCap = StrokeCap.round,
    required Color color,
  })  : borderColor = color,
        minuteHandColor = color,
        hourHandColor = color,
        assert(borderWidth >= 0, 'borderWidth must be non-negative'),
        assert(minuteHandWidth >= 0, 'minuteHandWidth must be non-negative'),
        assert(hourHandWidth >= 0, 'hourHandWidth must be non-negative'),
        assert(handInset >= 0, 'handInset must be non-negative'),
        assert(clockHandsLengthRatio >= 0 && clockHandsLengthRatio <= 1,
            'clockHandsLengthRatio must be between 0 and 1'),
        assert(minuteToHourRotationRatio > 0,
            'minuteToHourRotationRatio must be greater than 0');

  /// Creates an [AnimatedClockIndicatorOptions] with a customizable color, allowing shades or hex values.
  ///
  /// This named constructor enables the use of dynamic colors, such as shades or hex values, that cannot
  /// be assigned in a `const` context. It’s ideal for cases where non-constant colors are needed, providing
  /// flexibility while maintaining customizable control over other properties.
  ///
  /// **Example Usage:**
  /// ```dart
  /// final options = AnimatedClockIndicatorOptions.withCustomColor(
  ///   borderColor: Colors.teal.shade700,
  ///   minuteHandColor: Color(0xFF0050EF),
  ///   hourHandColor: Color(0xFF0078D7),
  ///   borderWidth: 3.0,
  ///   minuteHandWidth: 2.0,
  ///   hourHandWidth: 2.5,
  ///   handInset: 2.5,
  ///   minuteHandRotationDuration: Duration(milliseconds: 800),
  /// );
  /// ```
  const AnimatedClockIndicatorOptions.withCustomColor({
    this.borderWidth = 2.0,
    this.minuteHandWidth = 1.0,
    this.hourHandWidth = 1.5,
    this.handInset = 1.8,
    this.clockHandsLengthRatio = 0.618,
    this.minuteHandRotationDuration = const Duration(milliseconds: 1000),
    this.minuteToHourRotationRatio = 12.0,
    this.minuteHandStrokeCap = StrokeCap.round,
    this.hourHandStrokeCap = StrokeCap.round,
    required this.borderColor,
    required this.minuteHandColor,
    required this.hourHandColor,
  })  : assert(borderWidth >= 0, 'borderWidth must be non-negative'),
        assert(minuteHandWidth >= 0, 'minuteHandWidth must be non-negative'),
        assert(hourHandWidth >= 0, 'hourHandWidth must be non-negative'),
        assert(handInset >= 0, 'handInset must be non-negative'),
        assert(clockHandsLengthRatio >= 0 && clockHandsLengthRatio <= 1,
            'clockHandsLengthRatio must be between 0 and 1'),
        assert(minuteToHourRotationRatio > 0,
            'minuteToHourRotationRatio must be greater than 0');

  /// The width of the clock border, in logical pixels.
  ///
  /// Determines the thickness of the circular border surrounding the clock.
  final double borderWidth;

  /// The width of the minute hand, in logical pixels.
  ///
  /// Controls the thickness of the minute hand line.
  final double minuteHandWidth;

  /// The width of the hour hand, in logical pixels.
  ///
  /// Controls the thickness of the hour hand line.
  final double hourHandWidth;

  /// The inset from the edge of the clock to the end of the hands, in logical pixels.
  ///
  /// Defines how far the tips of the clock hands are inset from the outer border.
  final double handInset;

  /// The ratio of the hour hand length to the minute hand length.
  ///
  /// Utilizes the golden ratio (0.618) by default to ensure visually harmonious proportions.
  /// Adjusting this ratio affects the relative lengths of the hour and minute hands,
  /// influencing the clock's overall aesthetic.
  ///
  /// Must be greater than 0 and less than or equal to 1.
  final double clockHandsLengthRatio;

  /// The duration for a full rotation of the minute hand.
  ///
  /// Specifies how long it takes for the minute hand to complete one full 360-degree rotation.
  final Duration minuteHandRotationDuration;

  /// The rotation speed ratio between the minute and hour hands.
  ///
  /// A value of 12.0 ensures that the hour hand completes one rotation
  /// for every 12 rotations of the minute hand, maintaining the standard
  /// relationship observed in traditional clocks.
  ///
  /// Must be greater than 0.
  final double minuteToHourRotationRatio;

  /// The color of the clock border.
  ///
  /// Determines the visual color of the circular border surrounding the clock.
  final Color borderColor;

  /// The color of the minute hand.
  ///
  /// Sets the visual color of the minute hand line.
  final Color minuteHandColor;

  /// The color of the hour hand.
  ///
  /// Sets the visual color of the hour hand line.
  final Color hourHandColor;

  /// The stroke cap style for the minute hand, defaulting to [StrokeCap.round].
  final StrokeCap minuteHandStrokeCap;

  /// The stroke cap style for the hour hand, defaulting to [StrokeCap.round].
  final StrokeCap hourHandStrokeCap;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimatedClockIndicatorOptions &&
          runtimeType == other.runtimeType &&
          borderWidth == other.borderWidth &&
          minuteHandWidth == other.minuteHandWidth &&
          hourHandWidth == other.hourHandWidth &&
          handInset == other.handInset &&
          clockHandsLengthRatio == other.clockHandsLengthRatio &&
          minuteHandRotationDuration == other.minuteHandRotationDuration &&
          minuteToHourRotationRatio == other.minuteToHourRotationRatio &&
          borderColor == other.borderColor &&
          minuteHandColor == other.minuteHandColor &&
          hourHandColor == other.hourHandColor &&
          minuteHandStrokeCap == other.minuteHandStrokeCap &&
          hourHandStrokeCap == other.hourHandStrokeCap;

  @override
  int get hashCode => Object.hash(
        borderWidth,
        minuteHandWidth,
        hourHandWidth,
        handInset,
        clockHandsLengthRatio,
        minuteHandRotationDuration,
        minuteToHourRotationRatio,
        borderColor,
        minuteHandColor,
        minuteHandStrokeCap,
        hourHandStrokeCap,
      );

  @override
  String toString() => 'AnimatedClockIndicatorOptions('
      'borderWidth: $borderWidth, '
      'minuteHandWidth: $minuteHandWidth, '
      'hourHandWidth: $hourHandWidth, '
      'handInset: $handInset, '
      'clockHandsLengthRatio: $clockHandsLengthRatio, '
      'minuteHandRotationDuration: $minuteHandRotationDuration, '
      'minuteToHourRotationRatio: $minuteToHourRotationRatio, '
      'borderColor: $borderColor, '
      'minuteHandColor: $minuteHandColor, '
      'hourHandColor: $hourHandColor'
      'minuteHandStrokeCap: $minuteHandStrokeCap'
      'hourHandStrokeCap: $hourHandStrokeCap'
      ')';
}
