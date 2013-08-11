# Random variables for Haxe for monte carlo simulation

Currently we support these distributions

 * Uniform
 * Discrete
 * Normal (with Box-Muller method)

# Usage

    import sakari.random.distributions.Normal;
    ..
    var v = new Normal().mean(1).deviation(2).generate()

The other distributions work similarly

# Testing

The tests use `openfl` and `munit` so you'll need those. Then run

    openfl test test.xml cpp

# License

MIT
