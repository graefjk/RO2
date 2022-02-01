# Implementierung eines Softcore-Mikroprozessor für FPGAs
## Motivation
Dieses Projekt entsteht im Rahmen der Vorlesung Rechnerorganisation 2 an der Universität Stuttgart. Ziel der Vorlesung ist die Grundlagen des Entwurfs digitaler Schaltungen und Hardwarebeschreibungssprachen kennenzulernen. Hierzu soll in Gruppenarbeit ein 8-bit Mikroprozessor in der Beschreibungssprache VHDL erstellt werden. Dieser soll im Optimalfall korrekt auf einem ”field-programmable gate array“ (FPGA) ausgeführt werden. Zudem sollen einfache Programme in Maschinensprache für den Mikroprozessor entwickelt werden, um dessen Funktionsfähigkeit zu zeigen.
## Blockdiagramm
![Blockdiagramm](./Blockbeschreibungen/BlockdiagramErweitert.jpg?raw=true "TEST")
Die Abbildung zeigt die einzelnen Funktionsblöcke des Mikroprozessors, deren Verkabelung und Interaktionen. Schwarze Pfade zeigen hierbei einen Datenfluss zwischen den Blöcken an, während die blauen Pfade Steuerbefehle des Instruction Decoders anzeigen.
## Zielplattform
Der VHDL-Code wurde für ein Xilinx Zybo Z7-10 in der kostenfreien Version von Xilinx Vivado 2020.2 entwickelt und enthält daher teilweise plattformabhängigen Code zur Nutzung des integrierten Block-Ram, als auch im IO-Block.
