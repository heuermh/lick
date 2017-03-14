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

// emulates the EchoPad iOS app
// http://www.holdernessmedia.com/home/ios-applications/music/echo-pad
public class EchoPad
{
    0 => static int OFF;
    127 => static int ON;
    7 => static int OUTPUT_GAIN_CC;
    10 => static int STEREO_PAN_CC;
    20 => static int LOOPER_RECORD_CC;
    21 => static int LOOPER_OVERDUB_CC;
    22 => static int LOOPER_CLEAR_CC;
    23 => static int LOOPER_FEEDBACK_CC;
    125 => static int LOAD_AB_PRESET_1_CC;
    226 => static int LOAD_AB_PRESET_2_CC;
    39 => static int MIX_CC;
    40 => static int FILTER_CC;
    41 => static int STEREO_DELAY_CC;
    42 => static int MULTITAP_1_2_CC;
    43 => static int MULTITAP_3_4_CC;
    44 => static int OIL_CAN_DELAY_CC;
    45 => static int REVERSE_DELAY_CC;
    46 => static int EIGHT_BIT_ECHO_CC;
    47 => static int SHIMMER_DELAY_CC;
    48 => static int FALL_CC;
    49 => static int RISE_CC;
    50 => static int ERRATIC_DELAY_CC;
    51 => static int DIST_1_CC;
    52 => static int DIST_2_CC;
    53 => static int NOISE_CC;
    54 => static int DECIMATOR_CC;
    55 => static int FLANGER_CC;
    56 => static int STEREOIZER_CC;
    57 => static int LFO_TO_LPF_CC;
    58 => static int LFO_TO_ECHO_CC;
    59 => static int BPM_SYNC_CC;
    102 => static int DELAY_MIX_CC;
    103 => static int DELAY_TIME_CC;
    104 => static int DELAY_FEEDBACK_HPF_CC;
    105 => static int DELAY_FEEDBACK_LPF_CC;
    106 => static int DELAY_FEEDBACK_CC;
    107 => static int RIGHT_CHANNEL_TIME_CC;
    108 => static int WOW_AND_FLUTTER_CC;
    109 => static int FILTER_FREQ_CC;
    110 => static int DECIMATOR_SAMPLE_RATE_CC;
    111 => static int DECIMATOR_BIT_DEPTH_CC;
    112 => static int FLANGER_RATE_CC;
    113 => static int FLANGER_TIME_CC;
    114 => static int LFO_RATE_CC;
    115 => static int LFO_AMOUNT_CC;
    116 => static int LFO_OUTPUT_CC;
    117 => static int REVERB_DECAY_CC;
    118 => static int REVERB_LEVEL_CC;
    120 => static int RESET_CC;
    0 => int _verbose;

    fun void open(int device)
    {
        <<<"open", device>>>;
    }

    fun int verbose()
    {
        return _verbose;
    }

    fun int verbose(int i)
    {
        i => _verbose;
        return _verbose;
    }

    fun void gain(int i)
    {
        cc("gain", OUTPUT_GAIN_CC, i);
    }

    fun void gain(float f)
    {
        cc("gain", OUTPUT_GAIN_CC, f);
    }

    fun void pan(int i)
    {
        cc("pan", STEREO_PAN_CC, i);
    }

    fun void pan(float f)
    {
        cc("pan", STEREO_PAN_CC, f);
    }

    fun void looperRecord()
    {
        cc("looper record", LOOPER_RECORD_CC, ON);
    }

    fun void looperOverdub()
    {
        cc("looper overdub", LOOPER_OVERDUB_CC, ON);
    }

    fun void looperClear()
    {
        cc("looper clear", LOOPER_CLEAR_CC, ON);
    }

    fun void looperFeedback(int i)
    {
        cc("looper feedback", LOOPER_FEEDBACK_CC, i);
    }

    fun void looperFeedback(float f)
    {
        cc("looper feedback", LOOPER_FEEDBACK_CC, f);
    }

