fogthinkness = 15
for(i = 0; i < fogthinkness; i += 1)
{
    //do{
        fogx[i] = random(room_width);
        fogy[i] = random(room_height);
    //}until(random(point_distance(room_width/2,room_height/2,fogx[i],fogy[i])) > 50);
    
    fogs[i] = random(10)+1;
}

fogfactor = 0
