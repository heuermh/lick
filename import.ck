/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2012 held jointly by the individual authors.

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

// functors, package functor
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

// interpolation, package interpolate
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

// duration providers, package duration
Machine.add("DurProvider.ck");
Machine.add("Humanize.ck");
Machine.add("HumanizedDurProvider.ck");

// procedures, package loop
Machine.add("Append.ck");
Machine.add("Prepend.ck");
Machine.add("Repeat.ck");
Machine.add("Sleep.ck");
Machine.add("Loop.ck");
Machine.add("Loops.ck");
Machine.add("LoopBuilder.ck");

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

// intervals, chords, arpeggiator
Machine.add("TimeSignature.ck"); // package duration?
Machine.add("Interval.ck");
Machine.add("Intervals.ck");
Machine.add("Chord.ck");
Machine.add("Chords.ck");
Machine.add("Arpeggiator.ck");
Machine.add("Arpeggiators.ck");

// unit test, package test
Machine.add("Assert.ck");

// simulators, package simulator
Machine.add("Animoog.ck");
Machine.add("GarageBand.ck");
Machine.add("Loopy.ck");
Machine.add("MeeBlip.ck");
// Machine.add("DroneLab.ck");
Machine.add("VoiceOfSaturn.ck");

// midi, package midi
Machine.add("ControlChangeMidiMsg.ck");
Machine.add("NoteOffMidiMsg.ck");
Machine.add("NoteOnMidiMsg.ck");
Machine.add("AnimoogMidi.ck");
Machine.add("GarageBandMidi.ck");
Machine.add("LoopyMidi.ck");
Machine.add("MeeBlipMidi.ck");
Machine.add("EuclidMidi.ck");

// devices, package device
Machine.add("Keyboard.ck");
Machine.add("Joystick.ck");
Machine.add("LogitechGamepadF310.ck");
Machine.add("Monome.ck");
Machine.add("Mouse.ck");
Machine.add("NanoPad.ck");
Machine.add("Ozone.ck");

// osc, package osc
Machine.add("ControlOscServer.ck");
Machine.add("EuclidOsc.ck");
Machine.add("IanniXOsc.ck");
//Machine.add("SooperLooperOsc.ck");
Machine.add("TouchOscServer.ck");

// sample-based drum machines, package sample
Machine.add("Sample.ck");
Machine.add("CompositeSample.ck");
Machine.add("RandomSample.ck");
Machine.add("PitchSensitiveSample.ck");
Machine.add("VelocitySensitiveSample.ck");
Machine.add("HandedSample.ck");
Machine.add("Samples.ck");
Machine.add("AkaiMpc60.ck");
Machine.add("EmuDrumulator.ck");
Machine.add("OberheimDmx.ck");
Machine.add("RolandCr78.ck");
Machine.add("RolandTr66.ck");
Machine.add("RolandTr606.ck");
Machine.add("RolandTr808.ck");
Machine.add("RolandTr909.ck");
Machine.add("BigMono.ck");

// delay stuff
Machine.add("Trem.ck");
Machine.add("Tremolo.ck");
Machine.add("MonoDelay.ck");
Machine.add("MonoDelayA.ck");
Machine.add("MonoDelayL.ck");
Machine.add("StereoDelay.ck");
Machine.add("StereoDelayA.ck");
Machine.add("StereoDelayL.ck");
Machine.add("FeedbackMachine.ck");
Machine.add("FeedbackMachines.ck");
Machine.add("FeedbackMachineA.ck");
Machine.add("FeedbackMachineL.ck");
Machine.add("StereoFeedbackMachine.ck");
Machine.add("StereoFeedbackMachines.ck");
Machine.add("StereoFeedbackMachineA.ck");
Machine.add("StereoFeedbackMachineL.ck");

<<<"LiCK imported.">>>;