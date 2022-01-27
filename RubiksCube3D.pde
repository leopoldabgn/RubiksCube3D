Timer chrono; //<>//
Cube cube_2x2, cube_3x3;

Button button_view, button_2x2, button_3x3;
boolean on_cube = false;
float x, y, z, last_x, last_y, last_z;
float rx = 0;
float ry = 0;
color c[], cube[][];
final int top=0, left=1, front=2, right=3, back=4, bottom=5, speed = 50;
int gamemode = 1, no_mouv = 0, position = 0, savedTime, interval, elapsed, cube_size, actual_cube;
char solution[];

void setup()
{
  size(1200, 800, P3D);
  background(128);
  button_view = new Button("view", 20, 20, 100, 40, 20, 3, 12, color(255,79,79)-50);  // color(255,120,0)
  button_2x2 = new Button("2x2", width-100, 20, 72, 40, 13, 3, 12, color(255,79,79)-50);
  button_3x3 = new Button("3x3", width-100, 20, 72, 40, 13, 3, 12, color(255,79,79)-50);
  button_2x2.visible = false;
  button_2x2.click = true;
  button_3x3.click = true;
  c = new color[6];
  solution = new char[1000];
  c[0] = color(255);
  c[1] = color(255, 127, 0);
  c[2] = color(0, 255, 0);
  c[3] = color(255, 0, 0);
  c[4] = color(0, 0, 255);
  c[5] = color(255, 255, 0);
  x = width/2.0;
  y = height/2.2;
  z = 0.0;
  smooth();
  actual_cube = 1;
  cube_size = 290;
  cube_2x2 = new Cube(0,cube_size);
  cube_3x3 = new Cube(1,cube_size);
  cube = new color[18][3];
  reset_cube();
  chrono = new Timer();
  interval = 200;
  savedTime = millis();
}

void draw()
{
  elapsed = millis() - savedTime;
  background(128);
  button_view.disp();
  button_2x2.disp();
  button_3x3.disp();
  chrono.refresh();
  chrono.disp();
  if (keyPressed == true)
  {
    if (elapsed > interval)
    {
      controls();
      convert_cube(cube);
      savedTime = millis();
    }
  }

  if (button_3x3.visible == true && button_3x3.click == false)
  {
    button_view.click = true;
    button_3x3.visible = false;
    button_3x3.click = true;
    button_2x2.visible = true;
    gamemode = 0;
    reset_cube();
    convert_cube(cube);
  } 
  else if (button_2x2.visible == true && button_2x2.click == false)
  {
    button_view.click = true;
    button_2x2.visible = false;
    button_2x2.click = true;
    button_3x3.visible = true;
    gamemode = 1;
    reset_cube();
    convert_cube(cube);
  }

  if (button_view.click)
  {
    rx = map((width*305)/800, 0, width, -PI, PI);
    ry = map((468*height)/800, 0, height, PI, -PI);
  } 

  translate(x, y, z); // translate(width/2,height/2,z); --> permet de toujours center le cube même lorsqu'on met la page en pleine écran.
  rotateX(ry);
  rotateY(rx);
  // camera(x, y, (z/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 0, 0);
  if(gamemode == 0)
    cube_2x2.disp();
  else if(gamemode == 1)
    cube_3x3.disp();
    
}

void mouseDragged()
{
  if(on_cube == false)
  {
      if(button_view.click)
        button_view.click = false;
      float x = mouseX-pmouseX;
      float y = mouseY-pmouseY;
      rx += x * 0.01;
      ry += -y * 0.01;
  }
}

// void tableau_2D_tab[18][3]-->tab[6][9]

void mouseReleased()
{
  int direction = 0, face = 0;
    
   if(button_view.click && on_cube)
    {
      direction = get_direction(last_x,last_y,mouseX,mouseY);
      face = get_face(last_x,last_y);
      if(direction != -1)
      {
        move_cube(direction,face,last_x,last_y);
        convert_cube(cube);
      }
    }
    
  if(on_cube)
    on_cube = false; 
}

void mousePressed()
{
  // println("\nmouse X: ",mouseX,"\nmouseY : ",mouseY);
  
  if((mouseX >= 348 && mouseX <= 839) && (mouseY >= 151 && mouseY <= 620))
  {
    on_cube = true;
    last_x = mouseX;
    last_y = mouseY;
  }
}

