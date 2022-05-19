import 'package:flutter/material.dart';

class Effect extends StatefulWidget {
  const Effect({Key? key}) : super(key: key);

  @override
  State<Effect> createState() => _EffectState();
}

class _EffectState extends State<Effect> {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (Rect bounds) {
        return _shimmerGradient.createShader(bounds);
      },
      child: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, i) {
          return Column(
            children: const [
              Padding(
                padding: EdgeInsets.all(4.0),
                child: Card(
                  child: ListTile(
                    trailing: Padding(
                      padding: EdgeInsets.all(4.0),
                    ),
                    // title:
                    subtitle: Padding(
                      padding: EdgeInsets.all(4.0),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

const _shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);
