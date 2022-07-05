import '../../../src/shared_state/game/company.dart';
import '../../../src/widgets/app_bar/stat_badge.dart';

/// Visually indicates the level of joy via a Flare animation with distinct
/// sad, happy, neutral states and a call to attention animation whenever
/// the numeric value changes.
class JoyBadge extends StatBadge<double> {
  const JoyBadge(StatValue<double> statValue, {super.key, double scale = 1, bool isWide = false})
      : super('Joy', statValue,
            flare: 'assets/flare/Joy.flr', scale: scale, isWide: isWide);

  /// Play the celebration animation whenever there's a change
  /// 0 is a flag for always in this case
  @override
  double get celebrateAfter => 0;

  @override
  JoyBadgeState createState() => JoyBadgeState();
}

/// The three emotions this widget can display
enum Emotion { sad, happy, neutral }

class JoyBadgeState extends StatBadgeState<double> {
  Emotion? _emotion;

  Emotion? get emotion => _emotion;
  set emotion(Emotion? value) {
    if (value == _emotion) {
      return;
    }
    _emotion = value;
    switch (_emotion!) {
      case Emotion.sad:
        controls.play('sad');
        break;
      case Emotion.happy:
        controls.play('happy');
        break;
      case Emotion.neutral:
        controls.play('neutral');
        break;
    }
  }

  @override
  void valueChanged() {
    double joy = widget.statValue.number;
    if (joy < 0) {
      emotion = Emotion.sad;
    } else if (joy > 3) {
      emotion = Emotion.happy;
    } else {
      emotion = Emotion.neutral;
    }
    super.valueChanged();
  }
}