int get_direction(float lastX, float lastY, float the_x, float the_y)
{
  int angle = 100;
  if(the_x-lastX > -angle && the_x-lastX < angle)
  {
    if(lastY-the_y > angle)
    {
      return top;
    }
    else if(lastY-the_y < -angle)
    {
      return bottom;
    }
  }
  else if(lastY-the_y > -angle && lastY-the_y < angle)
  {
    if(the_x-lastX > angle)
    {
      return right;
    }
    else if(the_x-lastX < -angle)
    {
      return left;
    }
  }
  
  return -1;
}

int get_face(float _x, float _y)
{
  if(((_x >= 515 &&_x < 611) && _y > 309) || ((_x >= 440 &&_x < 515) && _y > 276) || (_x < 440 && _y > 248))
    return 1;
  else if(((_x > 611 &&_x < 695) && _y > 309) || ((_x >= 695 &&_x < 761) && _y > 276) || (_x > 761 && _y > 248))
    return 2;
  else
    return 0;
}

void move_cube(int direction,int face,float _x,float _y)
{
  if(face == 0)
  {
    // println("Face 0");
  }
  else if(face == 1)
  {
    // println("Face 1");
    switch(direction)
    {
     case top:
       if(_x < 447)
         reverse('L');
       else if(_x < 515)
         reverse('M');
       else if(_x < 610)
         mouv_R();
       break;
     case bottom:
       if(_x < 447)
         mouv_L();
       else if(_x < 515)
         mouv_M();
       else if(_x < 610)
         reverse('R');
       break;
     case right:
       if(_x < 478)
       {
         if(_y < 325)
           reverse('U');
         else if(_y < 408)
           reverse('E');
         else if(_y < 495)
           mouv_D();
       }
       else if(_x > 478 && _x <= 610)
       {
         if(_y < 372)
           reverse('U');
         else if(_y < 466)
           reverse('E');
         else if(_y < 546)
           mouv_D();
       }
       break;
     case left:
       if(_x < 478)
       {
         if(_y < 325)
           mouv_U();
         else if(_y < 408)
           mouv_E();
         else if(_y < 495)
           reverse('D');
       }
       else if(_x > 478 && _x <= 610)
       {
         if(_y < 372)
           mouv_U();
         else if(_y < 466)
           mouv_E();
         else if(_y < 546)
           reverse('D');
       }
       break;
     default:
       break;
    }
  
  }
  else if(face == 2)
  {
    // println("Face 2"); //<>//
    switch(direction)
    {
     case top:
       if(_x < 688)
         reverse('F');
       else if(_x <= 755)
       {
         mouv_U();
         mouv_E();
         reverse('D');
         reverse('M');
         reverse('U');
         reverse('E');
         mouv_D();
       }
       else if(_x > 755)
         mouv_B();
       break;
     case bottom:
       if(_x < 688)
         mouv_F();
       else if(_x <= 755)
       {
         mouv_U();
         mouv_E();
         reverse('D');
         mouv_M();
         reverse('U');
         reverse('E');
         mouv_D();
       }
       else if(_x > 755)
         reverse('B');
       break;
     case right:
       if(_x  > 611 && _x <= 724)
       {
         if(_y < 365)
           reverse('U');
         else if(_y <= 457)
           reverse('E');
         else if(_y > 457)
           mouv_D();
       }
       else if(_x > 724)
       {
         if(_y < 312)
           reverse('U');
         else if(_y <= 397)
           reverse('E');
         else if(_y > 397)
           mouv_D();
       }
       break;
     case left:
       if(_x  > 611 && _x <= 724)
       {
         if(_y < 365)
           mouv_U();
         else if(_y <= 457)
           mouv_E();
         else if(_y > 457)
           reverse('D');
       }
       else if(_x > 724)
       {
         if(_y < 312)
           mouv_U();
         else if(_y <= 397)
           mouv_E();
         else if(_y > 397)
           reverse('D');
       }
       break;
     default:
       break;
    }
  }

}

