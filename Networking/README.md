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
  
| **Layer** | **Name**              | **Function**                                     |  **Examples**                         |
|-----------|-----------------------|--------------------------------------------------|---------------------------------------|
| **7**     | Application Layer     | User interface and end-user services.            | HTTP, FTP, SMTP, DNS                  |
| **6**     | Presentation Layer    | Data formatting, encryption, compression.        | SSL/TLS, ASCII, JPEG, MP4             |
| **5**     | Session Layer         | Establishes, manages, and terminates sessions.   | NetBIOS, RPC, SQL                     |
| **4**     | Transport Layer       | Reliable delivery of data and flow control.      | TCP, UDP                              |
| **3**     | Network Layer         | Logical addressing, routing, and forwarding.     | IP, ICMP, ARP, OSPF                   |
| **2**     | Data Link Layer       | Error detection and correction, physical addressing. | Ethernet, MAC, PPP, Wi-Fi         |
| **1**     | Physical Layer        | Transmission of raw bits over physical media.    | Cables, Hubs, Radio Frequencies       |

## 3. Protocols

A **protocol** is a set of rules defining how data is transmitted and received between devices in a network. Protocols ensure standardized communication, allowing different systems to interact seamlessly.

### Common Networking Protocols

#### **1. TCP - Transmission Control Protocol**
- Operates at the transport layer of the OSI model.
- Establishes a connection between two devices before data exchange.
- Ensures reliable and ordered delivery of information.

#### **2. IP - Internet Protocol**
- Operates at the network layer.
- Responsible for addressing and routing packets between devices.
- Supports **IPv4** (e.g., `192.168.1.1`) and **IPv6** (e.g., `2001:db8::ff00:42:8329`).

#### **3. UDP - User Datagram Protocol**
- Operates at the transport layer.
- Provides a connectionless service for fast, lightweight communication.
- Suitable for real-time applications like video streaming or online gaming.

#### **4. HTTP/HTTPS - HyperText Transfer Protocol**
- Operates at the application layer.
- Used for transferring web content between browsers and servers.

#### **5. DNS - Domain Name System**
- Translates human-readable domain names (e.g., `www.example.com`) into IP addresses.

---
## 4. Subnet

**Subnetting** is a technique used in computer networking to divide a larger IP network into smaller, more manageable sub-networks (subnets).

### Benefits of Subnetting:
- Efficient use of IP addresses.
- Improved network performance.
- Enhanced security by isolating traffic.

### Key Concepts in Subnetting:
- Each IP address consists of a **network part** and a **host part**.
- **Subnet masks** (e.g., `255.255.255.0`) define how many bits are allocated for the network and host portions.

### Example:
Given two IPs:
- `ip1 = 192.168.1.33`
- `ip2 = 192.168.1.62`

To calculate the subnet, determine their binary representation and apply the subnet mask.  
The common subnet for these two IPs could be **192.168.1.0/26**.

---

## 5. IP Addressing

An **IP Address** is a unique identifier assigned to devices on a network. It ensures data reaches the correct destination.

### Types of IP Addresses:

#### **1. IPv4:**
- Format: `192.168.1.1` (32-bit address).
- Range: 0 to 255.

#### **2. IPv6:**
- Format: `2001:0db8:85a3:0000:0000:8a2e:0370:7334` (128-bit address).
- Provides a vast number of addresses compared to IPv4.

### Private vs. Public IPs:
- **Private IPs:** Reserved for internal use within a network (e.g., `192.168.x.x`, `10.x.x.x`).
- **Public IPs:** Accessible on the internet and assigned by ISPs.








