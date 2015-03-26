/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2015 held jointly by the individual authors.

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
Machine.add("lick/fn/BinaryFunction.ck");
Machine.add("lick/fn/BinaryPredicate.ck");
Machine.add("lick/fn/BinaryProcedure.ck");
Machine.add("lick/fn/FloatFloatFloatFloatFunction.ck");
Machine.add("lick/fn/FloatFloatFloatFloatPredicate.ck");
Machine.add("lick/fn/FloatFloatFloatFloatProcedure.ck");
Machine.add("lick/fn/FloatFloatFloatFunction.ck");
Machine.add("lick/fn/FloatFloatFloatPredicate.ck");
Machine.add("lick/fn/FloatFloatFloatProcedure.ck");
Machine.add("lick/fn/FloatFloatFunction.ck");
Machine.add("lick/fn/FloatFloatPredicate.ck");
Machine.add("lick/fn/FloatFloatProcedure.ck");
Machine.add("lick/fn/FloatFunction.ck");
Machine.add("lick/fn/FloatPredicate.ck");
Machine.add("lick/fn/FloatProcedure.ck");
Machine.add("lick/fn/Function.ck");
Machine.add("lick/fn/IntFunction.ck");
Machine.add("lick/fn/IntIntFunction.ck");
Machine.add("lick/fn/IntIntIntFunction.ck");
Machine.add("lick/fn/IntIntIntIntFunction.ck");
Machine.add("lick/fn/IntIntIntIntPredicate.ck");
Machine.add("lick/fn/IntIntIntIntProcedure.ck");
Machine.add("lick/fn/IntIntIntPredicate.ck");
Machine.add("lick/fn/IntIntIntProcedure.ck");
Machine.add("lick/fn/IntIntFloatProcedure.ck");
Machine.add("lick/fn/IntIntPredicate.ck");
Machine.add("lick/fn/IntIntProcedure.ck");
Machine.add("lick/fn/IntFloatProcedure.ck");
Machine.add("lick/fn/IntFloatFloatProcedure.ck");
Machine.add("lick/fn/IntPredicate.ck");
Machine.add("lick/fn/IntProcedure.ck");
Machine.add("lick/fn/Predicate.ck");
Machine.add("lick/fn/Procedure.ck");
Machine.add("lick/fn/QuaternaryFunction.ck");
Machine.add("lick/fn/QuaternaryPredicate.ck");
Machine.add("lick/fn/TernaryFunction.ck");
Machine.add("lick/fn/TernaryPredicate.ck");
Machine.add("lick/fn/TernaryProcedure.ck");
Machine.add("lick/fn/UnaryFunction.ck");
Machine.add("lick/fn/UnaryPredicate.ck");
Machine.add("lick/fn/UnaryProcedure.ck");

// functions
Machine.add("lick/fn/Acos.ck");
Machine.add("lick/fn/Asin.ck");
Machine.add("lick/fn/Atan.ck");
Machine.add("lick/fn/Ceil.ck");
Machine.add("lick/fn/Cos.ck");
Machine.add("lick/fn/Cosh.ck");
Machine.add("lick/fn/Exp.ck");
Machine.add("lick/fn/Floor.ck");
Machine.add("lick/fn/Identity.ck");
Machine.add("lick/fn/Inverse.ck");
Machine.add("lick/fn/Log.ck");
Machine.add("lick/fn/Log10.ck");
Machine.add("lick/fn/Log2.ck");
Machine.add("lick/fn/Negate.ck");
Machine.add("lick/fn/Round.ck");
Machine.add("lick/fn/Sin.ck");
Machine.add("lick/fn/Sinh.ck");
Machine.add("lick/fn/Sqrt.ck");
Machine.add("lick/fn/Tan.ck");
Machine.add("lick/fn/Tanh.ck");
Machine.add("lick/fn/Trunc.ck");
Machine.add("lick/fn/Uniform.ck");

