<!DOCTYPE html>
<html>
<head>
  <title>Testing websockets</title>
</head>
<body>
<div>
  <input type="submit" value="Start" onclick="start()" />
</div>
<div id="messages"></div>
<script type="text/javascript">
    var webSocket =
        new WebSocket('ws://192.168.0.97:8080/websocketTest');
    webSocket.onerror = function(event) {
        onError(event)
    };

    webSocket.onopen = function(event) {
        onOpen(event)
    };

    webSocket.onmessage = function(event) {
        onMessage(event)
    };

    function onMessage(event) {
        document.getElementById('messages').innerHTML
            += '<br />' + event.data;
    }

    function onOpen(event) {
        document.getElementById('messages').innerHTML
            = 'Connection established';
    }

    function onError(event) {
        alert(event.data);
    }

    function start() {
        webSocket.send('hello');
        return false;
    }
</script>
</body>
</html>