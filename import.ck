/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2014 held jointly by the individual authors.

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

// functional interfaces or functors, package fn
Machine.add("BinaryFunction.ck");
Machine.add("BinaryPredicate.ck");
Machine.add("BinaryProcedure.ck");
Machine.add("FloatFloatFloatFloatFunction.ck");
Machine.add("FloatFloatFloatFloatPredicate.ck");
Machine.add("FloatFloatFloatFloatProcedure.ck");
Machine.add("FloatFloatFloatFunction.ck");
Machine.add("FloatFloatFloatPredicate.ck");
Machine.add("FloatFloatFloatProcedure.ck");
Machine.add("FloatFloatFunction.ck");
Machine.add("FloatFloatPredicate.ck");
Machine.add("FloatFloatProcedure.ck");
Machine.add("FloatFunction.ck");
Machine.add("FloatPredicate.ck");
Machine.add("FloatProcedure.ck");
Machine.add("Function.ck");
Machine.add("IntFunction.ck");
Machine.add("IntIntFunction.ck");
Machine.add("IntIntIntFunction.ck");
Machine.add("IntIntIntIntFunction.ck");
Machine.add("IntIntIntIntPredicate.ck");
Machine.add("IntIntIntIntProcedure.ck");
Machine.add("IntIntIntPredicate.ck");
Machine.add("IntIntIntProcedure.ck");
Machine.add("IntIntFloatProcedure.ck");
Machine.add("IntIntPredicate.ck");
Machine.add("IntIntProcedure.ck");
Machine.add("IntFloatProcedure.ck");
Machine.add("IntFloatFloatProcedure.ck");
Machine.add("IntPredicate.ck");
Machine.add("IntProcedure.ck");
Machine.add("Predicate.ck");
Machine.add("Procedure.ck");
Machine.add("QuaternaryFunction.ck");
Machine.add("QuaternaryPredicate.ck");
Machine.add("TernaryFunction.ck");
Machine.add("TernaryPredicate.ck");
Machine.add("TernaryProcedure.ck");
Machine.add("UnaryFunction.ck");
Machine.add("UnaryPredicate.ck");
Machine.add("UnaryProcedure.ck");

// functions
Machine.add("Acos.ck");
Machine.add("Asin.ck");
Machine.add("Atan.ck");
Machine.add("Ceil.ck");
Machine.add("Cos.ck");
Machine.add("Cosh.ck");
Machine.add("Exp.ck");
Machine.add("Floor.ck");
Machine.add("Identity.ck");
Machine.add("Inverse.ck");
Machine.add("Log.ck");
Machine.add("Log10.ck");
Machine.add("Log2.ck");
Machine.add("Negate.ck");
Machine.add("Round.ck");
Machine.add("Sin.ck");
Machine.add("Sinh.ck");
Machine.add("Sqrt.ck");
Machine.add("Tan.ck");
Machine.add("Tanh.ck");
Machine.add("Trunc.ck");
Machine.add("Uniform.ck");

// composite functions
Machine.add("CompositeFloatFunction.ck");
Machine.add("CompositeFunction.ck");
Machine.add("CompositeIntFunction.ck");

// function convenience classes
Machine.add("Functions.ck");
Machine.add("FloatFunctions.ck");
Machine.add("IntFunctions.ck");

// interpolation, package interp
Machine.add("Interpolation.ck");
Machine.add("BackIn.ck");
Machine.add("BackOut.ck");
Machine.add("BackInOut.ck");
Machine.add("AbstractBounce.ck");
Machine.add("BounceIn.ck");
Machine.add("BounceOut.ck");
Machine.add("BounceInOut.ck");
Machine.add("CircularIn.ck");
Machine.add("CircularInOut.ck");
Machine.add("CircularOut.ck");
Machine.add("CubicIn.ck");
Machine.add("CubicInOut.ck");
Machine.add("CubicOut.ck");
Machine.add("ElasticIn.ck");
Machine.add("ElasticOut.ck");
Machine.add("ElasticInOut.ck");
Machine.add("ExponentialIn.ck");
Machine.add("ExponentialInOut.ck");
Machine.add("ExponentialOut.ck");
Machine.add("Linear.ck");
Machine.add("QuadraticIn.ck");
Machine.add("QuadraticInOut.ck");
Machine.add("QuadraticOut.ck");
Machine.add("QuarticIn.ck");
Machine.add("QuarticInOut.ck");
Machine.add("QuarticOut.ck");
Machine.add("QuinticIn.ck");
Machine.add("QuinticInOut.ck");
Machine.add("QuinticOut.ck");
Machine.add("Random.ck");
Machine.add("GaussianRandom.ck");
Machine.add("RandomFloor.ck");
Machine.add("RandomThreshold.ck");
Machine.add("SinusoidalIn.ck");
Machine.add("SinusoidalInOut.ck");
Machine.add("SinusoidalOut.ck");
Machine.add("Interpolate.ck");
Machine.add("Constrain.ck");
Machine.add("Interpolations.ck");