void controls()
{

  if (key == CODED)
  {
    switch(keyCode)
    {
    case LEFT:
      mouv_U();
      mouv_E();
      reverse('D');
      break;
    case RIGHT:
      reverse('U');
      reverse('E');
      mouv_D();
      break;
    case UP:
      reverse('L');
      reverse('M');
      mouv_R();
      break;
    case DOWN:
      mouv_L();
      mouv_M();
      reverse('R');
      break;
    default:
      break;
    }
  } else
  {
    switch(key)
    {
      /*case 'z':
       z += 1;
       break;
       case 's':
       z -= 1; 
       break;*/
    case ' ':
      if(chrono.start_time == 0) chrono.start();
      else
        chrono.stop();
      break;
    case 's':
      scramble(20);
      break;
    case 'd':
      mouv_D();
      println("D");
      break;
    case 'u':
      mouv_U();
      println("U");
      break;
    case 'f':
      mouv_F();
      println("F");
      break;
    case 'r':
      mouv_R();
      println("R");
      break;
    case 'l':
      mouv_L();
      println("L");
      break;
    case 'b':
      mouv_B();
      println("B");
      break;
    case 'e':
      mouv_E();
      println("E");
      break;
    case 'm':
      mouv_M();
      println("M");
      break;
    case 'D':
      mouv_D();
      mouv_D();
      mouv_D();
      println("D'");
      break;
    case 'U':
      mouv_U();
      mouv_U();
      mouv_U();
      println("U'");
      break;
    case 'F':
      mouv_F();
      mouv_F();
      mouv_F();
      println("F'");
      break;
    case 'R':
      mouv_R();
      mouv_R();
      mouv_R();
      println("R'");
      break;
    case 'L':
      mouv_L();
      mouv_L();
      mouv_L();
      println("L'");
      break;
    case 'B':
      mouv_B();
      mouv_B();
      mouv_B();
      println("B'");
      break;
    case 'E':
      mouv_E();
      mouv_E();
      mouv_E();
      println("E'");
      break;
    case 'M':
      mouv_M();
      mouv_M();
      mouv_M();
      println("M'");
      break;
    case 'v':
      if (button_view.click)
        button_view.click = false;
      else
        button_view.click = true;
      break;
    case 'j':
      save("monfichier.jpg");
      break;
      /*case 'i':
       for(int i=0;i<1000;i++)
       {
       solution[i] = 0;
       }
       t1 = clock();
       IA();
       t2 = clock();
       temps = (float)(t2-t1)/CLOCKS_PER_SEC;
       println("temps = %f\n", temps);
       display_solve();
       break;
       case 't':
       PLL_T();
       convert_cube(cube);
       break;
       case 'a':
       reset_cube();
       break;
       case 'p':
       for(int i=0;i<1000;i++)
       {
       solution[i] = 0;
       }
       break;*/
    default:
      break;
    }
  }
}

void restore_cube(color tab[][])
{
  int val = 1, val2 = 0;
  Cube cube;
  if(actual_cube == 1)
    cube = cube_3x3;
  else
    cube = cube_2x2;
  
  for (int j=0; j<3; j++)
    for (int i=0; i<3; i++)
      tab[j][i] = cube.faces[0].squares[i+j*3];

  for (int j=3; j<=14; j++)
  {
    for (int i=0; i<3; i++)
    {
      tab[j][i] = cube.faces[val].squares[i+val2*3];
    }
    if (val == 4)
    {
      val=1;
      val2++;
    } else
      val++;
  }
  val=0;
  for (int j=15; j<=17; j++)
  {
    for (int i=0; i<3; i++)
      tab[j][i] = cube.faces[5].squares[i+val*3];
    val++;
  }
}