// composite functions
Machine.add("lick/fn/CompositeFloatFunction.ck");
Machine.add("lick/fn/CompositeFunction.ck");
Machine.add("lick/fn/CompositeIntFunction.ck");

// function convenience classes
Machine.add("lick/fn/Functions.ck");
Machine.add("lick/fn/FloatFunctions.ck");
Machine.add("lick/fn/IntFunctions.ck");

// interpolation, package interp
Machine.add("lick/interpolate/Interpolation.ck");
Machine.add("lick/interpolate/BackIn.ck");
Machine.add("lick/interpolate/BackOut.ck");
Machine.add("lick/interpolate/BackInOut.ck");
Machine.add("lick/interpolate/AbstractBounce.ck");
Machine.add("lick/interpolate/BounceIn.ck");
Machine.add("lick/interpolate/BounceOut.ck");
Machine.add("lick/interpolate/BounceInOut.ck");
Machine.add("lick/interpolate/CircularIn.ck");
Machine.add("lick/interpolate/CircularInOut.ck");
Machine.add("lick/interpolate/CircularOut.ck");
Machine.add("lick/interpolate/CubicIn.ck");
Machine.add("lick/interpolate/CubicInOut.ck");
Machine.add("lick/interpolate/CubicOut.ck");
Machine.add("lick/interpolate/ElasticIn.ck");
Machine.add("lick/interpolate/ElasticOut.ck");
Machine.add("lick/interpolate/ElasticInOut.ck");
Machine.add("lick/interpolate/ExponentialIn.ck");
Machine.add("lick/interpolate/ExponentialInOut.ck");
Machine.add("lick/interpolate/ExponentialOut.ck");
Machine.add("lick/interpolate/Linear.ck");
Machine.add("lick/interpolate/QuadraticIn.ck");
Machine.add("lick/interpolate/QuadraticInOut.ck");
Machine.add("lick/interpolate/QuadraticOut.ck");
Machine.add("lick/interpolate/QuarticIn.ck");
Machine.add("lick/interpolate/QuarticInOut.ck");
Machine.add("lick/interpolate/QuarticOut.ck");
Machine.add("lick/interpolate/QuinticIn.ck");
Machine.add("lick/interpolate/QuinticInOut.ck");
Machine.add("lick/interpolate/QuinticOut.ck");
Machine.add("lick/interpolate/Random.ck");
Machine.add("lick/interpolate/GaussianRandom.ck");
Machine.add("lick/interpolate/RandomFloor.ck");
Machine.add("lick/interpolate/RandomThreshold.ck");
Machine.add("lick/interpolate/SinusoidalIn.ck");
Machine.add("lick/interpolate/SinusoidalInOut.ck");
Machine.add("lick/interpolate/SinusoidalOut.ck");
Machine.add("lick/interpolate/Interpolate.ck");
Machine.add("lick/interpolate/Constrain.ck");
Machine.add("lick/interpolate/Interpolations.ck");

// duration providers, package duration
Machine.add("lick/duration/DurProvider.ck");
Machine.add("lick/duration/Humanize.ck");
Machine.add("lick/duration/HumanizedDurProvider.ck");
Machine.add("lick/duration/TimeSignature.ck");

// list, package collect
Machine.add("lick/collect/Comparator.ck");
Machine.add("lick/collect/Iterator.ck");
Machine.add("lick/collect/List.ck");
Machine.add("lick/collect/ListIterator.ck");
Machine.add("lick/collect/ArrayList.ck");

// int list
Machine.add("lick/collect/IntComparator.ck");
Machine.add("lick/collect/IntIterator.ck");
Machine.add("lick/collect/IntList.ck");
Machine.add("lick/collect/IntListIterator.ck");
Machine.add("lick/collect/IntArrayList.ck");

// float list
Machine.add("lick/collect/FloatComparator.ck");
Machine.add("lick/collect/FloatIterator.ck");
Machine.add("lick/collect/FloatList.ck");
Machine.add("lick/collect/FloatListIterator.ck");
Machine.add("lick/collect/FloatArrayList.ck");

