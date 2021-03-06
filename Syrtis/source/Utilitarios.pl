
%-------------------------------%
%-------------------------------%
%-----Predicados de ajuda-------%
%-------------------------------%
%-------------------------------%


esperaPorEnter :-
	write('Press any key to continue...'), novaLinha(2),
	get_single_char(_), limpaEcra.

	
limpaEcra :- novaLinha(50), !.



tamanhoLista(Lista, Conta):-
		X = _,
        auxiliarTamanho(Lista, X),
		Conta is X.

auxiliarTamanho([],X) :-
	X = 0.
		
auxiliarTamanho([ _ | Cauda ], Conta):-
        auxiliarTamanho(Cauda,Anterior),
        Conta = Anterior + 1.
		

obtemNumeroDeTabuleiro(Escolha) :-
	Escolha1 = _,
	get_single_char(Escolha1),
	Escolha is Escolha1 - 48,
	write(Escolha), nl,
	Escolha > -1 , Escolha < 7.

obtemNumeroDeTabuleiro(Escolha) :-
	novaLinha(2),
	write('Please pick a number between 0 and 6...'),
	novaLinha(2),!, 
	obtemNumeroDeTabuleiro(Escolha).

	
obtemNumero(Escolha, LimiteBaixo, LimiteAlto) :-
	Escolha1 = _,
	get_single_char(Escolha1),
	Escolha is Escolha1 - 48,
	write(Escolha), nl,
	A is LimiteBaixo - 1,
	B is LimiteAlto + 1,
	Escolha > A , Escolha < B.

obtemNumero(Escolha, LimiteBaixo, LimiteAlto) :-
	novaLinha(2),
	write('Please pick a number between '), write(LimiteBaixo), write(' and '),
	write(LimiteAlto), write('...'),
	novaLinha(2),!, 
	obtemNumero(Escolha, LimiteBaixo, LimiteAlto).
	
tamanhoTabuleiro([H | T], XLimite, YLimite) :-
		tamanhoLista(H, XLimite),
		tamanhoLista(T, Tamanho),
		YLimite is Tamanho + 1.

	
novaLinha(Vezes) :-
	novaLinha(0, Vezes).

novaLinha(Linha, Limite) :-
	Linha < Limite,
	LinhaInc is Linha + 1,
	nl,
	novaLinha(LinhaInc, Limite).

novaLinha(_,_).