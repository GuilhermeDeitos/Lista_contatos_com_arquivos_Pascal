program Arquivo;
uses crt;
type
	contato_rg = record
		nome:string;
		email:string;
	end;
	contato_fl = file of contato_rg;
var
	contato:contato_rg;
	contatos:contato_fl;
procedure cadastra;
begin
	//associar a variavel arquivo
	// ao nome do arquivo fisico
	assign(contatos,'contatos.dat');
	// cria o arquivo em disco
	rewrite(contatos);
	repeat
		writeln('para fechar digite fim');
		write('Nome : ');
		readln(contato.nome);
		if(contato.nome <> 'fim') then
		begin
			write('e-mail : ');
			readln(contato.email);
			write(contatos,contato);
		end;
	until contato.nome = 'fim';
	close(contatos);
end;

procedure listar;
begin
	//associar variavelao arquivo fisico
	assign(contatos,'contatos.dat');
	//abrir arquivo
	reset(contatos);
	writeln('Listagem de contatos');
	writeln('=-=-=-=-=-=-=-=-=-=-=');
	while not eof(contatos) do
	begin
		read(contatos,contato);
		writeln('Nome : ',contato.nome,'||Email: ',contato.email);
		writeln('=-=-=-=-=-=-=-=-=-=-=');
	end;
	writeln('registros : ',filesize(contatos));
	close(contatos);
end;

begin
	cadastra();
	listar();
end.
