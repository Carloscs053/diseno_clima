import 'package:http/http.dart';
import 'package:segundo_diseno/models/tiempo_response.dart';

class TiempoService {
  final _uri =
      'https://api.open-meteo.com/v1/forecast?latitude=37.7675&longitude=-3.9578&hourly=temperature_2m';

  Future<TemperaturaResponse> getTiempo() async {
    TemperaturaResponse temperatura = TemperaturaResponse();
    Response response = await get(Uri.parse(_uri));
    temperatura = temperaturaResponseFromJson(response.body);
    return temperatura;
  }
}
