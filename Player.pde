class Player{
 PVector pos;
 PVector vel;
  boolean canMove;
  int i = 0;
  
  Player(){
   pos = new PVector(0, 0);
   vel = new PVector(_playerSpeed, 0);
   canMove = true;
  }

  void Move(){
    if(canMove){
     pos.x += vel.x;
     pos.y += vel.y;
    }
  }
  
  void Draw(){
     noStroke();
     fill(0, 255, 255);
     ellipse(pos.x, pos.y, _pixelUnit, _pixelUnit);
  }
  
  void CheckTrigger(){
    if(((int)pos.x % _pixelUnit == _pixelUnit/2) && ((int)pos.y % _pixelUnit == _pixelUnit/2)){
      int x = (int)getPixelToUnit(pos.x);
      int y = (int)getPixelToUnit(pos.y);
      
      switch(buffer[x][y]){
        case 03 : //RIGHT
          vel = new PVector(_playerSpeed, 0);
          break;
        case 04 : //DOWN
          vel = new PVector(0, _playerSpeed);
          break;
        case 05 : //UP
          vel = new PVector(0, -_playerSpeed);
          break;
        case 06 : //LEFT
          vel = new PVector(-_playerSpeed, 0);
          break;
      }


      if((buffer[x + 1][y + 1] == 80 || buffer[x + 1][y + 1] == 90) && _alpha > 0){
        canMove = false;
      }
      if((buffer[x + 1][y + 1] == 80 || buffer[x + 1][y + 1] == 90) && _alpha == _alpha % _lightSpeed){
        canMove = true;
      }
      
    }
  }
  
}
