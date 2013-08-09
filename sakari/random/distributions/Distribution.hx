package sakari.random.distributions;
import sakari.random.generators.Standard;
import sakari.random.generators.Generator;

class Distribution {
    var g: Generator;

    public function new() {
        g = new Standard();
    }

    public function generator(gen: Generator): Distribution {
        g = gen;
        return this;
    }

    public function generate(): Float {
        return g.generate();
    }
}