    fun void loadABPreset1()
    {
        cc("load AB preset 1", LOAD_AB_PRESET_1_CC, ON);
    }

    fun void loadABPreset2()
    {
        cc("load AB preset 2", LOAD_AB_PRESET_2_CC, ON);
    }

    fun void mix(int i)
    {
        cc("mix", MIX_CC, i);
    }

    fun void mix(float f)
    {
        cc("mix", MIX_CC, f);
    }

    fun void filterOn()
    {
        cc("filter", FILTER_CC, ON);
    }

    fun void filterOff()
    {
        cc("filter", FILTER_CC, OFF);
    }

    fun void stereoDelayOn()
    {
        cc("stereo delay", STEREO_DELAY_CC, ON);
    }

    fun void stereoDelayOff()
    {
        cc("stereo delay", STEREO_DELAY_CC, OFF);
    }

    fun void multitap12On()
    {
        cc("multitap 1-2", MULTITAP_1_2_CC, ON);
    }

    fun void multitap12Off()
    {
        cc("multitap 1-2", MULTITAP_1_2_CC, OFF);
    }

    fun void multitap34On()
    {
        cc("multitap 3-4", MULTITAP_3_4_CC, ON);
    }

    fun void multitap34Off()
    {
        cc("multitap 3-4", MULTITAP_3_4_CC, OFF);
    }

    fun void oilCanDelayOn()
    {
        cc("oil can delay", OIL_CAN_DELAY_CC, ON);
    }

    fun void oilCanDelayOff()
    {
        cc("oil can delay", OIL_CAN_DELAY_CC, OFF);
    }

    fun void reverseDelayOn()
    {
        cc("reverse delay", REVERSE_DELAY_CC, ON);
    }

    fun void reverseDelayOff()
    {
        cc("reverse delay", REVERSE_DELAY_CC, OFF);
    }

    fun void eightBitEchoOn()
    {
        cc("8-bit echo", EIGHT_BIT_ECHO_CC, ON);
    }

    fun void eightBitEchoOff()
    {
        cc("8-bit echo", EIGHT_BIT_ECHO_CC, OFF);
    }

    fun void shimmerDelayOn()
    {
        cc("shimmer delay", SHIMMER_DELAY_CC, ON);
    }

    fun void shimmerDelayOff()
    {
        cc("shimmer delay", SHIMMER_DELAY_CC, OFF);
    }

    fun void fallOn()
    {
        cc("fall", FALL_CC, ON);
    }

    fun void fallOff()
    {
        cc("fall", FALL_CC, OFF);
    }

    fun void riseOn()
    {
        cc("rise", RISE_CC, ON);
    }

    fun void riseOff()
    {
        cc("rise", RISE_CC, OFF);
    }

    fun void erraticDelayOn()
    {
        cc("erratic delay", ERRATIC_DELAY_CC, ON);
    }

    fun void erraticDelayOff()
    {
        cc("erratic delay", ERRATIC_DELAY_CC, OFF);
    }

    fun void distortion1On()
    {
        cc("distortion 1", DIST_1_CC, ON);
    }

    fun void distortion1Off()
    {
        cc("distortion 1", DIST_1_CC, OFF);
    }

    fun void distortion2On()
    {
        cc("distortion 2", DIST_2_CC, ON);
    }

    fun void distortion2Off()
    {
        cc("distortion 2", DIST_2_CC, OFF);
    }

    fun void noiseOn()
    {
        cc("noise", NOISE_CC, ON);
    }

    fun void noiseOff()
    {
        cc("noise", NOISE_CC, OFF);
    }

    fun void decimatorOn()
    {
        cc("decimator", DECIMATOR_CC, ON);
    }

    fun void decimatorOff()
    {
        cc("decimator", DECIMATOR_CC, OFF);
    }

    fun void flangerOn()
    {
        cc("flanger", FLANGER_CC, ON);
    }

    fun void flangerOff()
    {
        cc("flanger", FLANGER_CC, OFF);
    }

