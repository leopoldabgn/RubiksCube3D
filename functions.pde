
void mouv_U()
{
    if(no_mouv == 0) add_solve_mouv('u');

    color wait = 0, wait2 = 0;

    if(gamemode == 0)
    {

        //ON TOURNE LA FACE DU HAUT
        wait = cube[0][1];

        cube[0][1] = cube[0][0];
        cube[0][0] = wait;

        wait = cube[1][1];
        cube[1][1] = cube[0][0];
        cube[0][0] = cube[1][0];
        cube[1][0] = wait;

        //ON TOURNE LES COTES
        wait  = cube[4][0];
        wait2 = cube[4][1];
        cube[4][0] = cube[5][0];
        cube[4][1] = cube[5][1];
        cube[5][0] = cube[3][0];
        cube[5][1] = cube[3][1];
        cube[3][0] = wait;
        cube[3][1] = wait2;

        wait  = cube[2][0];
        wait2 = cube[2][1];
        cube[2][0] = cube[5][0];
        cube[2][1] = cube[5][1];
        cube[5][0] = wait;
        cube[5][1] = wait2;

    }
    else if(gamemode == 1)
    {

        //ON TOURNE LA FACE DU HAUT
        wait = cube[0][2];

        cube[0][2] = cube[0][0];
        cube[0][0] = wait;

        wait = cube[2][2];
        cube[2][2] = cube[0][0];
        cube[0][0] = cube[2][0];
        cube[2][0] = wait;

        //ON TOURNE LES COTES
        wait  = cube[5][0];
        wait2 = cube[5][2];
        cube[5][0] = cube[6][0];
        cube[5][2] = cube[6][2];
        cube[6][0] = cube[4][0];
        cube[6][2] = cube[4][2];
        cube[4][0] = wait;
        cube[4][2] = wait2;

        wait  = cube[3][0];
        wait2 = cube[3][2];
        cube[3][0] = cube[6][0];
        cube[3][2] = cube[6][2];
        cube[6][0] = wait;
        cube[6][2] = wait2;

        // ON TOURNE LES ARÊTES DU HAUT
        wait = cube[1][2];

        cube[1][2] = cube[0][1];
        cube[0][1] = wait;

        wait = cube[2][1];
        cube[2][1] = cube[0][1];
        cube[0][1] = cube[1][0];
        cube[1][0] = wait;

        // ON TOURNE LES ARÊTES SUR LE COTE
        wait = cube[5][1];

        cube[5][1] = cube[6][1];
        cube[6][1] = wait;

        wait = cube[4][1];
        cube[4][1] = cube[6][1];
        cube[6][1] = cube[3][1];
        cube[3][1] = wait;

    }

}

void mouv_D()
{
    if(no_mouv == 0) add_solve_mouv('d');

    color wait, wait2;

    if(gamemode == 0)
    {

        //ON TOURNE LA FACE DU BAS
        wait = cube[10][1];

        cube[10][1] = cube[10][0];
        cube[10][0] = wait;

        wait = cube[11][1];
        cube[11][1] = cube[10][0];
        cube[10][0] = cube[11][0];
        cube[11][0] = wait;

        //ON TOURNE LES COTES

        for(int i=0;i<3;i++)
        {

            wait  = cube[8][0];
            wait2 = cube[8][1];
            cube[8][0] = cube[9][0];
            cube[8][1] = cube[9][1];
            cube[9][0] = cube[7][0];
            cube[9][1] = cube[7][1];
            cube[7][0] = wait;
            cube[7][1] = wait2;

            wait  = cube[6][0];
            wait2 = cube[6][1];
            cube[6][0] = cube[9][0];
            cube[6][1] = cube[9][1];
            cube[9][0] = wait;
            cube[9][1] = wait2;

        }

    }

    else if(gamemode == 1)
    {

        //ON TOURNE LA FACE DU BAS
        wait = cube[15][2];

        cube[15][2] = cube[15][0];
        cube[15][0] = wait;

        wait = cube[17][2];
        cube[17][2] = cube[15][0];
        cube[15][0] = cube[17][0];
        cube[17][0] = wait;

        //ON TOURNE LES COTES

        for(int i=0;i<3;i++)
        {

            wait  = cube[13][0];
            wait2 = cube[13][2];
            cube[13][0] = cube[14][0];
            cube[13][2] = cube[14][2];
            cube[14][0] = cube[12][0];
            cube[14][2] = cube[12][2];
            cube[12][0] = wait;
            cube[12][2] = wait2;

            wait  = cube[11][0];
            wait2 = cube[11][2];
            cube[11][0] = cube[14][0];
            cube[11][2] = cube[14][2];
            cube[14][0] = wait;
            cube[14][2] = wait2;

        }

        //ON TOURNE LA ARETES VERS LE BAS
        wait = cube[16][2];

        cube[16][2] = cube[15][1];
        cube[15][1] = wait;

        wait = cube[17][1];
        cube[17][1] = cube[15][1];
        cube[15][1] = cube[16][0];
        cube[16][0] = wait;

        //ON TOURNE LES ARETES VERS LE COTE
        wait = cube[13][1];

        cube[13][1] = cube[12][1];
        cube[12][1] = wait;

        wait = cube[14][1];
        cube[14][1] = cube[12][1];
        cube[12][1] = cube[11][1];
        cube[11][1] = wait;

    }


}

