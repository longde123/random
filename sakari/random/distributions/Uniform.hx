package sakari.random.distributions;
using Lambda;

class Uniform extends Distribution {
    var lo: Null<Float>;
    var hi: Null<Float>;
    public function new() {
        super();
    }
    
    public function range(lo: Float, hi: Float): Uniform {
        this.lo = lo;
        this.hi = hi;
        return this;
    }
    
    override public function generate(): Float {
        if(this.lo == null || this.hi == null)
            throw 'illegal range or no range';
        return super.generate() * (this.hi - this.lo) + this.lo;
    }
}