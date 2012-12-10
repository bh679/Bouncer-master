
switch(background[stage])
{
    case background_green: draw_generic_fog() break;
    case background_orange: draw_fog_bellow(780/1280*480,1) break;
    case background_swamp: draw_fog_bellow(700/1280*480,1) break;
    case background_purple: draw_fog_focusy(780/1280*480,50,1) break;
}
