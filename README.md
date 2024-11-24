# Controle de Instrumentos Cirurgicos

# Descricao
Implementar uma verificação pós-operatória rigorosa e organizar com precisão os instrumentos antes de cada cirurgia. Isso reduzirá o desperdício de recursos, evitará perdas e garantirá que apenas os instrumentos realmente necessários sejam enviados para a cirurgia.

# Funcionalidades


# Como Usar
## Para ultilizar o banco de dados

# Tecnologias ultilizadas 
-Linguagens

# Estrutura do Projeto
## Modelo ER
![ModeloSla](https://github.com/AugustoAMorais/Hacaton2024/blob/main/Diagrama%20de%20Classes%20PDF.pdf)
## Banco De Dados
-O banco de dados esta dividido nas seguintes pastas:
### Ferramenta:
Esta tabela inclui: Id_ferramentas referente a id num sistema para todas as ferramentas. Tipo_de_ferramenta a qual mostra qual o tipo de ferramenta naquela linha, e tambem tem as chaves estrangeiras id_tesoura, id_afastador e id_pinca a quais são referentes as suas devidas tabelas.
### Kit
Esta tabela apresenta uma ID: Id_Kit, um nome nome_kit referente ao nome popular do kit, Sala_cirurgia que indica em qual sala sera usado o kit, e um data_hora_envio que mostra o dia/horario que o kit foi enviado.
### Ferramentas_Kit
Essa Tabela apresenta duas chaves estrangeiras: id_kit e id_ferramenta que referenciam o kit e as ferramentas inclusas nele, de forma a facilitar a busca por quais ferramentas estão inclusas no kit, e tambem um totalFerramentas que indica quantas daquela ferramenta aparecem naquele kit.
### Pincas
Essa Tabela apresenta uma id ID_pinca para facilitar a busca entre outras pincas tambem como outras informações como o seu tamanho: tamanho_pinca, o seu tipo: tipo_pinca, a quantidade em estoque: qtde_pincas, e outra coluna referente ao seu tipo: tipo.
### Tesoura
Essa Tabela apresenta uma id ID_tesoura para facilitar a busca entre outras pincas tambem como outras informações como o seu tipo: tipo_tesoura, e seu nome: Nome_tesoura.
### Afastador
Essa Tabela apresenta uma id ID_afastador para facilitar a busca entre outros afastadores tambem como outras informações como o seu tamanho: tamanho_afastador, o seu tipo: tipo_afastador, a quantidade em estoque: qtde_afastador, e outra coluna referente ao seu modelo: modelo.
### Usuarios
Essa tabela apresenta os dados de login dos usuarios registrados, como seu nome: nome, uma id: id_usuario, seu cpf:CPF, informações referentes ao tipo de conta: tipo_usuario e tambem a senha que ele usa para login:senha.   
### Kit_status_cirurgico e Kit_status_cme
Ambas tabelas tem uso similar, sendo a diferença que o cirurgico ocorre no pré/pos cirurgico, enquanto o cme é na base do cme, elas incluem: id, tres chaves estrangeira: id_kit id_usuario e id_ferramenta e tambem duas outras, respectivamente uma timestamp: data_hora_status, e tambem o status: status, ambas possuem tambem um espaço para obsevações no qual é destinado a falar sobre possiveis peças faltantes.