void mouv_F()
{
    if(no_mouv == 0) add_solve_mouv('f');

    color wait, wait2;

    if(gamemode == 0)
    {
        //ON TOURNE LA FACE DU HAUT
        wait = cube[3][1];

        cube[3][1] = cube[3][0];
        cube[3][0] = wait;

        wait = cube[7][1];
        cube[7][1] = cube[3][0];
        cube[3][0] = cube[7][0];
        cube[7][0] = wait;

        //ON TOURNE LES COTES
        wait  = cube[4][0];
        wait2 = cube[8][0];
        cube[4][0] = cube[1][0];
        cube[8][0] = cube[1][1];
        cube[1][0] = cube[10][1];
        cube[1][1] = cube[10][0];
        cube[10][0] = wait2;
        cube[10][1] = wait;

        wait  = cube[2][1];
        wait2 = cube[6][1];
        cube[6][1] = cube[1][0];
        cube[2][1] = cube[1][1];
        cube[1][0] = wait2;
        cube[1][1] = wait;
    }
    else if(gamemode == 1)
    {

        //ON TOURNE LA FACE DU HAUT
        wait = cube[4][2];

        cube[4][2] = cube[4][0];
        cube[4][0] = wait;

        wait = cube[12][2];
        cube[12][2] = cube[4][0];
        cube[4][0] = cube[12][0];
        cube[12][0] = wait;

        //ON TOURNE LES COTES
        wait  = cube[5][0];
        wait2 = cube[13][0];
        cube[5][0] = cube[2][0];
        cube[13][0] = cube[2][2];
        cube[2][0] = cube[15][2];
        cube[2][2] = cube[15][0];
        cube[15][0] = wait2;
        cube[15][2] = wait;

        wait  = cube[3][2];
        wait2 = cube[11][2];
        cube[11][2] = cube[2][0];
        cube[3][2] = cube[2][2];
        cube[2][0] = wait2;
        cube[2][2] = wait;

        //ON TOURNE LES ARETES DU HAUT
        wait = cube[8][2];

        cube[8][2] = cube[4][1];
        cube[4][1] = wait;

        wait = cube[12][1];
        cube[12][1] = cube[4][1];
        cube[4][1] = cube[8][0];
        cube[8][0] = wait;

        //ON TOURNE LES ARETES SUR LE COTE
        wait = cube[9][0];

        cube[9][0] = cube[2][1];
        cube[2][1] = wait;

        wait = cube[15][1];
        cube[15][1] = cube[2][1];
        cube[2][1] = cube[7][2];
        cube[7][2] = wait;



    }

}

void mouv_R()
{
    if(no_mouv == 0) add_solve_mouv('r');

    no_mouv = 1;

    if(gamemode == 0)
    {
        mouv_U();
        for(int i=0;i<3;i++) mouv_D();
        mouv_F();
        for(int i=0;i<3;i++) mouv_U();
        mouv_D();
    }
    else if(gamemode  == 1)
    {
        mouv_U();
        mouv_E();
        for(int i=0;i<3;i++) mouv_D();
        mouv_F();
        for(int i=0;i<3;i++) mouv_U();
        for(int i=0;i<3;i++) mouv_E();
        mouv_D();
    }

    no_mouv = 0;
}

