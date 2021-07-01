# GameOfLife_Methuselahs

In Conway's Game of Life there are cellular automaton structures called methuselahs, which are simple pentomino block arrangements that seed intricate and long-lived structures. Methuselahs are self-contained examples of how complex structures can arise from very simple initial rules.

My take on the study of Game of Life methuselahs involves the addition of a logarithmic colormap to track their path or fingerprint of spread. Colormap intensity is a proxy for the age of a given cellular automaton at that particular location.

The first example is the well-known Glider, which is a simple spaceship-like pentomino that, once constructed, travels outwards diagonally towards infinity.

![alt text](https://raw.githubusercontent.com/dirediredock/GameOfLife_Methuselahs/main/Images/Glider.png)
<img src="https://raw.githubusercontent.com/dirediredock/GameOfLife_Methuselahs/main/Images/TheGliderMethuselah.gif" width="100%">

The second example is the R-Pentomino methuselah, the first discovered, and the structure that gave rise to the first observed Glider.

![alt text](https://raw.githubusercontent.com/dirediredock/GameOfLife_Methuselahs/main/Images/rPentomino.png)
<img src="https://raw.githubusercontent.com/dirediredock/GameOfLife_Methuselahs/main/Images/ThePentominoMethuselahSmall.gif" width="100%">

The third example is the Acorn methuselah, which is remarkably long-lived and generates many gliders despite its simple initial construction.

![alt text](https://raw.githubusercontent.com/dirediredock/GameOfLife_Methuselahs/main/Images/Acorn.png)
<img src="https://raw.githubusercontent.com/dirediredock/GameOfLife_Methuselahs/main/Images/TheAcornMethuselahSmall.gif" width="100%">

The fourth example stems out of curiosity. In the S02E02 "White Bear" episode of Black Mirror, a pentomino pattern is introduced, shown below. It is not a methuselah, but surprisingly it does generate a symmetric automaton pattern.

![alt text](https://raw.githubusercontent.com/dirediredock/GameOfLife_Methuselahs/main/Images/WhiteBear.png)
<img src="https://raw.githubusercontent.com/dirediredock/GameOfLife_Methuselahs/main/Images/TheWhiteBearMethuselah.gif" width="100%">
