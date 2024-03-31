import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:super_mario_bros/constants/globals.dart';
import 'package:super_mario_bros/constants/sprite_sheets.dart';

class AnimationConfigs {
  AnimationConfigs._();

  static GoombaAnimationConfigs goomba = GoombaAnimationConfigs();
  static MarioAnimationConfigs mario = MarioAnimationConfigs();
  static SuperMarioAnimationConfigs superMario = SuperMarioAnimationConfigs();

  static BlockConfigs block = BlockConfigs();
}

class BlockConfigs {
  SpriteAnimation mysteryBlockIdle() => SpriteAnimation.variableSpriteList(
      List<Sprite>.generate(
          3,
          (index) =>
              SpriteSheets.itemBlocksSpriteSheet.getSprite(8, 5 + index)),
      stepTimes:
          List<double>.generate(3, (index) => Globals.mysteryBlockStepTime));

  SpriteAnimation mysteryBlockHit() => SpriteAnimation.variableSpriteList(
        [SpriteSheets.itemBlocksSpriteSheet.getSprite(7, 8)],
        stepTimes: [Globals.mysteryBlockStepTime],
      );

  SpriteAnimation brickBlockIdle() => SpriteAnimation.variableSpriteList(
        [SpriteSheets.itemBlocksSpriteSheet.getSprite(7, 17)],
        stepTimes: [Globals.mysteryBlockStepTime],
      );

  SpriteAnimation brickBlockHit() => SpriteAnimation.variableSpriteList(
        [SpriteSheets.itemBlocksSpriteSheet.getSprite(7, 19)],
        stepTimes: [double.infinity],
      );
}

class GoombaAnimationConfigs {
  SpriteAnimation walking() => SpriteAnimation.variableSpriteList(
      List<Sprite>.generate(
          2, (index) => SpriteSheets.goombaSpriteSheet.getSprite(0, index)),
      stepTimes:
          List<double>.generate(2, (index) => Globals.goombaSpriteStepTime));

  SpriteAnimation dead() => SpriteAnimation.variableSpriteList(
        [SpriteSheets.goombaSpriteSheet.getSprite(0, 2)],
        stepTimes: [Globals.goombaSpriteStepTime],
      );
}

class MarioAnimationConfigs {
  // Future<SpriteAnimation> idle() async =>
  //     SpriteAnimation.spriteList([await Sprite.load(Globals.marioIdle)],
  //         stepTime: Globals.marioSpriteStepTime);

  // Future<SpriteAnimation> walking() async => SpriteAnimation.spriteList(
  //     await Future.wait(
  //         [1, 2, 3].map((i) => Sprite.load('mario_${i}_walk.gif')).toList()),
  //     stepTime: Globals.marioSpriteStepTime);