void mouv_L()
{
    if(no_mouv == 0) add_solve_mouv('l');

    no_mouv = 1;

    if(gamemode == 0)
    {
        mouv_D();
        for(int i=0;i<3;i++) mouv_U();
        mouv_F();
        for(int i=0;i<3;i++) mouv_D();
        mouv_U();
    }
    else if(gamemode  == 1)
    {
        mouv_D();
        for(int i=0;i<3;i++) mouv_E();
        for(int i=0;i<3;i++) mouv_U();
        mouv_F();
        for(int i=0;i<3;i++) mouv_D();
        mouv_E();
        mouv_U();
    }

    no_mouv = 0;
}

void mouv_B()
{
    if(no_mouv == 0) add_solve_mouv('b');

    no_mouv = 1;

    if(gamemode == 0)
    {
        for(int i=0;i<2;i++) mouv_U();
        for(int i=0;i<2;i++) mouv_D();
        mouv_F();
        for(int i=0;i<2;i++) mouv_U();
        for(int i=0;i<2;i++) mouv_D();
    }
    else if(gamemode  == 1)
    {
        for(int i=0;i<2;i++) mouv_U();
        for(int i=0;i<2;i++) mouv_E();
        for(int i=0;i<2;i++) mouv_D();
        mouv_F();
        for(int i=0;i<2;i++) mouv_U();
        for(int i=0;i<2;i++) mouv_E();
        for(int i=0;i<2;i++) mouv_D();
    }

    no_mouv = 0;
}

void mouv_E()
{

    if(gamemode == 1)
    {

        int wait = 0;

        if(no_mouv == 0) add_solve_mouv('e');

        for(int i=0;i<3;i++)
        {

            // ON TOURNE LES ARÊTES SUR LE COTE
            wait = cube[8][2];

            cube[8][2] = cube[7][2];
            cube[7][2] = wait;

            wait = cube[9][2];
            cube[9][2] = cube[7][2];
            cube[7][2] = cube[10][2];
            cube[10][2] = wait;

            // ON TOURNE LES ARÊTES SUR LE COTE
            wait = cube[9][0];

            cube[9][0] = cube[8][0];
            cube[8][0] = wait;

            wait = cube[10][0];
            cube[10][0] = cube[8][0];
            cube[8][0] = cube[7][0];
            cube[7][0] = wait;

            // ON TOURNE LES MILIEUX
            wait = cube[8][1];

            cube[8][1] = cube[7][1];
            cube[7][1] = wait;

            wait = cube[9][1];
            cube[9][1] = cube[7][1];
            cube[7][1] = cube[10][1];
            cube[10][1] = wait;

        }

    }

}

void mouv_M()
{

    if(gamemode == 1)
    {

        int wait = 0;

        if(no_mouv == 0) add_solve_mouv('m');

        for(int i=0;i<3;i++)
        {

            // ON TOURNE LES ARÊTES SUR LE COTE
            wait = cube[12][1];

            cube[12][1] = cube[17][1];
            cube[17][1] = wait;

            wait = cube[2][1];
            cube[2][1] = cube[17][1];
            cube[17][1] = cube[6][1];
            cube[6][1] = wait;

            // ON TOURNE LES ARÊTES SUR LE COTE
            wait = cube[4][1];

            cube[4][1] = cube[15][1];
            cube[15][1] = wait;

            wait = cube[0][1];
            cube[0][1] = cube[15][1];
            cube[15][1] = cube[14][1];
            cube[14][1] = wait;

            // ON TOURNE LES MILIEUX
            wait = cube[8][1];

            cube[8][1] = cube[16][1];
            cube[16][1] = wait;

            wait = cube[1][1];
            cube[1][1] = cube[16][1];
            cube[16][1] = cube[10][1];
            cube[10][1] = wait;

        }

    }

}

