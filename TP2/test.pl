aime(paulo,X) :- mama_burger(X),!,fail.
aime(paulo,X) :- hamburger(X).
hamburger(X) :- big_mac(X).
hamburger(X) :- mama_burger(X).
hamburger(X) :- whopper(X).





big_mac(a).
mama_burger(b).
big_mac(c).
whopper(d).