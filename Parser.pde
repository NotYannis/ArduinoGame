/*****************************************
* ================== CODES ===============
* 0 = black wall       | 1 = white floor
* 2 = player start     | 3 = go right
* 4 = go down          | 5 = go up
* 6 = go left          | 7 = block guard
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
 boolean reDraw = false;
  
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
        DrawCell(255, 255, 255, _alpha, false, x, y);
     break;
     case 8 : //LIGHT VERTICAL DOOR
       DrawCell(255, 255, 255, _alpha, false, x, y);
       stroke(255,255,255);
       fill(95, 24, 24);
       rect((x - 2) * _pixelUnit, y * _pixelUnit, _pixelUnit * 3 * (_alpha / 255) , _pixelUnit);
     break;
     case 9 : //LIGHT HORIZONTAL DOOR
       DrawCell(255, 255, 255, _alpha, false, x, y);
       stroke(255,255,255);
       fill(95, 24, 24);
       rect(x * _pixelUnit, (y - 2) * _pixelUnit, _pixelUnit, _pixelUnit  * 3 * (_alpha / 255));
     break;
   }
 }
 
 void DrawCell(float r, float g, float b, float alpha, boolean stroke, int x, int y){
     if(stroke){
       stroke(255,255,255);
     }
     else{
       noStroke();
     }
     fill(r, g, b, alpha);
     rect(x * _pixelUnit, y * _pixelUnit, _pixelUnit, _pixelUnit);
 } 
}
