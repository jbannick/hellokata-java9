module kata.eng2mod {
    requires kata.api;

    provides kata.api.Engine with kata.eng2.Engine2;
}
