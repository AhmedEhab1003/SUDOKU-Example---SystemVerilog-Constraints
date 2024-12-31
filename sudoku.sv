module sudoku;

  class sudoku_solver;
    rand bit [3:0] matrix [9][9];

    constraint value_limit {
      foreach (matrix [i])           // loop on rows
        foreach (matrix [,j]){         // loop on columns
          matrix [i][j] < 10;
          matrix [i][j] > 0;}}         // value range [1:9]


          constraint no_rep_row {     // avoid repetion per row
            foreach (matrix [i])
              unique {matrix [i]};}

          constraint no_rep_column {   // avoid repetion per column
            foreach (matrix [,j])
              unique {matrix [0][j],matrix [1][j],matrix [2][j],
                      matrix [3][j],matrix [4][j],matrix [5][j],
                      matrix [6][j],matrix [7][j],matrix [8][j]};}

          constraint no_rep_square {
            unique  {matrix [0][0],matrix [0][1],matrix [0][2],
                     matrix [1][0],matrix [1][1],matrix [1][2],
                     matrix [2][0],matrix [2][1],matrix [2][2]};

            unique  {matrix [0][3],matrix [0][4],matrix [0][5],
                     matrix [1][3],matrix [1][4],matrix [1][5],
                     matrix [2][3],matrix [2][4],matrix [2][5]};

            unique  {matrix [0][6],matrix [0][7],matrix [0][8],
                     matrix [1][6],matrix [1][7],matrix [1][8],
                     matrix [2][6],matrix [2][7],matrix [2][8]};

            unique  {matrix [3][0],matrix [3][1],matrix [3][2],
                     matrix [4][0],matrix [4][1],matrix [4][2],
                     matrix [5][0],matrix [5][1],matrix [5][2]};

            unique  {matrix [3][3],matrix [3][4],matrix [3][5],
                     matrix [4][3],matrix [4][4],matrix [4][5],
                     matrix [5][3],matrix [5][4],matrix [5][5]};

            unique  {matrix [3][6],matrix [3][7],matrix [3][8],
                     matrix [4][6],matrix [4][7],matrix [4][8],
                     matrix [5][6],matrix [5][7],matrix [5][8]};

            unique  {matrix [6][0],matrix [6][1],matrix [6][2],
                     matrix [7][0],matrix [7][1],matrix [7][2],
                     matrix [8][0],matrix [8][1],matrix [8][2]};

            unique  {matrix [6][3],matrix [6][4],matrix [6][5],
                     matrix [7][3],matrix [7][4],matrix [7][5],
                     matrix [8][3],matrix [8][4],matrix [8][5]};

            unique  {matrix [6][6],matrix [6][7],matrix [6][8],
                     matrix [7][6],matrix [7][7],matrix [7][8],
                     matrix [8][6],matrix [8][7],matrix [8][8]};}


          function void display();
      $display (" _____________________________");
      foreach (matrix [i]) begin
        $write ("|");
        foreach (matrix[,j]) begin
          $write (" %0d ",matrix[i][j]);
          if ((j+1)%3 == 0) $write ("|");
        end
        $display ("");
        if ((i+1)%3 == 0)  $display ("|_____________________________|");

      end
      endfunction

      endclass

      class puzzle extends sudoku_solver;

        constraint givens {
          matrix [0][1] == 7;
          matrix [1][1] == 1;
          matrix [2][2] == 8;

          matrix [1][3] == 2;
          matrix [2][5] == 4;

          matrix [0][6] == 5;
          matrix [1][6] == 9;
          matrix [1][7] == 3;

          matrix [5][0] == 6;
          matrix [5][1] == 8;

          matrix [3][4] == 5;
          matrix [4][5] == 7;
          matrix [5][5] == 1;

          matrix [4][6] == 4;
          matrix [4][8] == 3;
          matrix [5][8] == 7;

          matrix [7][0] == 1;
          matrix [7][1] == 9;

          matrix [6][4] == 8;
          matrix [6][5] == 2;
          matrix [8][3] == 7;

          matrix [6][6] == 1;
          matrix [7][8] == 6;
          matrix [8][8] == 5;

        }

      endclass


      class start_game;
        bit [3:0] matrix [9][9];

        function new;
          matrix [0][1] = 7;
          matrix [1][1] = 1;
          matrix [2][2] = 8;

          matrix [1][3] = 2;
          matrix [2][5] = 4;

          matrix [0][6] = 5;
          matrix [1][6] = 9;
          matrix [1][7] = 3;

          matrix [5][0] = 6;
          matrix [5][1] = 8;

          matrix [3][4] = 5;
          matrix [4][5] = 7;
          matrix [5][5] = 1;

          matrix [4][6] = 4;
          matrix [4][8] = 3;
          matrix [5][8] = 7;

          matrix [7][0] = 1;
          matrix [7][1] = 9;

          matrix [6][4] = 8;
          matrix [6][5] = 2;
          matrix [8][3] = 7;

          matrix [6][6] = 1;
          matrix [7][8] = 6;
          matrix [8][8] = 5;
        endfunction

        function void display();
          $display (" _____________________________");
          foreach (matrix [i]) begin
            $write ("|");
            foreach (matrix[,j]) begin
              if(matrix[i][j]== 0)
                $write ("   ");
              else
                $write (" %0d ",matrix[i][j]);
              if ((j+1)%3 == 0) $write ("|");
            end
            $display ("");
            if ((i+1)%3 == 0)  $display ("|_____________________________|");
          end
        endfunction


      endclass



      start_game g1;
      puzzle game1;

      initial begin 
        g1 = new;
        game1 = new ();
        g1.display;


        game1.randomize();
        game1.display;
      end

      endmodule