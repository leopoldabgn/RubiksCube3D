
class Timer
{
  float start_time = 0, time = 0;
  PFont font = createFont("Orbitron.ttf",54);
  
  void start()
  {
    start_time = millis();
    time = 0;
  }
  
  void refresh()
  {
    if(start_time != 0)
      time = millis() - start_time;
  }
  
  void stop()
  {
    start_time = 0; 
  }
  
  void reset()
  {
    time = 0;
    start_time = 0;
  }
  
  void disp()
  {
    int sec = floor(time/1000), ms = (int)floor((time-(floor(time/1000)*1000))/10);    // ms = (int)floor((time-(floor(time/1000)*1000))/10) --> 2 chiffres après la virgule, ms = (int)(time-(floor(time/1000)*1000))
    int k = 25;
    textFont(font);
    if(ms >= 10)
      text(sec+"."+ms,(width/2)-80,k);
    else
      text(sec+".0"+ms,(width/2)-80,k);

    /*
    if(ms >= 100)
      text(sec+"."+ms,width/2,k);
    else if(ms >= 10)
      text(sec+".0"+ms,width/2,k);
    else if(ms == 0)
      text(sec+".000",width/2,k);
    else
      text(sec+".00"+ms,width/2,k);
    */
    //text(floor(time/1000)+":"+(time-(floor(time/1000)*1000)),width/2,height-100);
  }
}

class Button
{
  boolean click, visible;
  int size, radius, w, h, w_stroke, txt_space;
  float x, y;
  String name;
  PFont font;
  color c;
  
  Button(String my_string, float _x, float _y, int _w, int _h, int _txt_space, int ws, int r, color _c)
  {
    name = my_string;
    x = _x;
    y = _y;
    w_stroke = ws;
    w = _w;
    h = _h;
    c = _c;
    txt_space = _txt_space;
    radius = r;
    click = false;
    visible = true;
    font = createFont("OpenSans-Bold.ttf",26);
    textFont(font);
  }
  
  void standard()
  {
    fill(255);
    stroke(c);
    rect(x,y,w,h,radius);
    fill(c);
    text(name,x+txt_space,y);
  }
  
  void focus()
  {
    fill(c+100);
    stroke(c+100);
    rect(x,y,w,h,radius);
    fill(255);
    text(name,x+txt_space,y);
    if(mousePressed == true && mouseButton == LEFT)
    {
      if(click)
        click = false;
      else
        click = true;
      delay(100);
      //println(click);
    }
  }
  
  void active()
  {
    fill(c);
    stroke(c);
    rect(x,y,w,h,radius);
    fill(255);
    text(name,x+txt_space,y);
  }
  
  void disp()
  {
    if(visible)
    {
      strokeWeight(w_stroke);
      textFont(font);
      textAlign(LEFT,TOP);
      if((mouseX >= x && mouseX <= x+w) && (mouseY >= y && mouseY <= y+h))
      {
        focus();
      }
      else
      {
        if(click)
        {
          active();
        }
        else
        {
          standard();
        }
      }
    }
  }
}

class Vecteur
{
  int x,y,z;
  
  Vecteur(Point A, Point B)
  {
    x = B.x-A.x;
    y = B.y-A.y;
    z = B.z-A.z;
  }
  
}

class Point
{
  int x,y,z;
  
  Point(int _x, int _y, int _z)
  {
    x = _x;
    y = _y;
    z = _z;
  }
  
}

int p_s(Vecteur v1, Vecteur v2)  // "produit scalaire" --> "p_s"
{
  return v1.x*v2.x + v1.y*v2.y + v1.z*v2.z;
}