// set
Machine.add("lick/collect/Set.ck");
Machine.add("lick/collect/ArraySet.ck");

// graphs
Machine.add("lick/collect/Node.ck");
Machine.add("lick/collect/Edge.ck");
Machine.add("lick/collect/Graph.ck");
Machine.add("lick/collect/Graphs.ck");

// intervals, chords, scales, package interval
Machine.add("lick/interval/Interval.ck");
Machine.add("lick/interval/Intervals.ck");
Machine.add("lick/interval/Chord.ck");
Machine.add("lick/interval/Chords.ck");
Machine.add("lick/interval/Scale.ck");
Machine.add("lick/interval/Scales.ck");

// arp, pattern, package arp
Machine.add("lick/arp/Arpeggiator.ck");
Machine.add("lick/arp/Arpeggiators.ck");
Machine.add("lick/arp/Pattern.ck");
Machine.add("lick/arp/Patterns.ck");
Machine.add("lick/arp/Warp.ck");

// midi tunings, package tuning
Machine.add("lick/tuning/MidiNote.ck");
Machine.add("lick/tuning/Tuning.ck");
Machine.add("lick/tuning/Tunings.ck");
Machine.add("lick/tuning/SYTunings.ck");

// unit test, package test
Machine.add("lick/test/Assert.ck");

// simulators, package sim
Machine.add("lick/sim/Animoog.ck");
Machine.add("lick/sim/EchoPad.ck");
Machine.add("lick/sim/Filtatron.ck");
Machine.add("lick/sim/GarageBand.ck");
Machine.add("lick/sim/Loopy.ck");
Machine.add("lick/sim/MeeBlip.ck");
Machine.add("lick/sim/SooperLooper.ck");
Machine.add("lick/sim/TwoPots.ck");

// midi, package midi
Machine.add("lick/midi/ControlChangeMidiMsg.ck");
Machine.add("lick/midi/NoteOffMidiMsg.ck");
Machine.add("lick/midi/NoteOnMidiMsg.ck");
Machine.add("lick/midi/AnimoogMidi.ck");
Machine.add("lick/midi/EchoPadMidi.ck");
Machine.add("lick/midi/GarageBandMidi.ck");
Machine.add("lick/midi/FiltatronMidi.ck");
Machine.add("lick/midi/LoopyMidi.ck");
Machine.add("lick/midi/MeeBlipMidi.ck");
Machine.add("lick/midi/EuclidMidi.ck");
Machine.add("lick/midi/StompMidi.ck");
Machine.add("lick/midi/TwoPotsMidi.ck");
Machine.add("lick/midi/PodHd500Midi.ck");

// devices, package device
Machine.add("lick/device/Keyboard.ck");
Machine.add("lick/device/Joystick.ck");
Machine.add("lick/device/LogitechGamepadF310.ck");
Machine.add("lick/device/Monome.ck");
Machine.add("lick/device/Mouse.ck");
Machine.add("lick/device/NanoPad.ck");
Machine.add("lick/device/MAudioOzone.ck");
Machine.add("lick/device/AlesisQX25.ck");
Machine.add("lick/device/StompKeyboard.ck");
Machine.add("lick/device/PodHd500.ck");

// osc, package osc
Machine.add("lick/osc/ControlOscServer.ck");
Machine.add("lick/osc/EuclidOsc.ck");
Machine.add("lick/osc/IanniXOsc.ck");
Machine.add("lick/osc/LeapMotionOsc.ck");
Machine.add("lick/osc/SooperLooperOsc.ck");
Machine.add("lick/osc/TouchOscServer.ck");

