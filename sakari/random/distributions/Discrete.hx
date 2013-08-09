package sakari.random.distributions;
using Lambda;

class Discrete extends Distribution {
    var bins: Array<{v: Float, p: Float}>;
    public function new() {
        super();
    }

    public function distribution(bins: Array<{v: Float, p: Float}>) {
        var t = bins.fold(function(b, t) {
                return t + b.p;
            }, 0);
        this.bins = bins.map(function(b) {
                return {v: b.v, p: b.p / t};
            });
        return this;
    }
    override public function generate(): Float {
        if(bins == null || bins.length == 0)
            throw 'invalid distribution or no distribution';

        var p = super.generate();
        var r: Null<Float> = null;
        bins.fold(function(b, c) {
                c += b.p;
                if(c > p && r == null) {
                    r = b.v;
                }
                return c;
            }, 0);
        return r;
    }
}