% solving the einstein riddle with prolog
% riddle url: https://udel.edu/~os/riddle.html
% ask prolog to unify the solve_riddle predicate to get the answer
% (e.g. asking prolog solve_riddle(HouseMap, OwnerOfFish)

% helper functions:
left_of(HouseNumA, HouseNumB) :- HouseNumA is HouseNumB-1.
next_to(HouseNumA, HouseNumB) :- left_of(HouseNumA, HouseNumB) ; left_of(HouseNumB, HouseNumA).

solve_riddle(HouseMap, FishOwnersNationality) :-
	% use 5-element list to specify 5 houses:
    HouseMap = [
		house(1, Color1, Nationality1, Beverage1, Cigar1, Pet1),
		house(2, Color2, Nationality2, Beverage2, Cigar2, Pet2),
		house(3, Color3, Nationality3, Beverage3, Cigar3, Pet3),
		house(4, Color4, Nationality4, Beverage4, Cigar4, Pet4),
		house(5, Color5, Nationality5, Beverage5, Cigar5, Pet5)],

	% the brit lives in the red house:
	member( house(_, red, brit, _, _, _), HouseMap),

	% the swede keeps dogs as pets:
	member( house(_, _, swede, _, _, dogs), HouseMap),

	% the dane drinks tea:
	member( house(_, _, dane, tea, _, _), HouseMap),
	
	% the green house is on the left of the white house:
	member( house(G1, green, _, _, _, _), HouseMap),
	member( house(W1, white, _, _, _, _), HouseMap),
	left_of(G1, W1),

	% the green houses owner drinks coffee:
	member( house(_, green, _, coffee, _, _), HouseMap),

	% the person who smokes Pall Mall rears birds:
	member( house(_, _, _, _, pallmall, birds), HouseMap),

	% the owner of the yellow house smokes dunhill:
	member( house(_, yellow, _, _, dunhill, _), HouseMap),

	% the man living in the center house drinks milk:
	member( house(3, _, _, milk, _, _), HouseMap),

	% the norwegian lives in the first house:
	member( house(1, _, norwegian, _, _, _), HouseMap),
	
	% the man who smokes blends lives next to the one who keeps cats:
	member( house(B, _, _, _, blends, _), HouseMap), 
	member( house(C, _, _, _, _, cats), HouseMap),
	next_to(B, C),

	% the man who keeps horses lives next to the man who smokes dunhill:
	member( house(H, _, _, _, _, horses), HouseMap), 
	member( house(D, _, _, _, dunhill, _), HouseMap),
	next_to(H, D),

	% the owner who smokes bluemaster drinks beer:
	member( house(_, _, _, beer, bluemaster, _), HouseMap),

	% the german smokes prince:
	member( house(_, _, german, _, prince, _), HouseMap),

	% the norwegian lives next to the blue house:
	member( house(N, _, norwegian, _, _, _), HouseMap),
	member( house(B2, blue, _, _, _, _), HouseMap),
	next_to(N, B2),

	% the man who smokes blends has a neighbor who drinks water:
	member( house(B3, _, _, _, blends, _), HouseMap),
	member( house(W, _, _, water, _, _), HouseMap),
	next_to(B3, W),

	% someone owns a fish:
	member( house(_, _, FishOwnersNationality, _, _, fish), HouseMap).	

