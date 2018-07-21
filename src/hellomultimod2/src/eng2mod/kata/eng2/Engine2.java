package kata.eng2;

import kata.api.Engine;

public class Engine2 implements Engine {
    
    private static final String NAME = "Engine1";
    
    @Override
    public String getName() {
        return NAME;
    }
    
    @Override
    public void process(final String string) {
        System.out.println(String.format("Pureeing %s", string));
    }
}