  // Future<SpriteAnimation> jumping() async =>
  //     SpriteAnimation.spriteList([await Sprite.load(Globals.marioJump)],
  // //         stepTime: Globals.marioSpriteStepTime);
  // static SimpleDirectionAnimation greenNinjaAnimation({
  //   required SpriteSheet spriteSheet,
  // }) =>
  //     SimpleDirectionAnimation(
  //       // idleDown: SpriteAnimation.variableSpriteList(
  //       //   [spriteSheet.getSprite(0, 0)],
  //       //   stepTimes: [Globals.marioSpriteStepTime],
  //       // ),
  //       // runDown: SpriteAnimation.variableSpriteList(
  //       //   [
  //       //     spriteSheet.getSprite(0, 0),
  //       //     spriteSheet.getSprite(1, 0),
  //       //     spriteSheet.getSprite(2, 0),
  //       //     spriteSheet.getSprite(3, 0),
  //       //   ],
  //       //   stepTimes: [
  //       //     Globals.marioSpriteStepTime,
  //       //     Globals.marioSpriteStepTime,
  //       //     Globals.marioSpriteStepTime,
  //       //     Globals.marioSpriteStepTime,
  //       //   ],
  //       // ),
  //       // idleUp: SpriteAnimation.variableSpriteList(
  //       //   [spriteSheet.getSprite(0, 1)],
  //       //   stepTimes: [Globals.marioSpriteStepTime],
  //       // ),
  //       // runUp: SpriteAnimation.variableSpriteList(
  //       //   [
  //       //     spriteSheet.getSprite(0, 1),
  //       //     spriteSheet.getSprite(1, 1),
  //       //     spriteSheet.getSprite(2, 1),
  //       //     spriteSheet.getSprite(3, 1),
  //       //   ],
  //       //   stepTimes: [
  //       //     Globals.marioSpriteStepTime,
  //       //     Globals.marioSpriteStepTime,
  //       //     Globals.marioSpriteStepTime,
  //       //     Globals.marioSpriteStepTime,
  //       //   ],
  //       // ),
  //       // idleLeft: SpriteAnimation.variableSpriteList(
  //       //   [spriteSheet.getSprite(0, 2)],
  //       //   stepTimes: [Globals.marioSpriteStepTime],
  //       // ),
  //       // runLeft: SpriteAnimation.variableSpriteList(
  //       //   [
  //       //     spriteSheet.getSprite(0, 2),
  //       //     spriteSheet.getSprite(1, 2),
  //       //     spriteSheet.getSprite(2, 2),
  //       //     spriteSheet.getSprite(3, 2),
  //       //   ],
  //       //   stepTimes: [
  //       //     Globals.marioSpriteStepTime,
  //       //     Globals.marioSpriteStepTime,
  //       //     Globals.marioSpriteStepTime,
  //       //     Globals.marioSpriteStepTime,
  //       //   ],
  //       // ),
  //       // idleRight: SpriteAnimation.variableSpriteList(
  //       //   [Sprite.load(Globals.marioIdle)],
  //       //   stepTimes: [Globals.marioSpriteStepTime],
  //       // ),
  //       runRight: SpriteAnimation.variableSpriteList(
  //         [
  //           spriteSheet.getSprite(0, 3),
  //           spriteSheet.getSprite(1, 3),
  //           spriteSheet.getSprite(2, 3),
  //           spriteSheet.getSprite(3, 3),
  //         ],
  //         stepTimes: [
  //           Globals.marioSpriteStepTime,
  //           Globals.marioSpriteStepTime,
  //           Globals.marioSpriteStepTime,
  //           Globals.marioSpriteStepTime,
  //         ],
  //       ),
  //     );
}

class SuperMarioAnimationConfigs {
  Future<SpriteAnimation> idle() async =>
      SpriteAnimation.spriteList([await Sprite.load(Globals.superMarioIdle)],
          stepTime: Globals.marioSpriteStepTime);

  Future<SpriteAnimation> walking() async => SpriteAnimation.spriteList(
      await Future.wait([1, 2, 3]
          .map((i) => Sprite.load('super_mario_walk_$i.gif'))
          .toList()),
      stepTime: Globals.marioSpriteStepTime);

  Future<SpriteAnimation> climbing() async => SpriteAnimation.spriteList(
      await Future.wait(
          [1, 2].map((i) => Sprite.load('super_mario_climb_$i.gif')).toList()),
      stepTime: Globals.marioSpriteStepTime);

  Future<SpriteAnimation> swiming() async => SpriteAnimation.spriteList(
      await Future.wait([1, 2, 3, 4, 5, 6]
          .map((i) => Sprite.load('super_mario_swim_$i.gif'))
          .toList()),
      stepTime: Globals.marioSpriteStepTime);

  Future<SpriteAnimation> jumping() async =>
      SpriteAnimation.spriteList([await Sprite.load(Globals.superMarioJump)],
          stepTime: Globals.marioSpriteStepTime);

  Future<SpriteAnimation> ducking() async =>
      SpriteAnimation.spriteList([await Sprite.load(Globals.superMarioDuck)],
          stepTime: Globals.marioSpriteStepTime);
}
