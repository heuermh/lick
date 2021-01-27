/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2021 held jointly by the individual authors.

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

<<<"LiCK  Library for ChucK.">>>;
<<<"Copyright (c) 2007-2021 held jointly by the individual authors.">>>;
<<<"Licensed GNU General Public License (GPL), version 3 or later.">>>;

// path to LiCK import.ck ...
me.dir() => string path;

// functional interfaces or functors, package fn
Machine.add(path + "lick/fn/BinaryFunction.ck");
Machine.add(path + "lick/fn/BinaryPredicate.ck");
Machine.add(path + "lick/fn/BinaryProcedure.ck");
Machine.add(path + "lick/fn/Consumer.ck");
Machine.add(path + "lick/fn/DurConsumer.ck");
Machine.add(path + "lick/fn/DurFunction.ck");
Machine.add(path + "lick/fn/DurPredicate.ck");
Machine.add(path + "lick/fn/DurProcedure.ck");
Machine.add(path + "lick/fn/DurSupplier.ck");
Machine.add(path + "lick/fn/FloatFloatFloatFloatFunction.ck");
Machine.add(path + "lick/fn/FloatFloatFloatFloatPredicate.ck");
Machine.add(path + "lick/fn/FloatFloatFloatFloatProcedure.ck");
Machine.add(path + "lick/fn/FloatFloatFloatFunction.ck");
Machine.add(path + "lick/fn/FloatFloatFloatPredicate.ck");
Machine.add(path + "lick/fn/FloatFloatFloatProcedure.ck");
Machine.add(path + "lick/fn/FloatFloatFunction.ck");
Machine.add(path + "lick/fn/FloatFloatPredicate.ck");
Machine.add(path + "lick/fn/FloatFloatProcedure.ck");
Machine.add(path + "lick/fn/FloatConsumer.ck");
Machine.add(path + "lick/fn/FloatFunction.ck");
Machine.add(path + "lick/fn/FloatPredicate.ck");
Machine.add(path + "lick/fn/FloatProcedure.ck");
Machine.add(path + "lick/fn/FloatSupplier.ck");
Machine.add(path + "lick/fn/Function.ck");
Machine.add(path + "lick/fn/IntConsumer.ck");
Machine.add(path + "lick/fn/IntFunction.ck");
Machine.add(path + "lick/fn/IntIntFunction.ck");
Machine.add(path + "lick/fn/IntIntIntFunction.ck");
Machine.add(path + "lick/fn/IntIntIntIntFunction.ck");
Machine.add(path + "lick/fn/IntIntIntIntPredicate.ck");
Machine.add(path + "lick/fn/IntIntIntIntProcedure.ck");
Machine.add(path + "lick/fn/IntIntIntPredicate.ck");
Machine.add(path + "lick/fn/IntIntIntProcedure.ck");
Machine.add(path + "lick/fn/IntIntFloatProcedure.ck");
Machine.add(path + "lick/fn/IntIntPredicate.ck");
Machine.add(path + "lick/fn/IntIntProcedure.ck");
Machine.add(path + "lick/fn/IntFloatProcedure.ck");
Machine.add(path + "lick/fn/IntFloatFloatProcedure.ck");
Machine.add(path + "lick/fn/IntPredicate.ck");
Machine.add(path + "lick/fn/IntProcedure.ck");
Machine.add(path + "lick/fn/IntSupplier.ck");
Machine.add(path + "lick/fn/Predicate.ck");
Machine.add(path + "lick/fn/Procedure.ck");
Machine.add(path + "lick/fn/QuaternaryFunction.ck");
Machine.add(path + "lick/fn/QuaternaryPredicate.ck");
Machine.add(path + "lick/fn/Supplier.ck");
Machine.add(path + "lick/fn/TernaryFunction.ck");
Machine.add(path + "lick/fn/TernaryPredicate.ck");
Machine.add(path + "lick/fn/TernaryProcedure.ck");
Machine.add(path + "lick/fn/UnaryFunction.ck");
Machine.add(path + "lick/fn/UnaryPredicate.ck");
Machine.add(path + "lick/fn/UnaryProcedure.ck");