void convert_cube(color tab[][])
{
  int val = 1, val2 = 0;
  Cube cube;
  if(actual_cube == 1)
  {
    cube = cube_3x3;
    
    for (int j=0; j<3; j++)
      for (int i=0; i<3; i++)
        cube.faces[0].squares[i+j*3] = tab[j][i];
  
    for (int j=3; j<=14; j++)
    {
      for (int i=0; i<3; i++)
      {
        cube.faces[val].squares[i+val2*3] = tab[j][i];
      }
      if (val == 4)
      {
        val=1;
        val2++;
      } else
        val++;
    }
    val=0;
    for (int j=15; j<=17; j++)
    {
      for (int i=0; i<3; i++)
        cube.faces[5].squares[i+val*3] = tab[j][i];
      val++;
    }
  }
  else
  {
    cube = cube_2x2;

    for (int j=0; j<2; j++)
      for (int i=0; i<2; i++)
        cube.faces[0].squares[i+j*2] = tab[j][i];
    
    for (int j=2; j<=10; j++)
    {
      for (int i=0; i<2; i++)
      {
        cube.faces[val].squares[i+val2*2] = tab[j][i];
      }
      if (val == 4)
      {
        val=1;
        val2++;
      } 
      else
        val++;
    }
    val=0;
    for (int j=11; j<=13; j++)
    {
      for (int i=0; i<2; i++)
        cube.faces[5].squares[i+val*2] = tab[j][i];
      val++;
    }
  }

}

class CubeFace {
  Boolean visible = true;
  color c, squares[];
  PShape s;
  int z;

  CubeFace(color _c)
  {
    s = createShape();
    c = _c;
    squares = new color[9];
    for (int i=0; i<9; i++)
      squares[i] = c;
  }

  void begin()
  {
    s.beginShape();
  }

  void vertex(int v1, int v2, int v3)
  {
    s.vertex(v1, v2, v3);
  }

  void end()
  {
    s.endShape();
  }

  void disp(color c) {    
    if (visible) {
      s.setStrokeWeight(1);
      s.setStroke(255);
      s.setFill(c);
      shape(s);
    }
  }
}

class Cube
{
  CubeFace face, faces[];
  int size, x, y, z, type;
  float rotate_x, rotate_y, rotate_z;

  Cube(int _type, int s)  // creation d'une nouveau cube
  {
    size = s;
    type = _type;
    rotate_x = 0;
    rotate_y = 0;
    rotate_z = 0;
    x = width/2;
    y = height/2;
    z = 0;
    setup_faces();
    fill(255, 74, 0);
    translate(x, y, 0);
  }

  void setup_faces()
  {
    int w = size/3, h = size/3, d = size/2;
    
    if(type == 0)
    {  
      w = size/2;
      h = size/2;   //<>//
    }

    faces = new CubeFace[6];
    for (int i=0; i<6; i++)
      faces[i] = new CubeFace(c[i]);

    face = faces[front];
    face.begin(); // front face
    face.vertex(0, 0, d);
    face.vertex(0, h, d);
    face.vertex(w, h, d);
    face.vertex(w, 0, d);
    //face.visible = false;
    face.end();

    face = faces[back];
    face.begin(); // back face
    face.vertex(0, 0, -d);
    face.vertex(0, h, -d);
    face.vertex(w, h, -d);
    face.vertex(w, 0, -d);
    //face.visible = false;
    face.end();

    if(type == 1) 
      d = size/3;

    face = faces[left];
    face.begin(); // left face
    face.vertex(0, 0, 0);
    face.vertex(0, h, 0);
    face.vertex(0, h, -d);
    face.vertex(0, 0, -d);
    //face.visible = false;
    face.end();

    face = faces[right];
    face.begin(); // right face
    face.vertex(3*w, 0, 0);
    face.vertex(3*w, h, 0);
    face.vertex(3*w, h, -d);
    face.vertex(3*w, 0, -d);
    //face.visible = false;
    face.end();

    face = faces[top];
    face.begin(); // bottom face
    face.vertex(0, 0, 0);
    face.vertex(0, 0, -d);
    face.vertex(w, 0, -d);
    face.vertex(w, 0, 0);
    //face.visible = false;
    face.end();

    face = faces[bottom];
    face.begin(); // top face
    face.vertex(0, 3*h, 0);
    face.vertex(0, 3*h, -d);
    face.vertex(w, 3*h, -d);
    face.vertex(w, 3*h, 0);
    //face.visible = false;
    face.end();
  }

  void move(int new_x, int new_y, int new_z)
  {
    x = new_x;
    y = new_y;
    z = new_z;
    translate(x, y, z);
  }

