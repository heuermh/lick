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

class BellRide extends VelocitySensitiveSample
{
    {
        "BellRide" => name;
        samples.size(16);
        samples.clear();
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20_Bell01.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20_Bell02.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20_Bell03.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20_Bell04.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20_Bell05.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20_Bell06.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20_Bell07.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20_Bell08.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20_Bell09.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20_Bell10.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20_Bell11.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20_Bell12.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20_Bell13.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20_Bell14.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20_Bell15.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20_Bell16.wav"));
    }
}

class ClosedHat extends HandedSample
{
    {
        "ClosedHat" => name;
        leftHandSamples.size(16);
        leftHandSamples.clear();
        leftHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdLH01.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdLH02.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdLH03.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdLH04.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdLH05.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdLH06.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdLH07.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdLH08.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdLH09.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdLH10.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdLH11.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdLH12.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdLH13.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdLH14.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdLH15.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdLH16.wav"));

        rightHandSamples.size(16);
        rightHandSamples.clear();
        rightHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdRH01.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdRH02.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdRH03.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdRH04.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdRH05.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdRH06.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdRH07.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdRH08.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdRH09.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdRH10.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdRH11.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdRH12.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdRH13.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdRH14.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdRH15.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynClsdRH16.wav"));
    }
}

class Crash extends VelocitySensitiveSample
{
    {
        "Crash" => name;
        samples.size(8);
        samples.clear();
        samples.add(Samples.createSample("samples/BigMono/ZildjinCrsh 1-Dyn01.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildjinCrsh 1-Dyn02.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildjinCrsh 1-Dyn03.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildjinCrsh 1-Dyn04.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildjinCrsh 1-Dyn05.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildjinCrsh 1-Dyn06.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildjinCrsh 1-Dyn07.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildjinCrsh 1-Dyn08.wav"));
    }
}

class CrossStick extends Sample
{
    // empty
}

class DarkCrash extends VelocitySensitiveSample
{
    {
        "DarkCrash" => name;
        samples.size(8);
        samples.clear();
        samples.add(Samples.createSample("samples/BigMono/ZildjinCrsh 2-Dyn01.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildjinCrsh 2-Dyn02.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildjinCrsh 2-Dyn03.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildjinCrsh 2-Dyn04.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildjinCrsh 2-Dyn05.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildjinCrsh 2-Dyn06.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildjinCrsh 2-Dyn07.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildjinCrsh 2-Dyn08.wav"));
    }
}

class HighTom extends HandedSample
{
    {
        "HighTom" => name;
        leftHandSamples.size(16);
        leftHandSamples.clear();
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynLH01.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynLH02.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynLH03.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynLH04.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynLH05.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynLH06.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynLH07.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynLH08.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynLH09.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynLH10.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynLH11.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynLH12.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynLH13.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynLH14.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynLH15.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynLH16.wav"));

        rightHandSamples.size(16);
        rightHandSamples.clear();
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynRH01.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynRH02.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynRH03.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynRH04.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynRH05.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynRH06.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynRH07.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynRH08.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynRH09.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynRH10.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynRH11.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynRH12.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynRH13.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynRH14.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynRH15.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom1-DynRH16.wav"));
    }
}

class Kick extends VelocitySensitiveSample
{
    {
        "Kick" => name;
        samples.size(12);
        samples.clear();
        samples.add(Samples.createSample("samples/BigMono/CLudwigKick-Dyn01.wav"));
        samples.add(Samples.createSample("samples/BigMono/CLudwigKick-Dyn02.wav"));
        samples.add(Samples.createSample("samples/BigMono/CLudwigKick-Dyn03.wav"));
        samples.add(Samples.createSample("samples/BigMono/CLudwigKick-Dyn04.wav"));
        samples.add(Samples.createSample("samples/BigMono/CLudwigKick-Dyn05.wav"));
        samples.add(Samples.createSample("samples/BigMono/CLudwigKick-Dyn06.wav"));
        samples.add(Samples.createSample("samples/BigMono/CLudwigKick-Dyn07.wav"));
        samples.add(Samples.createSample("samples/BigMono/CLudwigKick-Dyn08.wav"));
        samples.add(Samples.createSample("samples/BigMono/CLudwigKick-Dyn09.wav"));
        samples.add(Samples.createSample("samples/BigMono/CLudwigKick-Dyn10.wav"));
        samples.add(Samples.createSample("samples/BigMono/CLudwigKick-Dyn11.wav"));
        samples.add(Samples.createSample("samples/BigMono/CLudwigKick-Dyn12.wav"));
    }
}

class LooseHat extends VelocitySensitiveSample
{
    {
        "LooseHat" => name;
        samples.size(16);
        samples.clear();
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynSmiOpn01.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynSmiOpn02.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynSmiOpn03.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynSmiOpn04.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynSmiOpn05.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynSmiOpn06.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynSmiOpn07.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynSmiOpn08.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynSmiOpn09.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynSmiOpn10.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynSmiOpn11.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynSmiOpn12.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynSmiOpn13.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynSmiOpn14.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynSmiOpn15.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynSmiOpn16.wav"));
    }
}

class LowTom extends HandedSample
{
    {
        "LowTom" => name;
        leftHandSamples.size(16);
        leftHandSamples.clear();
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynLH01.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynLH02.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynLH03.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynLH04.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynLH05.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynLH06.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynLH07.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynLH08.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynLH09.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynLH10.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynLH11.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynLH12.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynLH13.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynLH14.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynLH15.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynLH16.wav"));

        rightHandSamples.size(16);
        rightHandSamples.clear();
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynRH01.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynRH02.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynRH03.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynRH04.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynRH05.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynRH06.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynRH07.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynRH08.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynRH09.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynRH10.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynRH11.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynRH12.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynRH13.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynRH14.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynRH15.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/CLudwigTom2-DynRH16.wav"));
    }
}