// functions
Machine.add(path + "lick/fn/Acos.ck");
Machine.add(path + "lick/fn/Asin.ck");
Machine.add(path + "lick/fn/Atan.ck");
Machine.add(path + "lick/fn/Ceil.ck");
Machine.add(path + "lick/fn/Cos.ck");
Machine.add(path + "lick/fn/Cosh.ck");
Machine.add(path + "lick/fn/Exp.ck");
Machine.add(path + "lick/fn/Floor.ck");
Machine.add(path + "lick/fn/Identity.ck");
Machine.add(path + "lick/fn/Inverse.ck");
Machine.add(path + "lick/fn/Log.ck");
Machine.add(path + "lick/fn/Log10.ck");
Machine.add(path + "lick/fn/Log2.ck");
Machine.add(path + "lick/fn/Negate.ck");
Machine.add(path + "lick/fn/Round.ck");
Machine.add(path + "lick/fn/Sin.ck");
Machine.add(path + "lick/fn/Sinh.ck");
Machine.add(path + "lick/fn/Sqrt.ck");
Machine.add(path + "lick/fn/Tan.ck");
Machine.add(path + "lick/fn/Tanh.ck");
Machine.add(path + "lick/fn/Trunc.ck");
Machine.add(path + "lick/fn/Uniform.ck");

// composite functions
Machine.add(path + "lick/fn/CompositeDurFunction.ck");
Machine.add(path + "lick/fn/CompositeFloatFunction.ck");
Machine.add(path + "lick/fn/CompositeFunction.ck");
Machine.add(path + "lick/fn/CompositeIntFunction.ck");

// conditional functions and procedures
Machine.add(path + "lick/fn/ConditionalDurFunction.ck");
Machine.add(path + "lick/fn/ConditionalDurProcedure.ck");
Machine.add(path + "lick/fn/ConditionalFloatFunction.ck");
Machine.add(path + "lick/fn/ConditionalFloatProcedure.ck");
Machine.add(path + "lick/fn/ConditionalFunction.ck");
Machine.add(path + "lick/fn/ConditionalIntFunction.ck");
Machine.add(path + "lick/fn/ConditionalIntProcedure.ck");
Machine.add(path + "lick/fn/ConditionalProcedure.ck");

// convenience classes
Machine.add(path + "lick/fn/DurFunctions.ck");
Machine.add(path + "lick/fn/DurProcedures.ck");
Machine.add(path + "lick/fn/Functions.ck");
Machine.add(path + "lick/fn/FloatFunctions.ck");
Machine.add(path + "lick/fn/FloatProcedures.ck");
Machine.add(path + "lick/fn/IntFunctions.ck");
Machine.add(path + "lick/fn/IntProcedures.ck");
Machine.add(path + "lick/fn/Procedures.ck");

// interpolation, package interp
Machine.add(path + "lick/interpolate/Interpolation.ck");
Machine.add(path + "lick/interpolate/BackIn.ck");
Machine.add(path + "lick/interpolate/BackOut.ck");
Machine.add(path + "lick/interpolate/BackInOut.ck");
Machine.add(path + "lick/interpolate/AbstractBounce.ck");
Machine.add(path + "lick/interpolate/BounceIn.ck");
Machine.add(path + "lick/interpolate/BounceOut.ck");
Machine.add(path + "lick/interpolate/BounceInOut.ck");
Machine.add(path + "lick/interpolate/CircularIn.ck");
Machine.add(path + "lick/interpolate/CircularInOut.ck");
Machine.add(path + "lick/interpolate/CircularOut.ck");
Machine.add(path + "lick/interpolate/CubicIn.ck");
Machine.add(path + "lick/interpolate/CubicInOut.ck");
Machine.add(path + "lick/interpolate/CubicOut.ck");
Machine.add(path + "lick/interpolate/ElasticIn.ck");
Machine.add(path + "lick/interpolate/ElasticOut.ck");
Machine.add(path + "lick/interpolate/ElasticInOut.ck");
Machine.add(path + "lick/interpolate/ExponentialIn.ck");
Machine.add(path + "lick/interpolate/ExponentialInOut.ck");
Machine.add(path + "lick/interpolate/ExponentialOut.ck");
Machine.add(path + "lick/interpolate/Linear.ck");
Machine.add(path + "lick/interpolate/QuadraticIn.ck");
Machine.add(path + "lick/interpolate/QuadraticInOut.ck");
Machine.add(path + "lick/interpolate/QuadraticOut.ck");
Machine.add(path + "lick/interpolate/QuarticIn.ck");
Machine.add(path + "lick/interpolate/QuarticInOut.ck");
Machine.add(path + "lick/interpolate/QuarticOut.ck");
Machine.add(path + "lick/interpolate/QuinticIn.ck");
Machine.add(path + "lick/interpolate/QuinticInOut.ck");
Machine.add(path + "lick/interpolate/QuinticOut.ck");
Machine.add(path + "lick/interpolate/Random.ck");
Machine.add(path + "lick/interpolate/GaussianRandom.ck");
Machine.add(path + "lick/interpolate/RandomFloor.ck");
Machine.add(path + "lick/interpolate/RandomThreshold.ck");
Machine.add(path + "lick/interpolate/SinusoidalIn.ck");
Machine.add(path + "lick/interpolate/SinusoidalInOut.ck");
Machine.add(path + "lick/interpolate/SinusoidalOut.ck");
Machine.add(path + "lick/interpolate/Interpolate.ck");
Machine.add(path + "lick/interpolate/Constrain.ck");
Machine.add(path + "lick/interpolate/Interpolations.ck");

