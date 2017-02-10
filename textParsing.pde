import processing.serial.*;
import cc.arduino.*;


int _pixelUnit = 20;
float _alpha = 255;
int _lightSpeed = 10;
float _playerSpeed = 2;

Table table;
int[][] buffer;
Guard[] guards; 
Player player;
Parser parser;


boolean lightOn = true;
int totalGuards;


void setup(){
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  println(Arduino.list());

  size(640, 640);
  player = new Player();
  parser = new Parser();
  guards = new Guard[40];
  loadData();
  frameRate(30);
}

void draw(){
  background(0);
    for(int x = 0; x < table.getColumnCount(); ++x){
      for(int y = 0; y < table.getRowCount(); ++y){
        parser.Parse(buffer[x][y], x, y);
    }
  }
  
  player.CheckTrigger();
  player.Move();
  player.Draw();
  
  for(int i = 0; i < totalGuards; ++i){
    guards[i].Move();
    guards[i].Draw();
  }
  
  if(lightOn){
    if(_alpha < 255){
      _alpha += _lightSpeed;
    }
  }
  if(!lightOn){
    if(_alpha > 0)
      _alpha -= _lightSpeed;
  }
}

void mouseClicked(){
  lightOn = !lightOn;
}

void loadData(){
  table = new Table();
  table = loadTable("test.txt", "csv, header");
  buffer = new int[table.getColumnCount()][table.getRowCount()];
  
  for(int x = 0; x < table.getColumnCount(); ++x){
    for(int y = 0; y < table.getRowCount(); ++y){
      buffer[x][y] = table.getInt(y, x);
      if(table.getInt(y, x) == 2){     
        player.pos = new PVector(x * _pixelUnit + _pixelUnit/2, y * _pixelUnit + _pixelUnit/2);
      }
      if(table.getInt(y, x) == 14){
         Guard newGuard = new Guard(new PVector(x * _pixelUnit + _pixelUnit/2, y * _pixelUnit + _pixelUnit/2), new PVector(1, 0));
         guards[totalGuards] = newGuard;
         totalGuards++;
      }
      if(table.getInt(y, x) == 13){
         Guard newGuard = new Guard(new PVector(x * _pixelUnit + _pixelUnit/2, y * _pixelUnit + _pixelUnit/2), new PVector(0, 1));
         guards[totalGuards] = newGuard;
         totalGuards++;
      }     
    }
  }
}

public float getPixelToUnit(float pos){
  return map((int)pos, 0, 640, 0, 32);
}