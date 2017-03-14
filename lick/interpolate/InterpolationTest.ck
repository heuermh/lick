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

// unit test for subclasses of Interpolation
class InterpolationTest extends Assert
{
    {
        true => exitOnFailure;
        testLinear();
        testBack();
        testBounce();
        testCircular();
        testElastic();
        testExponential();
        testQuadratic();
        testQuartic();
        testQuintic();
        testSinusoidal();
        testRandomFloor();
        testRandomThreshold();

        <<<"InterpolationTest ok">>>;
    }

    public void testLinear()
    {
        Linear linear;
        assertInRange(linear, -1.0, 2.0);
    }

    public void testBack()
    {
        BackIn backIn;
        BackOut backOut;
        BackInOut backInOut;
        assertInRange(backIn, -1.0, 2.0);
        assertInRange(backOut, -1.0, 2.0);
        assertInRange(backInOut, -1.0, 2.0);
    }

    public void testBounce()
    {
        BounceIn bounceIn;
        BounceOut bounceOut;
        BounceInOut bounceInOut;
        assertInRange(bounceIn, -1.0, 2.0);
        assertInRange(bounceOut, -1.0, 2.0);
        assertInRange(bounceInOut, -1.0, 2.0);
    }

    public void testCircular()
    {
        CircularIn circularIn;
        CircularOut circularOut;
        CircularInOut circularInOut;
        assertInRange(circularIn, -1.0, 2.0);
        assertInRange(circularOut, -1.0, 2.0);
        assertInRange(circularInOut, -1.0, 2.0);
    }

    public void testElastic()
    {
        ElasticIn elasticIn;
        ElasticOut elasticOut;
        ElasticInOut elasticInOut;
        assertInRange(elasticIn, -1.0, 2.0);
        assertInRange(elasticOut, -1.0, 2.0);
        assertInRange(elasticInOut, -1.0, 2.0);
    }

    public void testExponential()
    {
        ExponentialIn exponentialIn;
        ExponentialOut exponentialOut;
        ExponentialInOut exponentialInOut;
        assertInRange(exponentialIn, -1.0, 2.0);
        assertInRange(exponentialOut, -1.0, 2.0);
        assertInRange(exponentialInOut, -1.0, 2.0);
    }

    public void testQuadratic()
    {
        QuadraticIn quadraticIn;
        QuadraticOut quadraticOut;
        QuadraticInOut quadraticInOut;
        assertInRange(quadraticIn, -1.0, 2.0);
        assertInRange(quadraticOut, -1.0, 2.0);
        assertInRange(quadraticInOut, -1.0, 2.0);
    }

    public void testQuartic()
    {
        QuarticIn quarticIn;
        QuarticOut quarticOut;
        QuarticInOut quarticInOut;
        assertInRange(quarticIn, -1.0, 2.0);
        assertInRange(quarticOut, -1.0, 2.0);
        assertInRange(quarticInOut, -1.0, 2.0);
    }

    public void testQuintic()
    {
        QuinticIn quinticIn;
        QuinticOut quinticOut;
        QuinticInOut quinticInOut;
        assertInRange(quinticIn, -1.0, 2.0);
        assertInRange(quinticOut, -1.0, 2.0);
        assertInRange(quinticInOut, -1.0, 2.0);
    }

    public void testSinusoidal()
    {
        SinusoidalIn sinusoidalIn;
        SinusoidalOut sinusoidalOut;
        SinusoidalInOut sinusoidalInOut;
        assertInRange(sinusoidalIn, -1.0, 2.0);
        assertInRange(sinusoidalOut, -1.0, 2.0);
        assertInRange(sinusoidalInOut, -1.0, 2.0);
    }

    public void testRandomFloor()
    {
        RandomFloor randomFloor;
        assertInRange(randomFloor, -1.0, 2.0);
    }

    public void testRandomThreshold()
    {
        RandomThreshold randomThreshold;
        assertInRange(randomThreshold, -1.0, 2.0);
    }

    public void assertInRange(Interpolation interpolation, float min, float max)
    {
        for (0.0 => float f; f < 1.01; f + 0.01 => f)
        {
            assertTrue("interpolated value greater than or equal to -1.0, was " + interpolation.evaluate(f) + " for interpolation " + interpolation + " and value " + f, interpolation.evaluate(f) >= -1.0);
            assertTrue("interpolated value less than or equal to 2.0, was " + interpolation.evaluate(f) + " for interpolation " + interpolation + " and value " + f, interpolation.evaluate(f) <= 2.0);
        }
    }
}

InterpolationTest interpolationTest;
1::second => now;
