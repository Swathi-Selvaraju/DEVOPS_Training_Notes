# Networking

1. Introduction

2. OSI Model

3. Protocols

4. Subnet

5. IP Addressing

6. Common Networking Tools

## 1. Introduction

>  Networking refers to the practice of connecting computers and other devices to share resources, exchange data, and enable communication.
### INTERPRETATION 
* When any key on a keyboard is pressed, it is converted into binary numbers so that the computer can process the input, and the corresponding typed character appears on the screen.

* Networking enables communication between computers through structured protocols and hardware. It encompasses hardware devices, such as routers and switches, and software frameworks like protocols to ensure seamless data transfer.

   ![image](https://github.com/user-attachments/assets/0cd0d8c5-423b-4cd3-8ef6-d558285b50a0)
 ## 2. OSI Model

* OSI stands for Open Systems Interconnection
* The OSI model is a conceptual framework with seven layers that standardizes how different computer systems communicate.
* It divides networking tasks into layers, simplifying development and  troubleshooting network processes.
  
### OSI Model Layers
  
| **Layer** | **Name**              | **Function**                                     | **Examples**                          |
|-----------|-----------------------|--------------------------------------------------|---------------------------------------|
| **7**     | 🖥️ Application Layer  | User interface and end-user services.            | HTTP, FTP, SMTP, DNS                  |
| **6**     | 🎨 Presentation Layer | Data formatting, encryption, compression.        | SSL/TLS, ASCII, JPEG, MP4             |
| **5**     | 🔗 Session Layer      | Establishes, manages, and terminates sessions.   | NetBIOS, RPC, SQL                     |
| **4**     | 📦 Transport Layer    | Reliable delivery of data and flow control.      | TCP, UDP                              |
| **3**     | 🌍 Network Layer      | Logical addressing, routing, and forwarding.     | IP, ICMP, ARP, OSPF                   |
| **2**     | 🛜 Data Link Layer    | Error detection and correction, physical addressing. | Ethernet, MAC, PPP, Wi-Fi         |
| **1**     | ⚡ Physical Layer     | Transmission of raw bits over physical media.    | Cables, Hubs, Radio Frequencies       |

🌐 Detailed Explanation of Layers
1. Physical Layer
* Transmits raw binary data (0s and 1s) over physical media (wires, cables, radio signals).
* Deals with hardware connections, signal transmission, and voltage levels.
   * Example: Ethernet cables, hubs.

2. Data Link Layer
* Ensures error-free transfer of data frames between two connected nodes.
* Uses physical addresses (MAC) for communication.
    * Example: Ethernet (802.3), Wi-Fi (802.11).

3. Network Layer
* Handles logical addressing, routing, and forwarding of data packets.
* Determines the best path for data to reach its destination.
    * Example: IP, ICMP, ARP.

4. Transport Layer
* Provides end-to-end communication, ensuring reliable data delivery.
* Handles error correction, flow control, and segmentation.
    * Example: TCP (reliable), UDP (fast but unreliable).

5. Session Layer
* Manages sessions (connections) between applications.
* Starts, maintains, and terminates communication sessions.
    * Example: Remote Procedure Call (RPC), SQL sessions.

6. Presentation Layer
* Translates data into a readable format for the application.
* Handles encryption, compression, and data conversion.
    * Example: SSL/TLS, JPEG, MP4.

7. Application Layer
* Interfaces directly with end-users and applications.
* Provides network services such as file transfers, email, and web browsing.
    * Example: HTTP (web), FTP (file transfer), DNS (domain resolution).







