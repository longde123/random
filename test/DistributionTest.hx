
import massive.munit.Assert;
import sakari.random.distributions.Uniform;
import sakari.random.distributions.Distribution;

class DistributionTest {
    static var TRIES = 1000000;
    static var ERROR = TRIES / 100;
    function within(target: Float, hits: Float) {
        if(!(target - ERROR <= hits && hits <= target + ERROR)) {
            trace('error $hits outside target $target +- $ERROR (might be ok or then not)');
            Assert.isTrue(false);
        }
    }

    @Test
    public function float_can_be_converted_to_a_constant_distribution() {
        var hits = 0;
        var k = Distribution.const(2.0);
        for(i in 0 ... TRIES) {
            var v = k.generate();
            Assert.isTrue(v == 2);
        }
    }

    @Test
    public function distributions_can_be_added() {
        var hits = 0;
        var k = Distribution.sum(new Uniform().range(0, 10)
                                 , new Uniform().range(1, 2));
        for(i in 0 ... TRIES) {
            var v = k.generate();
            Assert.isTrue(1 <= v && v < 12);
        }
    }

    @Test
    public function distributions_can_be_multiplied() {
        var hits = 0;
        var k = Distribution.multiply(new Uniform().range(0, 10)
                                 , new Uniform().range(1, 2));
        for(i in 0 ... TRIES) {
            var v = k.generate();
            Assert.isTrue(0 <= v && v < 20);
        }
    }
}