// samples, package sample
Machine.add("lick/sample/Sample.ck");
Machine.add("lick/sample/AdsrSample.ck");
Machine.add("lick/sample/CompositeSample.ck");
Machine.add("lick/sample/RandomSample.ck");
Machine.add("lick/sample/PitchSensitiveSample.ck");
Machine.add("lick/sample/VelocitySensitiveSample.ck");
Machine.add("lick/sample/HandedSample.ck");
Machine.add("lick/sample/Samples.ck");

// procedures, package loop
Machine.add("lick/loop/Append.ck");
Machine.add("lick/loop/Prepend.ck");
Machine.add("lick/loop/Repeat.ck");
Machine.add("lick/loop/Sleep.ck");
Machine.add("lick/loop/Loop.ck");
Machine.add("lick/loop/Loops.ck");
Machine.add("lick/loop/LoopBuilder.ck");

// sample-based drum machines, package drum
Machine.add("lick/drum/AkaiMpc60.ck");
Machine.add("lick/drum/EmuDrumulator.ck");
Machine.add("lick/drum/OberheimDmx.ck");
Machine.add("lick/drum/RolandCr78.ck");
Machine.add("lick/drum/RolandTr66.ck");
Machine.add("lick/drum/RolandTr606.ck");
Machine.add("lick/drum/RolandTr808.ck");
Machine.add("lick/drum/RolandTr909.ck");
Machine.add("lick/drum/BigMono.ck");
Machine.add("lick/drum/KorgMs20.ck");

// noise stuff, package noise
Machine.add("lick/noise/Pk3.ck");
Machine.add("lick/noise/Pke.ck");

// dist stuff, package dist
Machine.add("lick/dist/GainShaper.ck");
Machine.add("lick/dist/WaveShaper.ck");
Machine.add("lick/dist/BucketBrigade.ck");
Machine.add("lick/dist/Clip.ck");
Machine.add("lick/dist/Dist.ck");
Machine.add("lick/dist/AtanDist.ck");
Machine.add("lick/dist/TanhDist.ck");
Machine.add("lick/dist/RibbonDist.ck");
Machine.add("lick/dist/FrostburnDist.ck");
Machine.add("lick/dist/KijjazDist.ck");
Machine.add("lick/dist/KijjazDist2.ck");
Machine.add("lick/dist/KijjazDist3.ck");
Machine.add("lick/dist/KijjazDist4.ck");

// cv stuff, package module
Machine.add("lick/module/Module.ck");
Machine.add("lick/module/Module2.ck");
Machine.add("lick/module/Module3.ck");
Machine.add("lick/module/Module4.ck");
Machine.add("lick/module/Module5.ck");
Machine.add("lick/module/Module6.ck");
Machine.add("lick/module/Module7.ck");
Machine.add("lick/module/Module8.ck");

// lfo stuff, package lfo
Machine.add("lick/lfo/SampleHold.ck");
Machine.add("lick/lfo/SlewStep.ck");
Machine.add("lick/lfo/SmoothSampleHold.ck");
Machine.add("lick/lfo/Lfo.ck");

// effects, package effect
Machine.add("lick/effect/Effect.ck");
Machine.add("lick/effect/AnalogDelay.ck");
Machine.add("lick/effect/Cooper.ck");
Machine.add("lick/effect/CrossOver2.ck");
Machine.add("lick/effect/CrossOver3.ck");
Machine.add("lick/effect/Crush.ck");
Machine.add("lick/effect/CryBaby.ck");
Machine.add("lick/effect/DigitalDelay.ck");
Machine.add("lick/effect/Drop.ck");
Machine.add("lick/effect/DualRect.ck");
Machine.add("lick/effect/Feedback.ck");
Machine.add("lick/effect/Flange.ck");
Machine.add("lick/effect/Flutter.ck");
Machine.add("lick/effect/Freeze.ck");
Machine.add("lick/effect/Harmonizer.ck");
Machine.add("lick/effect/Harmonizers.ck");
Machine.add("lick/effect/Mesmerizer.ck");
Machine.add("lick/effect/Raise.ck");
Machine.add("lick/effect/Solstice.ck");
Machine.add("lick/effect/TimeModulator.ck");
Machine.add("lick/effect/Thicken.ck");
Machine.add("lick/effect/Tremolo.ck");

