# infosistemas
Teste Candidato - Ramon Medeiros Guimaraes

<br><b>Prezado Avaliador!</b><br>

Alguns pequenos esclarecimentos sobre a atividade proposta.

Ainda que seja um projeto pequeno, criei um Framework, denominado <b>"_framework".</b><br>

A estrutura é a seguinte:<br><br>

_framework <br>
	- images = Imagens usadas no sistema<br>
	- rules = Regras de negócio para o framework<br>
		- udmUI = Classe com regras aplicadas diretamente nas telas como exemplo controle de entrada de dados, como: máscaras de 
		  entrada e controle de digitação. Foi usado um dataModule ao invés de uma unit "pura", pois, normalmente uso uma TImageList, mais precisamente, TcxImageList(DevExpress).<br>		
		- uEmail = Classe para envio do e-mail<br>
		- uEndereco = Classe para obter o endereço na via CEP via JSON<br>
		- uUtils = Conjunto de Classes de uso geral, como exemplo, mensagens, validação e comunicação com Sistema Operacional. *** Em um projeto maior dividiria estas classes em arquivos "mais especializados ao assunto" <br>
	- templates = Modelos comuns de relatórios, formulários entre outros.<br>
		- forms = Modelos de formulários<br>
			- ufrmCadModelo = Modelo de formulário padrão (apenas para o teste), foi usado um formulário padrão desconectado, todavia com botões "Novo", "Gravar" e "Cancelar", para facilitar o entendimento do usuários<br><br>	 
			
O projeto segue na raiz<br>
	- forms<br>
		- ufrmCadCliente = Cadastro do cliente, única tela visível do projeto<br>
	- rules<br>
		- uClientes = Classe do cliente, com os métodos de geração do XML e Envio do E-mail<br>
	- Win32<br>
		- Executável do sistema = TST_INFOSISTEMAS.exe Compilei apenas para 32 bits<br><br>

Observações<br>
	- Versão do Delphi 10.2 Tokyo<br>
	- Utilizei VCL e somente controles nativos do Delphi<br>
	- Normalmente uso DevExpress para UI e Framework próprio para desenvolvimento<br>
	- Utilizada as melhores práticas<br>
		- De código, de acordo com o Object Pascal Style Guide https://edn.embarcadero.com/article/10280<br>
		- De desenvolvimento de código, com uso de orintado a objetos ainda que para uma função.<br>
	- O estilo de formulário usei um bem comum, porém, com Skin do Windows 10, para não mudar de um computador para o outro.
        Eu uso, https://www.devexpress.com/products/vcl/ incluindo o controle de grades para layout mais responsivo.

<br><br>
<b>Muito Obrigado!</b>
