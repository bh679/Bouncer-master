
switch(background[stage])
{
    case background_green: draw_fog_alpha(3/4) break;
    case background_orange: draw_fog_bellow(780/1280*480,3/4) break;
    case background_swamp: draw_fog_bellow(700/1280*480,1/2) break;
    case background_purple: draw_fog_focusy(780/1280*480,50,3/4) break;
}