  void rotation(float the_x, float the_y, float the_z)
  {
    if (the_x!=0)
    {
      rotate_x += the_x;  
      rotateX(radians(rotate_x));
    }

    if (the_y!=0)
    {
      rotate_y += the_y;  // j'ai mis moins pour inverser le sens.
      rotateY(radians(rotate_y));
    }

    if (the_z!=0)
    {
      rotate_z += the_z;  
      rotateZ(radians(rotate_z));
    }
  }

  void disp()  // "disp" comme display, permet d'afficher le cube
  {
    int w = size, h = size, d = size  ;
    strokeWeight(3);
    stroke(255);
    //noStroke();
    noFill();
    box(size);
    
    if(type == 0)
    {
      
    for (int k=0; k<6; k++)
    {
      pushMatrix();
      if ( k == front || k == back)
      {
        if (k == front) translate(-w/2, -h/2, 0);
        else
          translate(0, -h/2, 0);
        for (int j=0; j<2; j++)
        {
          if (j>0) 
            translate(0, h/2);
          for (int i=0; i<2; i++)
          {
            pushMatrix();
            if (k == front) translate((w/2)*i, 0);
            else
              translate((-w/2)*i, 0);
            faces[k].disp(faces[k].squares[i+j*2]);
            popMatrix();
          }
        }
      } else if ( k == left || k == right)
      {
        if (k == left) translate(-w/2, -h/2,0);
        else
          translate(-w, -h/2,size/2);
        for (int j=0; j<2; j++)
        {
          if (j>0) 
            translate(0, h/2);
          for (int i=0; i<2; i++)
          {
            pushMatrix();
            if (k == left) translate(0, 0, (d/2)*i);
            else
              translate(0, 0, (-d/2)*i);
            faces[k].disp(faces[k].squares[i+j*2]);
            popMatrix();
          }
        }
      } else if ( k == top || k == bottom)
      {
        if (k == top) translate(-w/2, -h/2,0);
        else
          translate(-w/2, -h, size/2);
        for (int j=0; j<2; j++)
        {
          if (j>0)
          {
            if (k == top) translate(0, 0, d/2);
            else
              translate(0, 0, -d/2);
          }
          for (int i=0; i<2; i++)
          {
            pushMatrix();
            translate((w/2)*i, 0);
            faces[k].disp(faces[k].squares[i+j*2]);
            popMatrix();
          }
        }
      }
      popMatrix();
    }
      
    }
    else if(type == 1)
    {
    
    for (int k=0; k<6; k++)
    {
      pushMatrix();
      if ( k == front || k == back)
      {
        if (k == front) translate(-w/2, -h/2, 0);
        else
          translate(w/3/2, -h/2, 0);
        for (int j=0; j<3; j++)
        {
          if (j>0) 
            translate(0, h/3);
          for (int i=0; i<3; i++)
          {
            pushMatrix();
            if (k == front) translate((w/3)*i, 0);
            else
              translate((-w/3)*i, 0);
            faces[k].disp(faces[k].squares[i+j*3]);
            popMatrix();
          }
        }       
      } else if ( k == left || k == right)
      {
        if (k == left) translate(-w/2, -h/2, -((size/2)-(size/3)));
        else
          translate(-w/2, -h/2, ((size/2)-(size/3))+size/3);
        for (int j=0; j<3; j++)
        {
          if (j>0) 
            translate(0, h/3);
          for (int i=0; i<3; i++)
          {
            pushMatrix();
            if (k == left) translate(0, 0, (d/3)*i);
            else
              translate(0, 0, (-d/3)*i);
            faces[k].disp(faces[k].squares[i+j*3]);
            popMatrix();
          }
        }
      } else if ( k == top || k == bottom)
      {
        if (k == top) translate(-w/2, -h/2, -((size/2)-(size/3)));
        else
          translate(-w/2, -h/2, ((size/2)-(size/3))+size/3);
        for (int j=0; j<3; j++)
        {
          if (j>0)
          {
            if (k == top) translate(0, 0, d/3);
            else
              translate(0, 0, -d/3);
          }
          for (int i=0; i<3; i++)
          {
            pushMatrix();
            translate((w/3)*i, 0);
            faces[k].disp(faces[k].squares[i+j*3]);
            popMatrix();
          }
        }
      }
      popMatrix();
    }
    
    
    }
  }
}
