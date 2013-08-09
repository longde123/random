package sakari.random.generators;

class Standard implements Generator {
    public function new() {}

    public function generate(): Float {
        return Math.random();
    }
}