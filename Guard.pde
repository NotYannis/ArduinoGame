class Guard{
 PVector pos;
 PVector vel;
 PVector dir;
 PVector cell;
 PVector watch;
 int i = 0;
 
 Guard(PVector _pos, PVector _vel, PVector _dir){
   pos = _pos;
   vel = _vel;
   dir = _dir;
 }
 
 void Move(){
   if(OnCell()){
     cell = GetCell();
     checkWalls();
   }
   Watch();
   pos.x += vel.x;
   pos.y += vel.y;
 }
   
 void Draw(){
   noStroke();
   fill(255, 0, 0, _alpha);
   ellipse(pos.x, pos.y, _pixelUnit, _pixelUnit);
 }

   
 void checkWalls(){   
   int nextCell = buffer[(int)cell.x + (int)dir.x][(int)cell.y + (int)dir.y];
   
   if(nextCell == 00 || nextCell == 07 || nextCell == 80 || nextCell == 90){
     vel.x *= -1;
     vel.y *= -1;
     dir.x *= -1;
     dir.y *= -1;
   }
 }
 
 void Watch(){
    noStroke();
    fill(100, 50, 50, _alpha);
    PVector boundMin = new PVector(0, 0);
    PVector rightBot = new PVector(0, 0);
    PVector leftTop = new PVector(0, 0);
    PVector boundMax = new PVector(0, 0);
    
    if(dir.x == -1 || dir.x == 1){
      rect(pos.x + (_pixelUnit/2 * dir.x), pos.y - _pixelUnit * 1.5, _pixelUnit * 3 * dir.x, _pixelUnit * 3);
      if(dir.x == 1){
        boundMin = new PVector(pos.x + (_pixelUnit/2 * dir.x), pos.y - _pixelUnit * 1.5);
        boundMax = new PVector(pos.x + (_pixelUnit/2 * dir.x) + _pixelUnit * 3 * dir.x, pos.y - _pixelUnit * 1.5 + _pixelUnit * 3);
      }
      if(dir.x == -1){
        boundMin = new PVector(pos.x + (_pixelUnit/2 * dir.x) +  _pixelUnit * 3 * dir.x, pos.y - _pixelUnit * 1.5);
        boundMax = new PVector(pos.x + (_pixelUnit/2 * dir.x), pos.y - _pixelUnit * 1.5 + _pixelUnit * 3);
      }
    }
    if(dir.y == -1 || dir.y == 1){
      rect(pos.x - _pixelUnit * 1.5, pos.y + (_pixelUnit/2 * dir.y), _pixelUnit * 3, _pixelUnit * 3 * dir.y);
      boundMin = new PVector(pos.x - _pixelUnit * 1.5, pos.y + (_pixelUnit/2 * dir.y) + _pixelUnit * 3 * dir.y);
      boundMax = new PVector(pos.x - _pixelUnit * 1.5 + _pixelUnit * 3, pos.y + (_pixelUnit/2 * dir.y));
    }
    if(player.pos.x > boundMin.x && player.pos.y > boundMin.y && player.pos.x < boundMax.x && player.pos.y < boundMax.y && _alpha > _alpha % _lightSpeed){
        loadData();
    }
 }
 
 PVector GetCell(){
     PVector cell = new PVector((int)getPixelToUnit(pos.x), (int)getPixelToUnit(pos.y));
     return cell;
 }
 
 public boolean OnCell(){
   return ((int)pos.x % _pixelUnit == _pixelUnit/2) && ((int)pos.y % _pixelUnit == _pixelUnit/2);
 }
}