// delay stuff, package delay
Machine.add("lick/delay/SinTrem.ck");
Machine.add("lick/delay/SqrTrem.ck");
Machine.add("lick/delay/TriTrem.ck");
Machine.add("lick/delay/Trem.ck");
Machine.add("lick/delay/MonoDelay.ck");
Machine.add("lick/delay/StereoDelay.ck");
Machine.add("lick/delay/FeedbackMachine.ck");
Machine.add("lick/delay/FeedbackMachines.ck");
Machine.add("lick/delay/StereoFeedbackMachine.ck");
Machine.add("lick/delay/StereoFeedbackMachines.ck");
Machine.add("lick/delay/Smear.ck");
Machine.add("lick/delay/ScaleSmear.ck");
Machine.add("lick/delay/Swirl.ck");

// synth/osc, package synth
Machine.add("lick/synth/CircleRamp.ck");
Machine.add("lick/synth/Folder.ck");
Machine.add("lick/synth/Folder2.ck");
Machine.add("lick/synth/SawRamp.ck");
Machine.add("lick/synth/SubGen.ck");
Machine.add("lick/synth/SeptSubGen.ck");
Machine.add("lick/synth/VoiceOfSaturn.ck");

// depends on jwmatthys' chugins, package jwmatthys
Machine.add("lick/jwmatthys/Disaster.ck");
Machine.add("lick/jwmatthys/Expo.ck");
Machine.add("lick/jwmatthys/PitchFollower.ck");
Machine.add("lick/jwmatthys/SigmuFollower.ck");
Machine.add("lick/jwmatthys/SigmuGainFollower.ck");
Machine.add("lick/jwmatthys/SigmuPitchFollower.ck");
Machine.add("lick/jwmatthys/Spekt.ck");

// depends on jwmatthys' LADSPA chugin, package ladspa
Machine.add("lick/ladspa/Ladspa.ck");

// C*APS plugins, package ladspa.caps
Machine.add("lick/ladspa/caps/Caps.ck");
Machine.add("lick/ladspa/caps/Amp.ck");
Machine.add("lick/ladspa/caps/Cabinet.ck");
Machine.add("lick/ladspa/caps/Eq.ck");
Machine.add("lick/ladspa/caps/NoiseGate.ck");
Machine.add("lick/ladspa/caps/ParametricEq.ck");
Machine.add("lick/ladspa/caps/Plate.ck");
Machine.add("lick/ladspa/caps/Saturate.ck");
Machine.add("lick/ladspa/caps/Scape.ck");
Machine.add("lick/ladspa/caps/StereoEq.ck");
Machine.add("lick/ladspa/caps/StereoPlate.ck");
Machine.add("lick/ladspa/caps/ToneStack.ck");

// depends on C*APS plugins, package ladspa.caps
Machine.add("lick/ladspa/caps/Princeton.ck");
Machine.add("lick/ladspa/caps/Ring.ck");

// CMT plugins, package ladspa.cmt
Machine.add("lick/ladspa/cmt/Cmt.ck");
Machine.add("lick/ladspa/cmt/Lofi.ck");

// TAP-plugins, package ladspa.tap
Machine.add("lick/ladspa/tap/Tap.ck");
Machine.add("lick/ladspa/tap/TubeWarmth.ck");

// SWH plugins, package ladspa.swh
Machine.add("lick/ladspa/swh/Swh.ck");
Machine.add("lick/ladspa/swh/FreqShift.ck");
Machine.add("lick/ladspa/swh/PitchScale.ck");
Machine.add("lick/ladspa/swh/TapeDelay.ck");

// RubberBand plugins, package ladspa.rubberband
Machine.add("lick/ladspa/rubberband/RubberBand.ck");

<<<"LiCK imported.">>>;
