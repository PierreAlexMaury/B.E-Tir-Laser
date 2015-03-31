# B.E-Tir-Laser

Travail réalisé à l'INSA de Toulouse en binôme, encadré par Thierry Rocacher.

Nous avons travaillés avec un matériel varié comme des pistolets lasers émettants sous différentes fréquences pour 
différencier les utilisateurs, une photodiode, un carte STM32. Nous avons réalisé le programme assembleur détectant 
un tir sur la photodiode et de jouer un son.

La notion de Transformée de Fourrier a été employée pour connaitre la différence entre les pistolets et donc jouer 
un son différent en conséquence.

Il fallait adapter le signal produit par la photodiode à l'entrée de la carte STM32. 
Nous avons donc construit en amont de cette carte un circuit électronique capable 
de filtrer le signal et de l'adapter à l'entrée de la carte.
