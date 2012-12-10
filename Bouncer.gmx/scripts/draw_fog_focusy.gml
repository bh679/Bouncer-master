fogfactor += 1

yfocus = argument0
sizeFactor = argument1/room_height
alphaFactor = argument2

for(i = 0; i < fogthinkness; i += 1)
{
    x_fog = fogx[i]+sin(fogfactor/50+fogx[i]/50)*fogs[i]*10
    y_fog = fogy[i]+cos(fogfactor/50+fogx[i]/50)*fogs[i]*10
    distance_multiplyer = point_distance(room_width/2,yfocus,x_fog,y_fog)/(room_height*sizeFactor/(2+fogs[i]/2))
    alpha = ((0.8+sin(fogfactor/100)/5)
            *  distance_multiplyer * 0.9) * alphaFactor
    //change fog
    draw_sprite_ext(spr_fog,0,x_fog,
                              (-room_height/2+y_fog/2)*sizeFactor+yfocus,
                              fogs[i]+fogs[i]*sin(fogfactor/10)/100,
                              fogs[i],0,noone,
                              alpha)
    if global.debuggin draw_text(x_fog,
                (-room_height/2+y_fog/2)*sizeFactor+yfocus,
                string(distance_multiplyer))
}