// list, package collect
Machine.add(path + "lick/collect/Comparator.ck");
Machine.add(path + "lick/collect/Iterator.ck");
Machine.add(path + "lick/collect/List.ck");
Machine.add(path + "lick/collect/ListIterator.ck");
Machine.add(path + "lick/collect/ArrayList.ck");

// int list
Machine.add(path + "lick/collect/IntComparator.ck");
Machine.add(path + "lick/collect/IntIterator.ck");
Machine.add(path + "lick/collect/IntList.ck");
Machine.add(path + "lick/collect/IntListIterator.ck");
Machine.add(path + "lick/collect/IntArrayList.ck");

// float list
Machine.add(path + "lick/collect/FloatComparator.ck");
Machine.add(path + "lick/collect/FloatIterator.ck");
Machine.add(path + "lick/collect/FloatList.ck");
Machine.add(path + "lick/collect/FloatListIterator.ck");
Machine.add(path + "lick/collect/FloatArrayList.ck");

// set
Machine.add(path + "lick/collect/Set.ck");
Machine.add(path + "lick/collect/ArraySet.ck");

// graphs
Machine.add(path + "lick/collect/Node.ck");
Machine.add(path + "lick/collect/Edge.ck");
Machine.add(path + "lick/collect/Graph.ck");
Machine.add(path + "lick/collect/Graphs.ck");

// ADSRs
Machine.add(path + "lick/adsr/AbstractAdsr.ck");
Machine.add(path + "lick/adsr/Adsr.ck");
Machine.add(path + "lick/adsr/CompositeAdsr.ck");
Machine.add(path + "lick/adsr/RandomAdsr.ck");
Machine.add(path + "lick/adsr/RoundRobinAdsr.ck");

// analysis
Machine.add(path + "lick/analysis/EnvelopeFollower.ck");
Machine.add(path + "lick/analysis/EnvelopeTrigger.ck");

// intervals, chords, scales, package interval
Machine.add(path + "lick/interval/Interval.ck");
Machine.add(path + "lick/interval/Intervals.ck");
Machine.add(path + "lick/interval/Chord.ck");
Machine.add(path + "lick/interval/Chords.ck");
Machine.add(path + "lick/interval/Scale.ck");
Machine.add(path + "lick/interval/Scales.ck");
Machine.add(path + "lick/interval/Transpose.ck");

// duration providers, package duration
Machine.add(path + "lick/duration/DurProvider.ck");
Machine.add(path + "lick/duration/Humanize.ck");
Machine.add(path + "lick/duration/HumanizedDurProvider.ck");
Machine.add(path + "lick/duration/TimeSignature.ck");
Machine.add(path + "lick/duration/IntervalDurProvider.ck");

// arp, pattern, package arp
Machine.add(path + "lick/arp/Pattern.ck");
Machine.add(path + "lick/arp/PatternedDurProcedure.ck");
Machine.add(path + "lick/arp/PatternedFloatProcedure.ck");
Machine.add(path + "lick/arp/PatternedIntProcedure.ck");
Machine.add(path + "lick/arp/PatternedProcedure.ck");
Machine.add(path + "lick/arp/Patterns.ck");
Machine.add(path + "lick/arp/Sequence.ck");
Machine.add(path + "lick/arp/Sequences.ck");
Machine.add(path + "lick/arp/Warp.ck");
Machine.add(path + "lick/arp/Arpeggiator.ck");
Machine.add(path + "lick/arp/Arpeggiators.ck");
Machine.add(path + "lick/arp/Sequencer.ck");
Machine.add(path + "lick/arp/Sequencers.ck");

