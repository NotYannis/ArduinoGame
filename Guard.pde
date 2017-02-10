class Guard{
 PVector pos;
 PVector vel;
 
 Guard(PVector _pos, PVector _vel){
   pos = _pos;
   vel = _vel;
 }
 
 void Move(){
   checkWalls();
   pos.x += vel.x;
   pos.y += vel.y;
 }
   
 void Draw(){
   noStroke();
   fill(255, 0, 0, _alpha);
   ellipse(pos.x, pos.y, _pixelUnit, _pixelUnit);
 }

   
 void checkWalls(){
   if(((int)pos.x % _pixelUnit == _pixelUnit/2) && ((int)pos.y % _pixelUnit == _pixelUnit/2)){
     int nextX = (int)getPixelToUnit(pos.x);
     int nextY = (int)getPixelToUnit(pos.y);
     if(buffer[nextX + (int)vel.x][nextY + (int)vel.y] == 0){
       vel.x *= -1;
       vel.y *= -1;
     }
   }
 }
}
