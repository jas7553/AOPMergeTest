package b;

public class Foo {
    public int bar;

    public Foo(int bar) {
        this.bar = bar;
    }

    /*
     * Halves qux
     */
    public int baz(int qux) {
        return (int) (qux / 2.0);
    }
}