# assetto_corsa_toyBox

# Assetto Corsa Arduino Controller

This project connects your Arduino-based TC, ABS, and Turbo control system to **Assetto Corsa** using AutoHotkey (AHK). Data from Arduino is sent via serial communication and translated into in-game key presses.

---

## Contents

- Arduino Code: `AssettoController.ino`
- AutoHotkey Script: `AssettoAHK.ahk`

---

## Requirements

- Arduino Uno (or compatible board)
- TC and ABS buttons
- Potentiometer (Turbo)
- AutoHotkey v2
- Assetto Corsa (PC)
- Windows OS

---

## Arduino Setup

1. Open Arduino IDE.
2. Upload `AssettoController.ino` to your Arduino.
3. Connections:
   - TC button → D2
   - ABS button → D3
   - Turbo potentiometer → A0
4. Connect Arduino to your PC and note the COM port number.

---

## AutoHotkey Setup


1. Open `AssettoAHK.ahk` and set your COM port:

```ahk
COMPort := "COM4"  ; Change to your Arduino COM port
baudRate := 9600
