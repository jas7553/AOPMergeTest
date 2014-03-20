public class Main {
    public static void main(String[] args) {
        a.Foo aFoo = new a.Foo(10);
        b.Foo bFoo = new b.Foo(20);

        // aFoo and bFoo are dual singletons
        assert (aFoo == new a.Foo(30));
        assert (bFoo == new b.Foo(40));

        // changing aFoo's bar changes bFoo's bar
        aFoo.bar = 5;
        assert (aFoo.bar == bFoo.bar);

        // changing bFoo's bar changes aFoo's bar
        bFoo.bar = 6;
        assert (bFoo.bar == aFoo.bar);

        // aFoo.baz doulbes, bFoo.baz halves (but aFoo.baz has been overridden with bFoo.baz)
        assert (aFoo.baz(10) == 5);

        // aFoo.baz doulbes, bFoo.baz halves
        assert (bFoo.baz(10) == 5);

        System.out.println("PASS");
    }
}
