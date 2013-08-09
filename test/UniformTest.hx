
import massive.munit.Assert;
import sakari.random.distributions.Uniform;

class UniformTest {
    static var TRIES = 1000000;
    static var ERROR = TRIES / 100;
    function within(target: Float, hits: Float) {
        if(!(target - ERROR <= hits && hits <= target + ERROR)) {
            trace('error $hits outside target $target +- $ERROR (might be ok or then not)');
            Assert.isTrue(false);
        }
    }

    @Test
    public function produces_values_proportionally() {
        var hits = 0;
        var n = new Uniform()
            .range(0, 10);
        for(i in 0 ... TRIES) {
            var v = n.generate();
            if(v < 3) hits++;
        }
        within(TRIES * .3, hits);
    }
    
    @Test
    public function produces_values_in_the_range() {
        var n = new Uniform()
            .range(0, 10);
            
        for(i in 0 ... TRIES) {
            var v = n.generate();
            Assert.isTrue(0 <= v && v < 10);
        }
    }

    @Test
    public function throws_if_no_range_is_given() {
        var n = new Uniform();
        var err = null;
        try {
            n.generate();
        } catch(e: String) {
            err = e;
        }
        Assert.isTrue(err != null);
    }
}