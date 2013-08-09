
import massive.munit.Assert;
import sakari.random.distributions.Normal;

class NormalTest {
    static var TRIES = 1000000;
    static var ERROR = TRIES / 100;
    function within(target: Float, hits: Float) {
        if(!(target - ERROR <= hits && hits <= target + ERROR)) {
            trace('error $hits outside target $target +- $ERROR (might be ok or then not)');
            Assert.isTrue(false);
        }
    }

    @Test
    public function values_should_be_distributed_to_the_specified_area() {
        var hits = 0;
        var n = new Normal()
            .area(.9, -1, 1);
            
        for(i in 0 ... TRIES) {
            var v = n.generate();
            if(v >= -1 && v <= 1) hits++;
        }
        within(TRIES * .9, hits);
    }

    @Test
    public function values_should_be_equally_on_both_sides_of_mean() {
        var lo = 0;
        var hi = 0;
        
        var n = new Normal()
            .mean(10);
        for(i in 0 ... TRIES) {
            var v = n.generate();
            if(v < 10) lo++;
            else hi++;
        }
        within(TRIES * .5, lo);
        within(TRIES * .5, hi);
    }

}