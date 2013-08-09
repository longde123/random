package rand.distributions;
import rand.generators.Standard;

class Distribution {
    var generator: Generator;

    public function new() {
        generator = new Standard();
    }

    public function generator(gen: Generator): Distribution {
        generator = gen;
        return this;
    }

    public function generate(): Float {
        return generator.generate();
    }
}