
import massive.munit.Assert;
import sakari.random.distributions.Discrete;

class DiscreteTest {
    static var TRIES = 1000000;
    static var ERROR = TRIES / 100;
    function within(target: Float, hits: Float) {
        if(!(target - ERROR <= hits && hits <= target + ERROR)) {
            trace('error $hits outside target $target +- $ERROR (might be ok or then not)');
            Assert.isTrue(false);
        }
    }

    @Test
    public function throws_if_no_distribution_is_given() {
        var n = new Discrete();
        var err = null;
        try {
            n.generate();
        } catch(e: String) {
            err = e;
        }
        Assert.isTrue(err != null);
    }

    @Test
    public function bin_probabilities_can_be_frequencies() {
        var ones = 0, twos = 0;
        var n = new Discrete()
            .distribution([{v: 1, p: 2}, {v: 2, p: 3}]);
        for(i in 0 ... TRIES) {
            var v = n.generate();
            if(v == 1) ones++;
            else if(v == 2) twos++;
            else throw 'illegal value $v';
        }
        within(TRIES * (2 / 5), ones);
        within(TRIES * (3 / 5), twos);
    }

    @Test
    public function values_should_be_distributed_to_the_specified_bins() {
        var ones = 0, twos = 0;
        var n = new Discrete()
            .distribution([{v: 1, p: .3}, {v: 2, p: .7}]);
            
        for(i in 0 ... TRIES) {
            var v = n.generate();
            if(v == 1) ones++;
            else if (v == 2) twos++;
            else throw 'illegal value $v';
        }
        within(TRIES * .3, ones);
        within(TRIES * .7, twos);
    }
}