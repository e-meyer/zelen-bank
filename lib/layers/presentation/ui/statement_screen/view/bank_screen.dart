import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zelenbank/layers/presentation/controllers/banks_controller.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/components/statement_screen_app_bar.dart';

final appKey = GlobalKey();

class Bank extends StatelessWidget {
  const Bank({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appKey,
      appBar: const StatementAppBarWidget(
        title: 'Banco Zelen nas proximidades',
      ),
      body: ChangeNotifierProvider<BanksController>(
        create: (context) => BanksController(),
        child: Builder(builder: (context) {
          final local = context.watch<BanksController>();
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(local.lat, local.long),
              zoom: 18,
            ),
            zoomControlsEnabled: true,
            mapType: MapType.normal,
            myLocationEnabled: true,
            onMapCreated: local.onMapCreated,
            markers: local.markers,
          );
        }),
      ),
    );
  }
}
