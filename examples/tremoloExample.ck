
Tremolo tremolo;
1.0 => float depth;
1.0 => float rate;

BeeThree bt;
220.0 => bt.freq;
bt.noteOff(1.0);

bt => tremolo.input;
tremolo.output => dac;

500::ms => now;

<<<tremolo.sinMix, tremolo.sqrMix, tremolo.triMix>>>;
for (0 => int i; i < 4; i++)
{
    rate => tremolo.rate;
    for (0 => int j; j < 10; j++)
    {
        8.0 * (j+1)/10.0 => depth;
        depth => tremolo.depth;

        <<<"tremolo rate", rate, "depth", depth>>>;
        bt.noteOn(1.0);
        800::ms => now;
        bt.noteOff(1.0);
        200::ms => now;
    }
    2.0 +=> rate;
}

1.0 => rate;
1.0 => tremolo.sinMix;
0.0 => tremolo.sqrMix;
0.0 => tremolo.triMix;
<<<tremolo.sinMix, tremolo.sqrMix, tremolo.triMix>>>;
for (0 => int i; i < 4; i++)
{
    rate => tremolo.rate;
    for (0 => int j; j < 10; j++)
    {
        8.0 * (j+1)/10.0 => depth;
        depth => tremolo.depth;

        <<<"tremolo rate", rate, "depth", depth>>>;
        bt.noteOn(1.0);
        800::ms => now;
        bt.noteOff(1.0);
        200::ms => now;
    }
    2.0 +=> rate;
}

1.0 => rate;
0.0 => tremolo.sinMix;
1.0 => tremolo.sqrMix;
0.0 => tremolo.triMix;
<<<tremolo.sinMix, tremolo.sqrMix, tremolo.triMix>>>;
for (0 => int i; i < 4; i++)
{
    rate => tremolo.rate;
    for (0 => int j; j < 10; j++)
    {
        8.0 * (j+1)/10.0 => depth;
        depth => tremolo.depth;

        <<<"tremolo rate", rate, "depth", depth>>>;
        bt.noteOn(1.0);
        800::ms => now;
        bt.noteOff(1.0);
        200::ms => now;
    }
    2.0 +=> rate;
}

1.0 => rate;
0.0 => tremolo.sinMix;
0.0 => tremolo.sqrMix;
1.0 => tremolo.triMix;
<<<tremolo.sinMix, tremolo.sqrMix, tremolo.triMix>>>;
for (0 => int i; i < 4; i++)
{
    rate => tremolo.rate;
    for (0 => int j; j < 10; j++)
    {
        8.0 * (j+1)/10.0 => depth;
        depth => tremolo.depth;

        <<<"tremolo rate", rate, "depth", depth>>>;
        bt.noteOn(1.0);
        800::ms => now;
        bt.noteOff(1.0);
        200::ms => now;
    }
    2.0 +=> rate;
}

<<<"done">>>;
