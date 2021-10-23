import 'package:get_server/get_server.dart';

import '../controllers/socket_controller.dart';

class SocketView extends GetView<SocketController> {
  @override
  Widget build(BuildContext context) {
    return Socket(builder: (GetSocket socket) {
      socket.onOpen((ws) {
        ws.send('socket ${ws.id} connected');
      });

      socket.on('join', (val) {
        final join = socket.join(val);
        if (join) {
          socket.sendToRoom(val, 'socket: ${socket.hashCode} join to room');
        }
      });
      socket.onMessage((data) {
        print('data: $data');
        socket.send(data);
      });

      socket.onClose((close) {
        print('socket has closed. Reason: ${close.message}');
      });
    });
  }
}