// midi tunings, package tuning
Machine.add(path + "lick/tuning/MidiNote.ck");
Machine.add(path + "lick/tuning/Tuning.ck");
Machine.add(path + "lick/tuning/Tunings.ck");
Machine.add(path + "lick/tuning/SYTunings.ck");

// unit test, package test
Machine.add(path + "lick/test/Assert.ck");

// simulators, package sim
Machine.add(path + "lick/sim/Animoog.ck");
Machine.add(path + "lick/sim/EchoPad.ck");
Machine.add(path + "lick/sim/Filtatron.ck");
Machine.add(path + "lick/sim/GarageBand.ck");
Machine.add(path + "lick/sim/Loopy.ck");
Machine.add(path + "lick/sim/MeeBlip.ck");
Machine.add(path + "lick/sim/SooperLooper.ck");
Machine.add(path + "lick/sim/TwoPots.ck");

// midi, package midi
Machine.add(path + "lick/midi/ControlChangeMidiMsg.ck");
Machine.add(path + "lick/midi/NoteOffMidiMsg.ck");
Machine.add(path + "lick/midi/NoteOnMidiMsg.ck");
Machine.add(path + "lick/midi/AnimoogMidi.ck");
Machine.add(path + "lick/midi/EchoPadMidi.ck");
Machine.add(path + "lick/midi/GarageBandMidi.ck");
Machine.add(path + "lick/midi/FiltatronMidi.ck");
Machine.add(path + "lick/midi/LoopyMidi.ck");
Machine.add(path + "lick/midi/MeeBlipMidi.ck");
Machine.add(path + "lick/midi/EuclidMidi.ck");
Machine.add(path + "lick/midi/StompMidi.ck");
Machine.add(path + "lick/midi/TwoPotsMidi.ck");
Machine.add(path + "lick/midi/PodHd500Midi.ck");

// devices, package device
Machine.add(path + "lick/device/Controller128.ck");
Machine.add(path + "lick/device/Keyboard.ck");
Machine.add(path + "lick/device/Joystick.ck");
Machine.add(path + "lick/device/LogitechGamepadF310.ck");
Machine.add(path + "lick/device/Monome.ck");
Machine.add(path + "lick/device/Mouse.ck");
Machine.add(path + "lick/device/NanoPad.ck");
Machine.add(path + "lick/device/Nes.ck");
Machine.add(path + "lick/device/MAudioOzone.ck");
Machine.add(path + "lick/device/AlesisQX25.ck");
Machine.add(path + "lick/device/StompKeyboard.ck");
Machine.add(path + "lick/device/RolandA49.ck");
Machine.add(path + "lick/device/PodHd500.ck");

// osc, package osc
Machine.add(path + "lick/osc/ControlOscServer.ck");
Machine.add(path + "lick/osc/EuclidOsc.ck");
Machine.add(path + "lick/osc/IanniXOsc.ck");
Machine.add(path + "lick/osc/LeapMotionOsc.ck");
Machine.add(path + "lick/osc/SooperLooperOsc.ck");
Machine.add(path + "lick/osc/TouchOscServer.ck");

// samples, package sample
Machine.add(path + "lick/sample/Sample.ck");
Machine.add(path + "lick/sample/AdsrSample.ck");
Machine.add(path + "lick/sample/CompositeSample.ck");
Machine.add(path + "lick/sample/RandomSample.ck");
Machine.add(path + "lick/sample/PitchSensitiveSample.ck");
Machine.add(path + "lick/sample/VelocitySensitiveSample.ck");
Machine.add(path + "lick/sample/HandedSample.ck");
Machine.add(path + "lick/sample/Samples.ck");

// procedures, package loop
Machine.add(path + "lick/loop/Append.ck");
Machine.add(path + "lick/loop/DurAppend.ck");
Machine.add(path + "lick/loop/FloatAppend.ck");
Machine.add(path + "lick/loop/IntAppend.ck");
Machine.add(path + "lick/loop/Prepend.ck");
Machine.add(path + "lick/loop/DurPrepend.ck");
Machine.add(path + "lick/loop/FloatPrepend.ck");
Machine.add(path + "lick/loop/IntPrepend.ck");
Machine.add(path + "lick/loop/Repeat.ck");
Machine.add(path + "lick/loop/Sleep.ck");
Machine.add(path + "lick/loop/Loop.ck");
Machine.add(path + "lick/loop/Loops.ck");
Machine.add(path + "lick/loop/LoopBuilder.ck");

