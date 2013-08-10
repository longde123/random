package sakari.random.distributions;
import sakari.random.generators.Standard;
import sakari.random.generators.Generator;
import sakari.random.generators.Function;

class Distribution {
    var g: Generator;

    public function new() {
        g = new Standard();
    }

    static public function sum(a: Distribution, b: Distribution): Distribution {
        return new Distribution()
            .generator(new Function(function() {
                        return a.generate() + b.generate();
                    }));
    }

    static public function const(f: Float) {
        return new Distribution().generator(new Function(function() {
                    return f;
                }));
    }

    static public function multiply(a: Distribution, b: Distribution): Distribution {
        return new Distribution()
            .generator(new Function(function() {
                        return a.generate() * b.generate();
                    }));
    }

    public function generator(gen: Generator): Distribution {
        g = gen;
        return this;
    }

    public function generate(): Float {
        return g.generate();
    }
}