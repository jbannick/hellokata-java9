package kata.eng1;

import kata.api.Engine;

public class Engine1 implements Engine {
    
    private static final String NAME = "Engine2";
    
    @Override public String getName() {
        return NAME;
    }
    
    @Override
    public void process(final String string) {
        System.out.println(String.format("Chopping %s", string));
    }
}
