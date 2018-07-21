module kata.eng1mod {
    requires kata.api;

    provides kata.api.Engine with kata.eng1.Engine1;
}
