# GameOfLife_Methuselahs

In Conway's Game of Life there are cellular automaton structures called methuselahs, which are simple pentomino block arrangements that seed intricate and long-lived structures. Methuselahs are self-contained examples of how complex structures can arise from very simple initial rules.

My take on the study of Game of Life methuselahs involves the addition of a logarithmic colormap to track their path or fingerprint of spread. Colormap intensity is a proxy for the age of a given cellular automaton at that particular location. The GIF version of the code is the same as the base visualization, but saves a `.gif` file (examples shown below). Array conversion into vectors allows for calculations of the minimum and maximum horizontal and vertical limits, so the camera is always focused on the action.

### rPentomino

The first example is the R-Pentomino, the first methuselah discovered, and the structure that gave rise to the first observed Glider.

<img src="https://raw.githubusercontent.com/dirediredock/GameOfLife_Methuselahs/main/Images/rPentomino.png" width="100%">
<img src="https://raw.githubusercontent.com/dirediredock/GameOfLife_Methuselahs/main/Images/ThePentominoMethuselahSmall.gif" width="100%">

### Glider

The second example is the now well-known Glider, which is a simple spaceship-like pentomino that, once constructed, travels outwards diagonally towards infinity.

<img src="https://raw.githubusercontent.com/dirediredock/GameOfLife_Methuselahs/main/Images/Glider.png" width="100%">
<img src="https://raw.githubusercontent.com/dirediredock/GameOfLife_Methuselahs/main/Images/TheGliderMethuselah.gif" width="100%">

### Acorn

The third example is the Acorn methuselah, which is remarkably long-lived and generates many gliders despite its simple initial construction.

<img src="https://raw.githubusercontent.com/dirediredock/GameOfLife_Methuselahs/main/Images/Acorn.png" width="100%">
<img src="https://raw.githubusercontent.com/dirediredock/GameOfLife_Methuselahs/main/Images/TheAcornMethuselahSmall.gif" width="100%">

### WhiteBear

The fourth example stems out of curiosity. In the S02E02 "White Bear" episode of Black Mirror, a pentomino pattern is introduced, shown below. It is not a methuselah, but surprisingly it does generate a symmetric automaton pattern.

<img src="https://raw.githubusercontent.com/dirediredock/GameOfLife_Methuselahs/main/Images/WhiteBear.png" width="100%">
<img src="https://raw.githubusercontent.com/dirediredock/GameOfLife_Methuselahs/main/Images/TheWhiteBearMethuselah.gif" width="100%">

### Bunnies

The fifth example.

<img src="https://raw.githubusercontent.com/dirediredock/GameOfLife_Methuselahs/main/Images/Bunnies.png" width="100%">
<img src="https://raw.githubusercontent.com/dirediredock/GameOfLife_Methuselahs/main/Images/TheBunniesMethuselah.gif" width="100%">


