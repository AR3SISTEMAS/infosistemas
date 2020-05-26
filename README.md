# infosistemas
Teste Candidato - Ramon Medeiros Guimaraes

<br><b>Prezado Avaliador!</b><br>

Alguns pequenos esclarecimentos sobre a atividade proposta.

Ainda que seja um projeto pequeno, criei um Framework, denominado "_framework". 

A estrutura é a seguinte:

_framework 
	- images = Imagens usadas no sistema
	- rules = Regras de negócio para o framework
		- udmUI = Classe com regras aplicadas diretamente nas telas como exemplo controle de entrada de dados, como: máscaras de 
		  entrada e controle de digitação. Foi usado um dataModule ao invés de uma unit "pura", pois, normalmente uso uma TImageList, mais precisamente, TcxImageList(DevExpress).		
		- uEmail = Classe para envio do e-mail
		- uEndereco = Classe para obter o endereço na via CEP via JSON
		- uUtils = Conjunto de Classes de uso geral, como exemplo, mensagens, validação e comunicação com Sistema Operacional. *** Em um projeto maior dividiria estas classes em arquivos "mais especializados ao assunto" ***
	- templates = Modelos comuns de relatórios, formulários entre outros.
		- forms = Modelos de formulários
			- ufrmCadModelo = Modelo de formulário padrão (apenas para o teste), foi usado um formulário padrão desconectado, todavia com
			  botões "Novo", "Gravar" e "Cancelar", para facilitar o entendimento do usuários	 
O projeto segue na raiz
	- forms
		- ufrmCadCliente = Cadastro do cliente, única tela visível do projeto
	- rules
		- uClientes = Classe do cliente, com os métodos de geração do XML e Envio do E-mail
	- Win32
		- Executável do sistema = TST_INFOSISTEMAS.exe Compilei apenas para 32 bits


Observações
	- Versão do Delphi 10.2 Tokyo
	- Utilizei VCL e somente controles nativos do Delphi
	- Normalmente uso DevExpress para UI e Framework próprio para desenvolvimento
	- Utilizada as melhores práticas
		- De código, de acordo com o Object Pascal Style Guide https://edn.embarcadero.com/article/10280
		- De desenvolvimento de código, com uso de orintado a objetos ainda que para uma função.
	- O estilo de formulário usei um bem comum, porém, com Skin do Windows 10, para não mudar de um computador para o outro. 
        Eu uso, https://www.devexpress.com/products/vcl/ incluindo o controle de grades para layout mais responsivo.


Muito Obrigado!
