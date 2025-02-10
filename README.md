# ToDO 

To do list feita para o estudo da clean-arch 

  - PQ que a gente utiliza a arquitetura
    Flexivel 
    Testavél 
    Replicavél
    Facil Manutencao

### Camadas 
  - Data
    - reponsavel pelos dados da aplicacao 
      - dat_source - Teste Unidade
      - adapters
      - repositories - Teste unidade
  - Domain 
    - contém as regras do negocio 
    - core do negocio , não importa nada de fora 
    - quanto menos dependencias  melhor.
    - no momento que adiciona qualquer package ( casar a regra de negocio com package) , corre o risco de se acabar o package , fork e fazer a manutencao ,caso precise
      - dto
      - entity 
      - repositories 
      - use_cases - Teste unidade - TU
      - validatores 
  - External
    - Local_Storage
  - UI 
    - interface de usuario


- Todas as camadas que tem TU ( testes de unidades ) , tem inversao de dependencias , para facilitar o processo de testes
- Para testar os uses_case , a gente faz o mock do repositories , passa para o use_case e vê se o mock foi chamdao , 