// sample-based drum machines, package drum
Machine.add(path + "lick/drum/AkaiMpc60.ck");
Machine.add(path + "lick/drum/BossDr110.ck");
Machine.add(path + "lick/drum/CasioSa10.ck");
Machine.add(path + "lick/drum/ElectroHarmonixDrm15.ck");
Machine.add(path + "lick/drum/EmuDrumulator.ck");
Machine.add(path + "lick/drum/LellUds.ck");
Machine.add(path + "lick/drum/OberheimDmx.ck");
Machine.add(path + "lick/drum/RolandCr78.ck");
Machine.add(path + "lick/drum/RolandTr66.ck");
Machine.add(path + "lick/drum/RolandTr606.ck");
Machine.add(path + "lick/drum/RolandTr808.ck");
Machine.add(path + "lick/drum/RolandTr909.ck");
Machine.add(path + "lick/drum/BigMono.ck");
Machine.add(path + "lick/drum/KorgMs20.ck");

// noise stuff, package noise
Machine.add(path + "lick/noise/Pk3.ck");
Machine.add(path + "lick/noise/Pke.ck");

// dist stuff, package dist
Machine.add(path + "lick/dist/GainShaper.ck");
Machine.add(path + "lick/dist/WaveShaper.ck");
Machine.add(path + "lick/dist/BucketBrigade.ck");
Machine.add(path + "lick/dist/Clip.ck");
Machine.add(path + "lick/dist/Dist.ck");
Machine.add(path + "lick/dist/FullRectifier.ck");
Machine.add(path + "lick/dist/Invert.ck");
Machine.add(path + "lick/dist/Offset.ck");
Machine.add(path + "lick/dist/Phase.ck");
Machine.add(path + "lick/dist/AtanDist.ck");
Machine.add(path + "lick/dist/TanhDist.ck");
Machine.add(path + "lick/dist/RibbonDist.ck");
Machine.add(path + "lick/dist/FrostburnDist.ck");
Machine.add(path + "lick/dist/KijjazDist.ck");
Machine.add(path + "lick/dist/KijjazDist2.ck");
Machine.add(path + "lick/dist/KijjazDist3.ck");
Machine.add(path + "lick/dist/KijjazDist4.ck");

// cv stuff, package module
Machine.add(path + "lick/module/Module.ck");
Machine.add(path + "lick/module/Module2.ck");
Machine.add(path + "lick/module/Module3.ck");
Machine.add(path + "lick/module/Module4.ck");
Machine.add(path + "lick/module/Module5.ck");
Machine.add(path + "lick/module/Module6.ck");
Machine.add(path + "lick/module/Module7.ck");
Machine.add(path + "lick/module/Module8.ck");

// lfo stuff, package lfo
Machine.add(path + "lick/lfo/Hyper.ck");
Machine.add(path + "lick/lfo/SampleHold.ck");
Machine.add(path + "lick/lfo/SlewStep.ck");
Machine.add(path + "lick/lfo/SmoothSampleHold.ck");
Machine.add(path + "lick/lfo/Lfo.ck");
Machine.add(path + "lick/lfo/Quad.ck");

// filters, package filter
Machine.add(path + "lick/filter/SVF.ck");

