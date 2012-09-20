
Trem trem;
1.0 => float depth;
1.0 => float rate;

BeeThree bt;
220.0 => bt.freq;
bt.noteOff(1.0);

bt => trem => dac;

500::ms => now;

<<<trem.sinMix, trem.sqrMix, trem.triMix>>>;
for (0 => int i; i < 4; i++)
{
    rate => trem.rate;
    for (0 => int j; j < 10; j++)
    {
        8.0 * (j+1)/10.0 => depth;
        depth => trem.depth;

        <<<"trem rate", rate, "depth", depth>>>;
        bt.noteOn(1.0);
        800::ms => now;
        bt.noteOff(1.0);
        200::ms => now;
    }
    2.0 +=> rate;
}

1.0 => rate;
1.0 => trem.sinMix;
0.0 => trem.sqrMix;
0.0 => trem.triMix;
<<<trem.sinMix, trem.sqrMix, trem.triMix>>>;
for (0 => int i; i < 4; i++)
{
    rate => trem.rate;
    for (0 => int j; j < 10; j++)
    {
        8.0 * (j+1)/10.0 => depth;
        depth => trem.depth;

        <<<"trem rate", rate, "depth", depth>>>;
        bt.noteOn(1.0);
        800::ms => now;
        bt.noteOff(1.0);
        200::ms => now;
    }
    2.0 +=> rate;
}

1.0 => rate;
0.0 => trem.sinMix;
1.0 => trem.sqrMix;
0.0 => trem.triMix;
<<<trem.sinMix, trem.sqrMix, trem.triMix>>>;
for (0 => int i; i < 4; i++)
{
    rate => trem.rate;
    for (0 => int j; j < 10; j++)
    {
        8.0 * (j+1)/10.0 => depth;
        depth => trem.depth;

        <<<"trem rate", rate, "depth", depth>>>;
        bt.noteOn(1.0);
        800::ms => now;
        bt.noteOff(1.0);
        200::ms => now;
    }
    2.0 +=> rate;
}

1.0 => rate;
0.0 => trem.sinMix;
0.0 => trem.sqrMix;
1.0 => trem.triMix;
<<<trem.sinMix, trem.sqrMix, trem.triMix>>>;
for (0 => int i; i < 4; i++)
{
    rate => trem.rate;
    for (0 => int j; j < 10; j++)
    {
        8.0 * (j+1)/10.0 => depth;
        depth => trem.depth;

        <<<"trem rate", rate, "depth", depth>>>;
        bt.noteOn(1.0);
        800::ms => now;
        bt.noteOff(1.0);
        200::ms => now;
    }
    2.0 +=> rate;
}

<<<"done">>>;
