# einsteins-riddle
Naive Prolog implementation of a solution to Einstein's Riddle.
( [https://udel.edu/~os/riddle.html](https://udel.edu/~os/riddle.html) )
## Running the model
(I used GNU Prolog 1.4.4)
With Prolog running in the directory with einstein-riddle.pl:
```
consult('einstein-riddle.pl').
solve_riddle(HouseMap, FishOwnersNationality).
```
Prolog will then provide you with HouseMap (which contains all 5 items for all 5 houses) and FishOwnerNationality (the answer to the riddle).
