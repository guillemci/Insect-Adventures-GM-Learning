// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function movement(){
    var jumphold = keyboard_check(vk_up);
    var jumpinput = keyboard_check_pressed(vk_up);
    rightkey = keyboard_check(vk_right);
    leftkey = keyboard_check(vk_left);
    
    movementspeed = global.player.WALK_SPEED;
    movementdirection = rightkey - leftkey;

    //Caminar
    //correr
    if (keyboard_check(vk_shift))
    {
       movementspeed = global.player.SPRINT_SPEED;
       running = true;
    }
    else
    {
        running = false;
    }

    var isgrounded = place_meeting(x, y + 1, tierra);
    //gravetat
    if (isgrounded)
    {
        inground = true;
        atraction = 0;

        while (place_meeting(x, y, tierra))
        {
            y -= 1;
        }
    }
    else 
    {
        inground = false;
        if (!jumping)
        {
            atraction += global.player.NORMAL_GRAVITY; 
            atraction = min(atraction, 7 /*el numero 7 es la maxima atraccio que es pot manifestar en una caiguda en condicions normals*/);
        }
        else
        {
            atraction = global.player.JUMP_COUNTER_GRAVITY;
        }
    }
    
    //saltar
    //condicio que executara el salt
    if (jumpinput && inground)
    {
        jumping = true;
    }
    
    //condicions per portar a terme o parar el salt
    if (jumphold && jumping && MaxJumpHeight < 9)
    {
        //salt principal
        if (MaxJumpHeight < 5)
        {
            //cambiar funcionament de height
            MaxJumpHeight += 0.5;
            y-= global.player.NORMAL_JUMP;
        }
        //extensio salt
        else
        {
            //cambiar funcionament de height
            MaxJumpHeight += 1;
            y-= global.player.EXTENDED_JUMP;        
            movementspeed = global.player.EXTENDED_JUMP_SPEED;
        }
    }
    
    //es compleix condicio per parar salt
    if ((!jumphold || MaxJumpHeight >= 9) && jumping)
    {
        jumping = false;
        MaxJumpHeight = 0;
    }

    //calcul velocitat
    finalmovement = movementdirection * movementspeed;

    //aplicar canvis x,y
    x += finalmovement;
    y += atraction;
}