class OpenHat extends VelocitySensitiveSample
{
    {
        "OpenHat" => name;
        samples.size(16);
        samples.clear();
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynOpn01.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynOpn02.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynOpn03.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynOpn04.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynOpn05.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynOpn06.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynOpn07.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynOpn08.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynOpn09.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynOpn10.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynOpn11.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynOpn12.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynOpn13.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynOpn14.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynOpn15.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynOpn16.wav"));
    }
}

class PedalledHat extends VelocitySensitiveSample
{
    {
        "PedalledHat" => name;
        samples.size(10);
        samples.clear();
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynPed01.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynPed02.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynPed03.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynPed04.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynPed05.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynPed06.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynPed07.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynPed08.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynPed09.wav"));
        samples.add(Samples.createSample("samples/BigMono/ZildMstrsnd-DynPed10.wav"));
    }
}

class Ride extends VelocitySensitiveSample
{
    {
        "Ride" => name;
        samples.size(16);
        samples.clear();
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20-Dyn01.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20-Dyn02.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20-Dyn03.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20-Dyn04.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20-Dyn05.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20-Dyn06.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20-Dyn07.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20-Dyn08.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20-Dyn09.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20-Dyn10.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20-Dyn11.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20-Dyn12.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20-Dyn13.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20-Dyn14.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20-Dyn15.wav"));
        samples.add(Samples.createSample("samples/BigMono/SabHHXEvo20-Dyn16.wav"));
    }
}

class Rim extends VelocitySensitiveSample
{
    {
        "Rim" => name;
        samples.size(8);
        samples.clear();
        samples.add(Samples.createSample("samples/BigMono/Rodgers_RimClck01.wav"));
        samples.add(Samples.createSample("samples/BigMono/Rodgers_RimClck02.wav"));
        samples.add(Samples.createSample("samples/BigMono/Rodgers_RimClck03.wav"));
        samples.add(Samples.createSample("samples/BigMono/Rodgers_RimClck04.wav"));
        samples.add(Samples.createSample("samples/BigMono/Rodgers_RimClck05.wav"));
        samples.add(Samples.createSample("samples/BigMono/Rodgers_RimClck06.wav"));
        samples.add(Samples.createSample("samples/BigMono/Rodgers_RimClck07.wav"));
        samples.add(Samples.createSample("samples/BigMono/Rodgers_RimClck08.wav"));
    }
}

class Snare extends HandedSample
{
    {
        "Snare" => name;
        leftHandSamples.size(16);
        leftHandSamples.clear();
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynLH01.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynLH02.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynLH03.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynLH04.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynLH05.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynLH06.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynLH07.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynLH08.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynLH09.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynLH10.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynLH11.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynLH12.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynLH13.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynLH14.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynLH15.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynLH16.wav"));

        rightHandSamples.size(16);
        rightHandSamples.clear();
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynRH01.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynRH02.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynRH03.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynRH04.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynRH05.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynRH06.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynRH07.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynRH08.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynRH09.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynRH10.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynRH11.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynRH12.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynRH13.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynRH14.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynRH15.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_DynRH16.wav"));
    }
}

class HardSnare extends HandedSample
{
    {
        "HardSnare" => name;
        leftHandSamples.size(8);
        leftHandSamples.clear();
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_HrdLH01.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_HrdLH02.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_HrdLH03.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_HrdLH04.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_HrdLH05.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_HrdLH06.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_HrdLH07.wav"));
        leftHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_HrdLH08.wav"));

        rightHandSamples.size(8);
        rightHandSamples.clear();
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_HrdRH01.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_HrdRH02.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_HrdRH03.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_HrdRH04.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_HrdRH05.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_HrdRH06.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_HrdRH07.wav"));
        rightHandSamples.add(Samples.createSample("samples/BigMono/Rodgers_HrdRH08.wav"));
    }
}

class PlaySamples extends UnaryProcedure
{
    fun void run(Object value)
    {
        value $ Sample @=> Sample sample;
        for (125 => int gain; gain > 10; gain - 10 => gain)
        {
            <<<sample.name, gain>>>;
            sample.asIntProcedure().run(gain);
            1200::ms => now;
            sample.asIntProcedure().run(gain);
            1200::ms => now;
            sample.asIntProcedure().run(gain);
            1200::ms => now;
            sample.asIntProcedure().run(gain);
            1200::ms => now;
        }
    }
}

// Analogue Drums Big Mono
public class BigMono
{
    //BellRide bellRide;
    ClosedHat closedHat;
    Crash crash;
    //CrossStick crossStick;
    DarkCrash darkCrash;
    HardSnare hardSnare;
    //HighTom highTom;
    Kick kick;
    //LooseHat looseHat;
    //LowTom lowTom;
    OpenHat openHat;
    //PedalledHat pedalledHat;
    //Ride ride;
    //Rim rim;
    Snare snare;

    fun void demo()
    {
        ArrayList samples;
        //samples.add(bellRide);
        samples.add(closedHat);
        samples.add(crash);
        //samples.add(crossStick);
        samples.add(darkCrash);
        samples.add(hardSnare);
        //samples.add(highTom);
        samples.add(kick);
        //samples.add(looseHat);
        //samples.add(lowTom);
        samples.add(openHat);
        //samples.add(pedalledHat);
        //samples.add(ride);
        //samples.add(rim);
        samples.add(snare);

        PlaySamples playSamples;
        samples.forEach(playSamples);
        <<<"done.">>>;
    }
}