    fun void stereoizerOn()
    {
        cc("stereoizer", STEREOIZER_CC, ON);
    }

    fun void stereoizerOff()
    {
        cc("stereoizer", STEREOIZER_CC, OFF);
    }

    fun void lfoToLpfOn()
    {
        cc("lfo to lpf", LFO_TO_LPF_CC, ON);
    }

    fun void lfoToLpfOff()
    {
        cc("lfo to lpf", LFO_TO_LPF_CC, OFF);
    }

    fun void lfoToEchoOn()
    {
        cc("lfo to echo", LFO_TO_ECHO_CC, ON);
    }

    fun void lfoToEchoOff()
    {
        cc("lfo to echo", LFO_TO_ECHO_CC, OFF);
    }

    fun void bpmSyncOn()
    {
        cc("bpm sync", BPM_SYNC_CC, ON);
    }

    fun void bpmSyncOff()
    {
        cc("bpm sync", BPM_SYNC_CC, OFF);
    }

    fun void delayMix(int i)
    {
        cc("delay mix", DELAY_MIX_CC, i);
    }

    fun void delayMix(float f)
    {
        cc("delay mix", DELAY_MIX_CC, f);
    }

    fun void delayTime(int i)
    {
        cc("delay time", DELAY_TIME_CC, i);
    }

    fun void delayTime(float f)
    {
        cc("delay time", DELAY_TIME_CC, f);
    }

    fun void delayFeedbackHpf(int i)
    {
        cc("delay feedback hpf", DELAY_FEEDBACK_HPF_CC, i);
    }

    fun void delayFeedbackHpf(float f)
    {
        cc("delay feedback hpf", DELAY_FEEDBACK_HPF_CC, f);
    }

    fun void delayFeedbackLpf(int i)
    {
        cc("delay feedback lpf", DELAY_FEEDBACK_LPF_CC, i);
    }

    fun void delayFeedbackLpf(float f)
    {
        cc("delay feedback lpf", DELAY_FEEDBACK_LPF_CC, f);
    }

    fun void delayFeedback(int i)
    {
        cc("delay feedback", DELAY_FEEDBACK_CC, i);
    }

    fun void delayFeedback(float f)
    {
        cc("delay feedback", DELAY_FEEDBACK_CC, f);
    }

    fun void rightChannelTime(int i)
    {
        cc("right channel time", RIGHT_CHANNEL_TIME_CC, i);
    }

    fun void rightChannelTime(float f)
    {
        cc("right channel time", RIGHT_CHANNEL_TIME_CC, f);
    }

    fun void wowAndFlutter(int i)
    {
        cc("wow and flutter", WOW_AND_FLUTTER_CC, i);
    }

    fun void wowAndFlutter(float f)
    {
        cc("wow and flutter", WOW_AND_FLUTTER_CC, f);
    }

    fun void filterFreq(int i)
    {
        cc("filter freq", FILTER_FREQ_CC, i);
    }

    fun void filterFreq(float f)
    {
        cc("filter freq", FILTER_FREQ_CC, f);
    }

    fun void decimatorSampleRate(int i)
    {
        cc("decimator sample rate", DECIMATOR_SAMPLE_RATE_CC, i);
    }

    fun void decimatorSampleRate(float f)
    {
        cc("decimator sample rate", DECIMATOR_SAMPLE_RATE_CC, f);
    }

    fun void decimatorBitDepth(int i)
    {
        cc("decimator bit depth", DECIMATOR_BIT_DEPTH_CC, i);
    }

    fun void decimatorBitDepth(float f)
    {
        cc("decimator bit depth", DECIMATOR_BIT_DEPTH_CC, f);
    }

    fun void flangerRate(int i)
    {
        cc("flanger rate", FLANGER_RATE_CC, i);
    }

    fun void flangerRate(float f)
    {
        cc("flanger rate", FLANGER_RATE_CC, f);
    }