// duration providers, package duration
Machine.add("DurProvider.ck");
Machine.add("Humanize.ck");
Machine.add("HumanizedDurProvider.ck");
Machine.add("TimeSignature.ck");

// list, package collect
Machine.add("Comparator.ck");
Machine.add("Iterator.ck");
Machine.add("List.ck");
Machine.add("ListIterator.ck");
Machine.add("ArrayList.ck");

// int list
Machine.add("IntComparator.ck");
Machine.add("IntIterator.ck");
Machine.add("IntList.ck");
Machine.add("IntListIterator.ck");
Machine.add("IntArrayList.ck");

// float list
Machine.add("FloatComparator.ck");
Machine.add("FloatIterator.ck");
Machine.add("FloatList.ck");
Machine.add("FloatListIterator.ck");
Machine.add("FloatArrayList.ck");

// set
Machine.add("Set.ck");
Machine.add("ArraySet.ck");

// graphs
Machine.add("Node.ck");
Machine.add("Edge.ck");
Machine.add("Graph.ck");
Machine.add("Graphs.ck");

// intervals, chords, scales, package interval
Machine.add("Interval.ck");
Machine.add("Intervals.ck");
Machine.add("Chord.ck");
Machine.add("Chords.ck");
Machine.add("Scale.ck");
Machine.add("Scales.ck");

// arp, pattern, package arp
Machine.add("Arpeggiator.ck");
Machine.add("Arpeggiators.ck");
Machine.add("Pattern.ck");
Machine.add("Patterns.ck");
Machine.add("Warp.ck");

// midi tunings, package tuning
Machine.add("MidiNote.ck");
//Machine.add("MidiNotes.ck");
Machine.add("Tuning.ck");
Machine.add("Tunings.ck");
Machine.add("SYTunings.ck");

// unit test, package test
Machine.add("Assert.ck");

// simulators, package sim
Machine.add("Animoog.ck");
Machine.add("EchoPad.ck");
Machine.add("Filtatron.ck");
Machine.add("GarageBand.ck");
Machine.add("Loopy.ck");
Machine.add("MeeBlip.ck");
Machine.add("SooperLooper.ck");
Machine.add("TwoPots.ck");

// midi, package midi
Machine.add("ControlChangeMidiMsg.ck");
Machine.add("NoteOffMidiMsg.ck");
Machine.add("NoteOnMidiMsg.ck");
Machine.add("AnimoogMidi.ck");
Machine.add("EchoPadMidi.ck");
Machine.add("GarageBandMidi.ck");
Machine.add("FiltatronMidi.ck");
Machine.add("LoopyMidi.ck");
Machine.add("MeeBlipMidi.ck");
Machine.add("EuclidMidi.ck");
Machine.add("StompMidi.ck");
Machine.add("TwoPotsMidi.ck");
Machine.add("PodHd500Midi.ck");

// devices, package device
Machine.add("Keyboard.ck");
Machine.add("Joystick.ck");
Machine.add("LogitechGamepadF310.ck");
Machine.add("Monome.ck");
Machine.add("Mouse.ck");
Machine.add("NanoPad.ck");
Machine.add("MAudioOzone.ck");
Machine.add("AlesisQX25.ck");
Machine.add("StompKeyboard.ck");
Machine.add("PodHd500.ck");

// osc, package osc
Machine.add("ControlOscServer.ck");
Machine.add("EuclidOsc.ck");
Machine.add("IanniXOsc.ck");
Machine.add("LeapMotionOsc.ck");
Machine.add("SooperLooperOsc.ck");
Machine.add("TouchOscServer.ck");

// samples, package sample
Machine.add("Sample.ck");
Machine.add("AdsrSample.ck");
Machine.add("CompositeSample.ck");
Machine.add("RandomSample.ck");
Machine.add("PitchSensitiveSample.ck");
Machine.add("VelocitySensitiveSample.ck");
Machine.add("HandedSample.ck");
Machine.add("Samples.ck");

// procedures, package loop
Machine.add("Append.ck");
Machine.add("Prepend.ck");
Machine.add("Repeat.ck");
Machine.add("Sleep.ck");
Machine.add("Loop.ck");
Machine.add("Loops.ck");
Machine.add("LoopBuilder.ck");

// sample-based drum machines, package sample.drum
Machine.add("AkaiMpc60.ck");
Machine.add("EmuDrumulator.ck");
Machine.add("OberheimDmx.ck");
Machine.add("RolandCr78.ck");
Machine.add("RolandTr66.ck");
Machine.add("RolandTr606.ck");
Machine.add("RolandTr808.ck");
Machine.add("RolandTr909.ck");
Machine.add("BigMono.ck");
Machine.add("KorgMs20.ck");