void add_solve_mouv(char lettre)
{

    switch(lettre)
    {
    case 'u':
        solution[position] = 'U';
        break;
    case 'r':
        solution[position] = 'R';
        break;
    case 'l':
        solution[position] = 'L';
        break;
    case 'f':
        solution[position] = 'F';
        break;
    case 'b':
        solution[position] = 'B';
        break;
    case 'd':
        solution[position] = 'D';
        break;
    case 'U':
        break;
    case 'A':
        solution[position] = 'A';
        break;
    case 'L':
        break;
    case 'F':
        break;
    case 'B':
        break;
    case 'D':
        break;
    default:
        break;
    }

    position++;

}

/*void reverse(void (*pf)(int (*)[W]))
{
    for(int i=0;i<2;i++)
    {
        no_mouv = 1;
        pf(cube);
    }
    no_mouv = 0;
    pf(cube);
    position--;
    solution[position] -=  'A' - 'a';
    position++;
}*/


void scramble(int nombreMax)
{
    int alea = 0;
    char choix = 0;
    String melange[];
    melange = new String[nombreMax];
    reset_cube();

    for(int i=0;i<nombreMax;i++)
    {
        alea = (round(random(6)) % nombreMax + 1);

            switch(alea)
            {
            case 1:
                mouv_F();
                choix = 'F';
                break;
            case 2:
                mouv_U();
                choix = 'U';
                break;
            case 3:
                mouv_R();
                choix = 'R';
                break;
            case 4:
                mouv_L();
                choix = 'L';
                break;
            case 5:
                mouv_D();
                choix = 'D';
                break;
            case 6:
                mouv_B();
                choix = 'B';
                break;
            }
      melange[i] = Character.toString(choix);
    }

    for(int i=0;i<1000;i++)
    {
        solution[i] = 0;
    }

    position = 0;


        print("\nScramble : ");
        for(int i = 0;i<nombreMax;i++) print(melange[i]+" ");
}

void reset_cube()
{

    if(gamemode == 0)
    {

        for(int j=0;j<2;j++)
        {
            for(int i=0;i<2;i++)
            {
                cube[j][i] = c[0];
            }
        }

        for(int i=0;i<2;i++)
        {
            cube[2][i] = c[1];
            cube[6][i] = c[1];
            cube[3][i] = c[2];
            cube[7][i] = c[2];
            cube[4][i] = c[3];
            cube[8][i] = c[3];
            cube[5][i] = c[4];
            cube[9][i] = c[4];
        }

        for(int j=10;j<12;j++)
        {
            for(int i=0;i<2;i++)
            {
                cube[j][i] = c[5];
            }
        }

    }
    else if(gamemode == 1)
    {

        for(int j=0;j<3;j++)
        {
            for(int i=0;i<3;i++)
            {
                cube[j][i] = c[0];
            }
        }

        for(int i=0;i<3;i++)
        {
            cube[3][i] = c[1];
            cube[7][i] = c[1];
            cube[11][i] = c[1];
            cube[4][i] = c[2];
            cube[8][i] = c[2];
            cube[12][i] = c[2];
            cube[5][i] = c[3];
            cube[9][i] = c[3];
            cube[13][i] = c[3];
            cube[6][i] = c[4];
            cube[10][i] = c[4];
            cube[14][i] = c[4];
        }

        for(int j=15;j<18;j++)
        {
            for(int i=0;i<3;i++)
            {
                cube[j][i] = c[5];
            }
        }

    }


    for(int i=0;i<1000;i++)
    {
        solution[i] = 0;
    }

}

void reverse(char mouv)
{

  switch(mouv)
  {
    case 'U':
      for(int i=0;i<3;i++) mouv_U();
      println("U'");
      break;
    case 'D':
      for(int i=0;i<3;i++) mouv_D();
      println("D'");
      break;
    case 'R':
      for(int i=0;i<3;i++) mouv_R();
      println("R'");
      break;
    case 'L':
      for(int i=0;i<3;i++) mouv_L();
      println("L'");
      break;
    case 'F':
      for(int i=0;i<3;i++) mouv_F();
      println("F'");
      break;
    case 'B':
      for(int i=0;i<3;i++) mouv_B();
      println("B'");
      break;
    case 'E':
      for(int i=0;i<3;i++) mouv_E();
      println("E'");
      break;
    case 'M':
      for(int i=0;i<3;i++) mouv_M();
      println("M'");
      break;
  }
  
}