// effects, package effect
Machine.add(path + "lick/effect/Effect.ck");
Machine.add(path + "lick/effect/LfoEffect.ck");
Machine.add(path + "lick/effect/Feedback.ck");
Machine.add(path + "lick/effect/LfoFeedback.ck");
Machine.add(path + "lick/effect/AdsrTremolo.ck");
Machine.add(path + "lick/effect/AnalogDelay.ck");
Machine.add(path + "lick/effect/APF.ck");
Machine.add(path + "lick/effect/Blueshift.ck");
Machine.add(path + "lick/effect/Buffer.ck");
Machine.add(path + "lick/effect/Cee.ck");
Machine.add(path + "lick/effect/Chew.ck");
Machine.add(path + "lick/effect/Cooper.ck");
Machine.add(path + "lick/effect/CrossOver2.ck");
Machine.add(path + "lick/effect/CrossOver3.ck");
Machine.add(path + "lick/effect/Crush.ck");
Machine.add(path + "lick/effect/CryBaby.ck");
Machine.add(path + "lick/effect/AutoWah.ck");
Machine.add(path + "lick/effect/DigitalDelay.ck");
Machine.add(path + "lick/effect/Drop.ck");
Machine.add(path + "lick/effect/DualRect.ck");
Machine.add(path + "lick/effect/Ecco.ck");
Machine.add(path + "lick/effect/EchoArray.ck");
Machine.add(path + "lick/effect/Electoronic.ck");
Machine.add(path + "lick/effect/EnvelopeTremolo.ck");
Machine.add(path + "lick/effect/FilterDelay.ck");
Machine.add(path + "lick/effect/Flutter.ck");
Machine.add(path + "lick/effect/Foldback.ck");
Machine.add(path + "lick/effect/Freeze.ck");
Machine.add(path + "lick/effect/FullDouble.ck");
Machine.add(path + "lick/effect/Ghost.ck");
Machine.add(path + "lick/effect/Golden.ck");
Machine.add(path + "lick/effect/Hall.ck");
Machine.add(path + "lick/effect/Harmonizer.ck");
Machine.add(path + "lick/effect/Harmonizers.ck");
Machine.add(path + "lick/effect/LoopReverb.ck");
Machine.add(path + "lick/effect/Masa.ck");
Machine.add(path + "lick/effect/Mesmerizer.ck");
Machine.add(path + "lick/effect/ModulatedDelay.ck");
Machine.add(path + "lick/effect/Mixer.ck");
Machine.add(path + "lick/effect/Breeze.ck");
Machine.add(path + "lick/effect/Overcome.ck");
Machine.add(path + "lick/effect/PinkDelay.ck");
Machine.add(path + "lick/effect/Ring.ck");
Machine.add(path + "lick/effect/Redshift.ck");
Machine.add(path + "lick/effect/ReverseBuffer.ck");
Machine.add(path + "lick/effect/Reverse.ck");
Machine.add(path + "lick/effect/Revenge.ck");
Machine.add(path + "lick/effect/Raise.ck");
Machine.add(path + "lick/effect/Select.ck");
Machine.add(path + "lick/effect/ShiftEcco.ck");
Machine.add(path + "lick/effect/Shim.ck");
Machine.add(path + "lick/effect/Smother.ck");
Machine.add(path + "lick/effect/Solstice.ck");
Machine.add(path + "lick/effect/TimeModulator.ck");
Machine.add(path + "lick/effect/Thicken.ck");
Machine.add(path + "lick/effect/Totter.ck");
Machine.add(path + "lick/effect/Tremolo.ck");
Machine.add(path + "lick/effect/Tricoder.ck");
Machine.add(path + "lick/effect/Triphaser.ck");
Machine.add(path + "lick/effect/Triptych.ck");
Machine.add(path + "lick/effect/Vibrato.ck");
Machine.add(path + "lick/effect/Wire.ck");
Machine.add(path + "lick/effect/Wolftone.ck");
Machine.add(path + "lick/effect/Woosh.ck");
Machine.add(path + "lick/effect/Currant.ck");
Machine.add(path + "lick/effect/Glider.ck");
Machine.add(path + "lick/effect/MotelSix.ck");
Machine.add(path + "lick/effect/OilCan.ck");

// delay stuff, package delay
Machine.add(path + "lick/delay/SinTrem.ck");
Machine.add(path + "lick/delay/SqrTrem.ck");
Machine.add(path + "lick/delay/TriTrem.ck");
Machine.add(path + "lick/delay/Trem.ck");
Machine.add(path + "lick/delay/MonoDelay.ck");
Machine.add(path + "lick/delay/StereoDelay.ck");
Machine.add(path + "lick/delay/FeedbackMachine.ck");
Machine.add(path + "lick/delay/FeedbackMachines.ck");
Machine.add(path + "lick/delay/StereoFeedbackMachine.ck");
Machine.add(path + "lick/delay/StereoFeedbackMachines.ck");
Machine.add(path + "lick/delay/Smear.ck");
Machine.add(path + "lick/delay/ScaleSmear.ck");
Machine.add(path + "lick/delay/Swirl.ck");

