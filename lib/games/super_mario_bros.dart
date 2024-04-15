import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:super_mario_bros/actors/mario.dart';
import 'package:super_mario_bros/constants/globals.dart';

class SuperMarioBrosGame extends StatefulWidget {
  const SuperMarioBrosGame({Key? key}) : super(key: key);

  @override
  State<SuperMarioBrosGame> createState() => _SuperMarioBrosGameState();
}

class _SuperMarioBrosGameState extends State<SuperMarioBrosGame> {
  /// Key for current state of the game.
  var _gameKey = UniqueKey();

  @override
  void initState() {
    // createPlatforms();
    super.initState();
  }

  // TODO: Follow Platform game to see how the Fox is standing on platforms.
  void createPlatforms() async {
    // final TiledComponent level = await TiledComponent.load(
    //   prefix: 'assets/images/',
    //   Globals.lv_1_1,
    //   Vector2.all(Globals.tileSize),
    // );

    // ObjectGroup? platformsLayer =
    //     level.tileMap.getLayer<ObjectGroup>('Platform Layer');

    // if (platformsLayer == null) {
    //   throw Exception('Platforms layer not found.');
    // }

    debugPrint('layer found');

    // for (final TiledObject obj in platformsLayer.objects) {
    //   final Platform platform = Platform(
    //     position: Vector2(obj.x, obj.y),
    //     size: Vector2(obj.width, obj.height),
    //   );
    //   gameRef.world.add(platform);
    // }
  }

  @override
  Widget build(BuildContext context) => BonfireWidget(
        key: _gameKey,
        map: WorldMapByTiled(
          TiledReader.asset(Globals.lv_1_1),
          forceTileSize: Vector2(
            32,
            32,
          ),
          objectsBuilder: {
            'Platform Layer': (properties) => Mario(
                  // size: Vector2.all(32),
                  properties.position,
                ),
          },
        ),
        globalForces: [
          GravityForce2D(),
        ],
        joystick: Joystick(
          directional: JoystickDirectional(),
          actions: [],
        ),
        player: Mario(
          Vector2(100, 100),
        ),
      );

  void reset() {
    setState(() {
      _gameKey = UniqueKey();
    });
  }
}
