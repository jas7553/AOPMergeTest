public privileged aspect FooAspect {
    private a.Foo aFoo;
    private b.Foo bFoo;

    pointcut aFooConstructor(int bar) : call(a.Foo.new(int)) && args(bar) && !within(FooAspect);

    pointcut bFooConstructor(int bar) : call(b.Foo.new(int)) && args(bar) && !within(FooAspect);

    before(int bar) : aFooConstructor(bar) {
        if (this.aFoo == null) {
            this.aFoo = new a.Foo(bar);
            this.bFoo = new b.Foo(bar);
        }
    }

    before(int bar) : bFooConstructor(bar) {
        if (this.bFoo == null) {
            this.aFoo = new a.Foo(bar);
            this.bFoo = new b.Foo(bar);
        }
    }

    a.Foo around() : aFooConstructor(int) {
        proceed();
        return this.aFoo;
    }

    b.Foo around() : bFooConstructor(int) {
        proceed();
        return this.bFoo;
    }

    // Merge int bar
    before(int newBar): set(int a.Foo.bar) && args(newBar) && !within(FooAspect) {
        if (this.bFoo != null) {
            this.bFoo.bar = newBar;
        }
    }

    before(int newBar): set(int b.Foo.bar) && args(newBar) && !within(FooAspect) {
        if (this.aFoo != null) {
            this.aFoo.bar = newBar;
        }
    }

    // override a.Foo.qux with b.Foo.qux
    int around(int qux): call(int a.Foo.baz(int)) && args(qux) {
        return bFoo.baz(qux);
    }
}