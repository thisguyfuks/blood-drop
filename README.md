## BLOOD.DROP

<div align="center">

**P2P file transfer. Local network. No cloud. No accounts.**
Drop files between devices on the same WiFi using WebRTC.

</div>

---

## How It Works

| Part | Description |
|------|-------------|
| **Client** | Static HTML/CSS/JS. Handles UI and WebRTC peer connections. |
| **Server** | Node.js WebSocket signaling server. Matches devices on the same network and brokers the WebRTC handshake. Also handles file uploads for shareable links. |

> Files sent peer-to-peer **never touch the server**.

---

## Quick Start

### 1. Install server dependencies

```bash
cd server
npm install
```

### 2. Start the signaling server

```bash
node index.js
```

### 3. Serve the frontend

```bash
cd client
python3 -m http.server 8080
```

Open `http://localhost:8080` — or on another device on the same WiFi use your LAN IP.

Or just run `start.bat` on Windows to launch everything at once.

---

## Stack

- WebRTC Data Channels — peer-to-peer file transfer
- WebSocket — local signaling
- Node.js / Express — server
- Vanilla JS / HTML / CSS — frontend

---

## License

Apache License 2.0. See `LICENSE` for details.
