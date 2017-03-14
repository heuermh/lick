/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2017 held jointly by the individual authors.

    This file is part of LiCK.

    LiCK is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    LiCK is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with LiCK.  If not, see <http://www.gnu.org/licenses/>.

*/

// receive MIDI from the TwoPots Teensy hardware
public class TwoPotsMidi extends TwoPots
{
    MidiIn min;
    MidiMsg msg;

    fun int open(int device)
    {
        min.open(device);
        while (true)
        {
            min => now;
            while (min.recv(msg))
            {
                msg.data1 => int control;
                msg.data2 => int change;
                msg.data3 => int value;

                // if control == 173?
                if (change == 12)
                {
                    spork ~ pot1.run(value);
                }
                else if (change == 13)
                {
                    spork ~ pot2.run(value);
                }
                else if (change == 16)
                {
                    spork ~ pot1Msb.run(value);
                }
                else if (change == 17)
                {
                    spork ~ pot2Msb.run(value);
                }
                else if (change == 48)
                {
                    spork ~ pot1Lsb.run(value);
                }
                else if (change == 49)
                {
                    spork ~ pot2Lsb.run(value);
                }
            }
        }
    }
}

/*

  Two Pots Notes

Pot 1

CC12

Pot 2

CC13

Pot 1 MSB

CC16

Pot 1 LSB

CC48

Pot 2 MSB

CC17

Pot 2 LSB

CC49

*/

/**

Two Pots Teensy 2.0 sketch

int pot1 = 0;
int pot2 = 0;

int redPin =  15;
int greenPin =  12;
int bluePin =  14;

void setup() {
  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT);
}

void loop() {
  // pot1 is left, pot2 is right
  pot1 = analogRead(1);
  pot2 = analogRead(0);

  int red = (1023 - pot1) / 4;
  int blue = (1023 - pot2) / 4;

  analogWrite(redPin, constrain(red, 0, 255));
  analogWrite(greenPin, 255);
  analogWrite(bluePin, constrain(blue, 0, 255));

  // coarse on cc12 and cc13
  usbMIDI.sendControlChange(12, constrain(pot1 / 8, 0, 127), 1);
  usbMIDI.sendControlChange(13, constrain(pot2 / 8, 0, 127), 1);

  // fine via MSB and LSB, cc 16 and 48
  usbMIDI.sendControlChange(16, (pot1 >> 7) & 0x7f, 1);
  usbMIDI.sendControlChange(48, pot1 & 0x7f, 1);

  // and cc 17 and 49
  usbMIDI.sendControlChange(17, (pot2 >> 7) & 0x7f, 1);
  usbMIDI.sendControlChange(49, pot2 & 0x7f, 1);

  delay(5);
}

*/