    fun void flangerTime(int i)
    {
        cc("flanger time", FLANGER_TIME_CC, i);
    }

    fun void flangerTime(float f)
    {
        cc("flanger time", FLANGER_TIME_CC, f);
    }

    fun void lfoRate(int i)
    {
        cc("lfo rate", LFO_RATE_CC, i);
    }

    fun void lfoRate(float f)
    {
        cc("lfo rate", LFO_RATE_CC, f);
    }

    fun void lfoAmount(int i)
    {
        cc("lfo amount", LFO_AMOUNT_CC, i);
    }

    fun void lfoAmount(float f)
    {
        cc("lfo amount", LFO_AMOUNT_CC, f);
    }

    fun void lfoOutput(int i)
    {
        cc("lfo output", LFO_OUTPUT_CC, i);
    }

    fun void lfoOutput(float f)
    {
        cc("lfo output", LFO_OUTPUT_CC, f);
    }

    fun void reverbDecay(int i)
    {
        cc("reverb decay", REVERB_DECAY_CC, i);
    }

    fun void reverbDecay(float f)
    {
        cc("reverb decay", REVERB_DECAY_CC, f);
    }

    fun void reverbLevel(int i)
    {
        cc("reverb level", REVERB_LEVEL_CC, i);
    }

    fun void reverbLevel(float f)
    {
        cc("reverb level", REVERB_LEVEL_CC, f);
    }

    fun void reset()
    {
        cc("reset", RESET_CC, ON);
    }

    fun void cc(string name, int i, float v)
    {
        cc(name, i, toCC(v));
    }

    fun void cc(string name, int i, int v)
    {
        if (_verbose)
        {
            <<<"control change", name, i, v>>>;
        }
    }

    fun int toCC(float value)
    {
        if (value < 0.0)
        {
            return 0;
        }
        if (value > 1.0)
        {
            return 127;
        }
        return (value * 127.0) $ int;
    }
}


/*

Echo Pad Support
http://www.holdernessmedia.com/home/ios-applications/music/echo-pad/echo-pad-support

Parameter       Midi CC Value Range
Output Gain (Volume)    7       0-127
Stereo Pan Position     10      0-127
Looper Record   20      0-127
Looper Overdub  21      0-127
Clear Looper    22      127
Main Looper Feedback    23      0-127
Load AB Preset 125      127
Load AB Preset 226      127
FX Wet/Dry Mix  39      0-127
Filter Toggle   40      0-127
Stereo Delay Toggle     41      0-127
Multi-tap 1-2 Toggle    42      0-127
Multi-tap 3-4 Toggle    43      0-127
Oil Can Delay Toggle    44      0-127
Reverse Delay Toggle    45      0-127
8-bit Echo Toggle       46      0-127
Shimmer Delay Toggle    47      0-127
Fall Toggle     48      0-127
Rise Toggle     49      0-127
Erratic Delay Toggle    50      0-127
Distortion 1 Toggle     51      0-127
Distortion 2 Toggle     52      0-127
Noise Toggle    53      0-127
Decimator Toggle54      0-127
Flanger Toggle  55      0-127
Stereoizer Toggle       56      0-127
L.F.O. to Low Pass Filter Toggle57      0-127
L.F.O. To Echo Time Toggle      58      0-127
BPM Sync Toggle 59      0-127
Delay Mix       102     0-127
Delay Time      103     0-127
Delay Feedback High Pass Filter 104     0-127
Delay Feedback Low Pass Filter  105     0-127
Delay Feedback  106     0-127
Right Channel Time      107     0-127
Wow and Flutter 108     0-127
Filter Frequency109     0-127
Decimator Sample Rate   110     0-127
Decimator Bit Depth     111     0-127
Flanger Rate    112     0-127
Flanger Time    113     0-127
L.F.O. Rate     114     0-127
L.F.O. Amount   115     0-127
Output Low Pass Filter  116     0-127
Reverb Decay    117     0-127
Reverb Level    118     0-127
Reset all parameters    120     0-127
*/
