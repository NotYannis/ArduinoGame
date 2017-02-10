/*****************************************
* ================== CODES ===============
* 00 = black wall       | 01 = white floor
* 02 = player start     | 03 = go right
* 04 = go down          | 05 = go up
* 06 = go left          | 07 = block guard
* 08 = light vert door  | 09 = light hor door
* 10 = dark vert door   | 11 = dark hor door
* 12 = camera           |
* 13 = vert bad guy     | 14 = hor bad guy 
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
     case 00 :
        noStroke();
        fill(0);
        rect(x * _pixelUnit, y * _pixelUnit, _pixelUnit, _pixelUnit);
     break;
     case 01 : //FLOOR
     case 02 : //START
     case 03 : //GO RIGHT
     case 04 : //GO LEFT
     case 05 : //GO UP
     case 06 : //GO DOWN
     case 07 : //BLOCK GUARD
     case 13 : //HOR BAD GUY
     case 14 : //VERT BAD GUY
        DrawCell(255, 255, 255, _alpha, false, x, y);
     break;
     case 80 : //LIGHT VERTICAL DOOR
       DrawCell(255, 255, 255, _alpha, false, x, y);
       stroke(255,255,255);
       fill(95, 24, 24);
       rect((x - 2) * _pixelUnit, y * _pixelUnit, _pixelUnit * 3 * (_alpha / 255) , _pixelUnit);
     break;
     case 90 : //LIGHT HORIZONTAL DOOR
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
