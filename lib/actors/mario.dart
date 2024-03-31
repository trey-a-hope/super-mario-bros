import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';
import 'package:super_mario_bros/constants/sprite_sheets.dart';

class Mario extends PlatformPlayer with HandleForces {
  bool inTrunk = false;

  Mario(Vector2 position)
      : super(
          position: position, //required
          animation: PlatformAnimations(
            idleRight: MarioSpriteSheet.idleRight,
            runRight: MarioSpriteSheet.runRight,
          ), //required
          size: Vector2.all(32),
          life: 100,
          speed: 200,
          countJumps: 1,
        );

  @override
  Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: Vector2.all(size.x / 2),
        position: Vector2(size.x / 4, size.y - size.x / 2),
        isSolid: true,
      ),
    );
    return super.onLoad();
  }

  @override
  void onJoystickChangeDirectional(JoystickDirectionalEvent event) {
    if (event.directional == JoystickMoveDirectional.MOVE_LEFT ||
        event.directional == JoystickMoveDirectional.MOVE_RIGHT ||
        event.directional == JoystickMoveDirectional.IDLE) {
      super.onJoystickChangeDirectional(event);
    }
  }

  @override
  void onJoystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN &&
        (event.id == LogicalKeyboardKey.space || event.id == 1)) {
      jump();
    }
    super.onJoystickAction(event);
  }

  @override
  bool onBlockMovement(Set<Vector2> intersectionPoints, GameComponent other) {
    if (other is TileWithCollision && other.tileClass == 'tree_trunk') {
      if (jumpingState == JumpingStateEnum.up) {
        inTrunk = true;
      } else if (other.top > center.y) {
        inTrunk = false;
      }
      if (inTrunk) {
        return false;
      }
    }

    return super.onBlockMovement(intersectionPoints, other);
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }
}
