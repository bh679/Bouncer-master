if room = MENUROOM
   exit
if global.platform = Windows or global.platform = Mac
{
    draw_set_font(fontTipSmall)
    draw_set_color(c_black)
    draw_set_alpha(0.8*tipalpha)
    draw_rectangle(room_width-linewidth - 32 - 16,16,room_width - 16,16+ceil(lines*1.2)*16,true)
    draw_set_alpha(0.3*tipalpha)
    draw_rectangle(room_width-linewidth - 32- 16,16,room_width - 16,16+ceil(lines*1.2)*16,false)
    draw_set_alpha(1*tipalpha)
    draw_set_color(c_white)
    draw_text_shadow(room_width-linewidth - 16 - 16,16,curr_tip,c_white,c_black,1)
    
    if MouseInBox(room_width-linewidth - 32- 16,16,room_width - 16,16+ceil(lines*1.2)*16)
    {
        tipalpha = min(tipalpha+0.1,1)
        alarm[1] = 30*1   
    }
    draw_set_alpha(1)    
}
else if global.platform = iOS
{
    RecOutlineAlpha = 0.8
    RecOutlineCol = c_white
    RecCol = c_black
    RecAlpha = 0.4
    
    /*if obj_ctrl.DisplayEndStats
        RecHeight = 97+15+25 - 5 + 128 + 48 + 28
    else
        RecHeight = 97+15+25 - 5*/
        
    if global.endUI = _TIPS
    {
        draw_set_font(fontTipBig)
        scale = 2
        draw_set_color(RecOutlineCol)
        draw_set_alpha(RecOutlineAlpha)
        draw_rectangle(room_width-linewidth*scale - 32*scale - 16,16,room_width - 16,16+ceil(lines*1.2*scale)*16,true)
        draw_set_alpha(RecAlpha)
        draw_set_color(RecCol)
        draw_rectangle(room_width-linewidth*scale - 32*scale- 16,16,room_width - 16,16+ceil(lines*1.2*scale)*16,false)
        draw_set_alpha(1)
        draw_set_color(c_white)
        draw_text_shadow(room_width-linewidth*scale  - 16*scale - 16,16,curr_tip,c_white,c_black,1)
    }
    else if global.endUI = _SCORE
    {
        draw_set_font(fontTipBig)
        //RecHeight = room_height - room_height/3
        if obj_ctrl.pathindex < obj_ctrl.pathmax
            RecHeight = room_height/4
        else if RecHeight < room_height - room_height/3
            RecHeight += 10
        else
            RecHeight = room_height - room_height/3
        RecWidth = room_width - room_width/3
        RecX1 = (room_width/3)/2
        RecY1 = (room_height/3)/2
        RecX2 = RecX1 + RecWidth
        RecY2 = RecY1 + RecHeight//97+15+25
        RecMid = RecX1/2 + RecX2/2
        tmpY = 35
        StatsY = RecY1 + room_height/8
        padding = 25
        detailsheight = 36
        draw_set_alpha(RecOutlineAlpha)
        draw_set_color(RecOutlineCol)
        draw_rectangle(RecX1,RecY1,RecX2,RecY2,true)
        draw_set_alpha(RecAlpha)
        draw_set_color(RecCol)
        draw_rectangle(RecX1,RecY1,RecX2,RecY2,false)
        
        draw_set_alpha(1)
        draw_set_halign(fa_middle)
        tmpY = 35
        //score
        //draw_set_font(fnt_highscoreBig)
        draw_text_shadow(RecMid,RecY1 + tmpY,"Score: "+string(global._score),c_white,c_black,1)
        
        //best
        tmpY = 70
        //draw_set_font(fnt_highscore)
        if global._score > global.bestscore
            draw_text_shadow(RecMid,RecY1 + tmpY,"Best!",c_yellow,c_black,1)
            
        //extra details
        draw_set_font(fontTipMid)
        draw_set_halign(fa_left)
        tmpY += 0
        if RecY2 > StatsY+tmpY + detailsheight
        {
            draw_text_shadow(RecX1+padding,StatsY+tmpY,"Time: " + string(global.besttime/30),c_white,c_black,1)
            draw_text_shadow(RecMid,StatsY+tmpY,"Time: " + string(global.time/30),c_white,c_black,1)
            tmpY += detailsheight
            if RecY2 > StatsY+tmpY + detailsheight
            {
                draw_text_shadow(RecX1+padding,StatsY+tmpY,"Distance: "+string(global.bestdis),c_white,c_black,1)
                draw_text_shadow(RecMid,StatsY+tmpY,"Distance: "+string(global.dis),c_white,c_black,1)
                tmpY += detailsheight
                if RecY2 > StatsY+tmpY + detailsheight
                {
                    draw_text_shadow(RecX1+padding,StatsY+tmpY,"Bounces: "+string(global.bestbounces),c_white,c_black,1)
                    draw_text_shadow(RecMid,StatsY+tmpY,"Bounces: "+string(global.bounces),c_white,c_black,1)
                    tmpY += detailsheight
                    if RecY2 > StatsY+tmpY + detailsheight
                    {
                        draw_text_shadow(RecX1+padding,StatsY+tmpY,"Score: "+string(global.bestscore),c_white,c_black,1)
                        draw_text_shadow(RecMid,StatsY+tmpY,"Score: "+string(global._score),c_white,c_black,1)
                        tmpY += detailsheight
                        if RecY2 > StatsY+tmpY + detailsheight
                        {
                            draw_text_shadow(RecX1+padding,StatsY+tmpY,"Stage: "+string(global.stage),c_white,c_black,1)
                            draw_text_shadow(RecMid,StatsY+tmpY,"Stage Score: "+string(global.stageScore),c_white,c_black,1)
                            tmpY += detailsheight
                            if RecY2 > StatsY+tmpY
                            {
                                    //attempts
                                tmpY += detailsheight
                                if RecY2 > StatsY+tmpY + detailsheight
                                {
                                    draw_text_shadow(RecX1+padding,StatsY+tmpY,"Attempts: "+string(global.trys),c_white,c_black,1)
                                    //completions
                                    draw_text_shadow(RecMid,StatsY+tmpY,"Completions: "+string(global.completes),c_white,c_black,1)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    draw_set_alpha(1)    
}