// synth/osc, package synth
Machine.add(path + "lick/synth/CircleRamp.ck");
Machine.add(path + "lick/synth/DoublePulse.ck");
Machine.add(path + "lick/synth/Fat.ck");
Machine.add(path + "lick/synth/Fold.ck");
Machine.add(path + "lick/synth/Fold2.ck");
Machine.add(path + "lick/synth/Lurverly.ck");
Machine.add(path + "lick/synth/Mdrone.ck");
Machine.add(path + "lick/synth/Poly.ck");
Machine.add(path + "lick/synth/SawRamp.ck");
Machine.add(path + "lick/synth/Sauce.ck");
Machine.add(path + "lick/synth/SubGen.ck");
Machine.add(path + "lick/synth/SeptSubGen.ck");
Machine.add(path + "lick/synth/VoiceOfSaturn.ck");
Machine.add(path + "lick/synth/Wrapper.ck");

// kick/bass drum synthesis, package kick

Machine.add(path + "lick/kick/Boom.ck");
Machine.add(path + "lick/kick/Duff.ck");
Machine.add(path + "lick/kick/Fwak.ck");
Machine.add(path + "lick/kick/Fwak2.ck");
Machine.add(path + "lick/kick/Kick.ck");
Machine.add(path + "lick/kick/Thud.ck");
Machine.add(path + "lick/kick/Thump.ck");
Machine.add(path + "lick/kick/Thwok.ck");

// snare drum synthesis, package snare

Machine.add(path + "lick/snare/Cch.ck");
Machine.add(path + "lick/snare/Czh.ck");
Machine.add(path + "lick/snare/Dnn.ck");
Machine.add(path + "lick/snare/Tss.ck");
Machine.add(path + "lick/snare/Snare.ck");

<<<"Optional dependencies (may fail to compile):">>>;

// depends on jwmatthys' chugins, package jwmatthys
Machine.add(path + "lick/jwmatthys/Disaster.ck");
Machine.add(path + "lick/jwmatthys/Expo.ck");
Machine.add(path + "lick/jwmatthys/PitchFollower.ck");
Machine.add(path + "lick/jwmatthys/SigmuFollower.ck");
Machine.add(path + "lick/jwmatthys/SigmuGainFollower.ck");
Machine.add(path + "lick/jwmatthys/SigmuPitchFollower.ck");
Machine.add(path + "lick/jwmatthys/Spekt.ck");

// depends on jwmatthys' LADSPA chugin, package ladspa
Machine.add(path + "lick/ladspa/Ladspa.ck");

// C*APS plugins, package ladspa.caps
Machine.add(path + "lick/ladspa/caps/Caps.ck");
Machine.add(path + "lick/ladspa/caps/Amp.ck");
Machine.add(path + "lick/ladspa/caps/Cabinet.ck");
Machine.add(path + "lick/ladspa/caps/Eq.ck");
Machine.add(path + "lick/ladspa/caps/NoiseGate.ck");
Machine.add(path + "lick/ladspa/caps/ParametricEq.ck");
Machine.add(path + "lick/ladspa/caps/Plate.ck");
Machine.add(path + "lick/ladspa/caps/Saturate.ck");
Machine.add(path + "lick/ladspa/caps/Scape.ck");
Machine.add(path + "lick/ladspa/caps/StereoEq.ck");
Machine.add(path + "lick/ladspa/caps/StereoPlate.ck");
Machine.add(path + "lick/ladspa/caps/ToneStack.ck");

// depends on C*APS plugins, package ladspa.caps
Machine.add(path + "lick/ladspa/caps/Princeton.ck");
Machine.add(path + "lick/ladspa/caps/Mood.ck");

// CMT plugins, package ladspa.cmt
Machine.add(path + "lick/ladspa/cmt/Cmt.ck");
Machine.add(path + "lick/ladspa/cmt/Lofi.ck");

// TAP-plugins, package ladspa.tap
Machine.add(path + "lick/ladspa/tap/Tap.ck");
Machine.add(path + "lick/ladspa/tap/TubeWarmth.ck");

// SWH plugins, package ladspa.swh
Machine.add(path + "lick/ladspa/swh/Swh.ck");
Machine.add(path + "lick/ladspa/swh/FreqShift.ck");
Machine.add(path + "lick/ladspa/swh/PitchScale.ck");
Machine.add(path + "lick/ladspa/swh/TapeDelay.ck");

// RubberBand plugins, package ladspa.rubberband
Machine.add(path + "lick/ladspa/rubberband/RubberBand.ck");

<<<"LiCK imported at path", path>>>;