// noise stuff, package noise
Machine.add("Pk3.ck");
Machine.add("Pke.ck");

// dist stuff, package dist
Machine.add("GainShaper.ck");
Machine.add("WaveShaper.ck");
Machine.add("BucketBrigade.ck");
Machine.add("Clip.ck");
Machine.add("Dist.ck");
Machine.add("AtanDist.ck");
Machine.add("TanhDist.ck");
Machine.add("RibbonDist.ck");
Machine.add("FrostburnDist.ck");
Machine.add("KijjazDist.ck");
Machine.add("KijjazDist2.ck");
Machine.add("KijjazDist3.ck");
Machine.add("KijjazDist4.ck");

// cv stuff, package module
Machine.add("Module.ck");
Machine.add("Module2.ck");
Machine.add("Module3.ck");
Machine.add("Module4.ck");
Machine.add("Module5.ck");
Machine.add("Module6.ck");
Machine.add("Module7.ck");
Machine.add("Module8.ck");

Machine.add("SampleHold.ck");
Machine.add("SlewStep.ck");
Machine.add("SmoothSampleHold.ck");
Machine.add("Lfo.ck");

// effects, package effect
Machine.add("Effect.ck");
Machine.add("AnalogDelay.ck");
Machine.add("CrossOver2.ck");
Machine.add("CrossOver3.ck");
Machine.add("CryBaby.ck");
Machine.add("DigitalDelay.ck");
Machine.add("Disaster.ck");
Machine.add("Drop.ck");
Machine.add("DualRect.ck");
Machine.add("Feedback.ck");
Machine.add("Flange.ck");
Machine.add("Flutter.ck");
Machine.add("Freeze.ck");
Machine.add("Harmonizer.ck");
Machine.add("Harmonizers.ck");
Machine.add("Mesmerizer.ck");
Machine.add("Raise.ck");
Machine.add("TimeModulator.ck");
Machine.add("Thicken.ck");
Machine.add("Tremolo.ck");

// delay stuff, package delay (or effect)
Machine.add("SinTrem.ck");
Machine.add("SqrTrem.ck");
Machine.add("TriTrem.ck");
Machine.add("Trem.ck");
Machine.add("MonoDelay.ck");
Machine.add("StereoDelay.ck");
Machine.add("FeedbackMachine.ck");
Machine.add("FeedbackMachines.ck");
Machine.add("StereoFeedbackMachine.ck");
Machine.add("StereoFeedbackMachines.ck");
Machine.add("Smear.ck");
Machine.add("ScaleSmear.ck");
Machine.add("Swirl.ck");

// synth/osc, package synth
Machine.add("CircleRamp.ck");
Machine.add("SawRamp.ck");
Machine.add("SubGen.ck");
Machine.add("SeptSubGen.ck");
Machine.add("VoiceOfSaturn.ck");
// Machine.add("DroneLab.ck");

// depends on default chugins, package effect
Machine.add("Crush.ck");

// package effect.jwmatthys
Machine.add("Expo.ck");
Machine.add("PitchFollower.ck");
Machine.add("SigmuFollower.ck");
Machine.add("SigmuGainFollower.ck");
Machine.add("SigmuPitchFollower.ck");
Machine.add("Spekt.ck");

// depends on LADSPA chugin, package ladspa
Machine.add("Ladspa.ck");

// C*APS plugins, package ladspa.caps
Machine.add("Caps.ck");
Machine.add("Amp.ck");
Machine.add("Cabinet.ck");
Machine.add("Eq.ck");
Machine.add("NoiseGate.ck");
Machine.add("ParametricEq.ck");
Machine.add("Plate.ck");
Machine.add("Saturate.ck");
Machine.add("Scape.ck");
Machine.add("StereoEq.ck");
Machine.add("StereoPlate.ck");
Machine.add("ToneStack.ck");
Machine.add("Princeton.ck");

// depends on C*APS plugins
Machine.add("Ring.ck");

// CMT plugins, package ladspa.cmt
Machine.add("Cmt.ck");
Machine.add("Lofi.ck");

// TAP-plugins, package ladspa.tap
Machine.add("Tap.ck");
Machine.add("TubeWarmth.ck");

// SWH plugins, package ladspa.swh
Machine.add("Swh.ck");
Machine.add("FreqShift.ck");
Machine.add("PitchScale.ck");
Machine.add("TapeDelay.ck");

// RubberBand plugins, package ladspa.rubberband
Machine.add("RubberBand.ck");

<<<"LiCK imported.">>>;