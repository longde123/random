package sakari.random.generators;

class Function implements Generator {
    var fn: Void -> Float;
    public function new(fn: Void -> Float) {
        this.fn = fn;
    }
    
    public function generate(): Float {
        return this.fn();
    }
}