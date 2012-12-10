fogfactor += 1

alphaFactor = argument0
for(i = 0; i < fogthinkness; i += 1)
{
    x_fog = fogx[i]+sin(fogfactor/50+fogx[i]/50)*fogs[i]*10
    y_fog = fogy[i]+cos(fogfactor/50+fogx[i]/50)*fogs[i]*10
    distance_multiplyer = point_distance(room_width/2,room_height/2,x_fog,y_fog)/(room_height/(2+fogs[i]/2))
    alpha = ((0.8+sin(fogfactor/100)/5)
            *  distance_multiplyer * 0.9) * alphaFactor
    //change fog
    draw_sprite_ext(spr_fog,0,x_fog,
                              y_fog,
                              fogs[i]+fogs[i]*sin(fogfactor/10)/100,
                              fogs[i],0,noone,
                              alpha)
    if global.debuggin draw_text(fogx[i]+sin(fogfactor/50+fogx[i]/50)*fogs[i]*10,
                fogy[i]+cos(fogfactor/50+fogx[i]/50)*fogs[i]*10,
                string(distance_multiplyer))
}
