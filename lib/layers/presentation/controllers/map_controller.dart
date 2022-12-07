import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zelenbank/core/map/map_locations.dart';
import 'package:zelenbank/layers/presentation/ui/map_screen/components/map_location_details_widget.dart';
import 'package:zelenbank/layers/presentation/ui/map_screen/view/map_screen.dart';

class MapController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erros = '';
  Set<Marker> markers = Set<Marker>();
  late GoogleMapController _mapsController;

  get mapsController => _mapsController;

  onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    await getPosicao();
    await loadBanks();
  }

  loadBanks() {
    final banks = MapRepository().banks;
    banks.forEach((bank) async {
      markers.add(
        Marker(
          infoWindow: InfoWindow(
            title: 'Zelen Bank',
            snippet:
                'ioasdbg oaduigboudag doua gboadui bfgouadbf ouadb oufbaduo',
          ),
          markerId: MarkerId(bank.nome),
          position: LatLng(bank.latitude, bank.longitude),
          icon: await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(),
            'assets/bank_map_icon.png',
          ),
          onTap: () => {
            showModalBottomSheet(
              context: appKey.currentState!.context,
              builder: (context) => MapLocationDetailsWidget(map: bank),
            )
          },
        ),
      );
    });
    notifyListeners();
  }

  getPosicao() async {
    try {
      Position posicao = await _currentPosition();
      lat = posicao.latitude;
      long = posicao.longitude;
      _mapsController.animateCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
    } catch (e) {
      erros = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _currentPosition() async {
    LocationPermission permission;

    bool activated = await Geolocator.isLocationServiceEnabled();
    if (!activated) {
      return Future.error('Por favor, habilite a localização no smartphone');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Você precisa autorizar o acesso à localização');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Você precisa autorizar o acesso à localização');
    }

    return await Geolocator.getCurrentPosition();
  }
}
