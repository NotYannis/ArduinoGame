/*****************************************
* ================== CODES ===============
* 0 = black wall       | 1 = white floor
* 2 = player start     | 3 = go right
* 4 = go left          | 5 = go up
* 6 = go down          | 
* 8 = light vert door  | 9 = light hor door
* 10 = dark vert door  | 11 = dark hor door
* 12 = camera          |
* 13 = vert bad guy    | 14 = hor bad guy 
*
*
*
*
*
*
*
*
*****************************************/

class Parser{
 
 void Parse(int id, int x, int y){
   switch(id){
     case 0 :
        noStroke();
        fill(0);
        rect(x * _pixelUnit, y * _pixelUnit, _pixelUnit, _pixelUnit);
     break;
     case 1 : //FLOOR
     case 2 : //START
     case 3 : //GO RIGHT
     case 4 : //GO LEFT
     case 5 : //GO UP
     case 6 : //GO DOWN
     case 13 : //HOR BAD GUY
     case 14 : //VERT BAD GUY

        noStroke();
        fill(255, _alpha);
        rect(x * _pixelUnit, y * _pixelUnit, _pixelUnit, _pixelUnit);
     break;
     case 8 : //LIGHT VERTICAL DOOR
       noStroke();
       fill(255, _alpha);
       rect(x * _pixelUnit, y * _pixelUnit, _pixelUnit, _pixelUnit);
       stroke(255,255,255);
       fill(95, 24, 24);
       rect((x - 2) * _pixelUnit, y * _pixelUnit, _pixelUnit * 3 * (_alpha / 255) , _pixelUnit);
     break;
     case 9 : //LIGHT HORIZONTAL DOOR
       noStroke();
        fill(255, _alpha);
        rect(x * _pixelUnit, y * _pixelUnit, _pixelUnit, _pixelUnit);
       stroke(255,255,255);
       fill(95, 24, 24);
       rect(x * _pixelUnit, (y - 1) * _pixelUnit, _pixelUnit, _pixelUnit  * 3 * (_alpha / 255));
     break;
   }
 }
  
}
