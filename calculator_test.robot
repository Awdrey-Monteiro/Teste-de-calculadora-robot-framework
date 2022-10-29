*** Settings ***
Documentation  Automatizar o teste das quatro operações disponíveis 
...            calculadora de testes
Library  SeleniumLibrary
Library  Collections
Test Teardown  Close All Browsers

*** Variables ***
${URL}            https://testpages.herokuapp.com/styled/calculator
${BROWSER}        chrome

*** Keywords ***
Abrir Navegador e maximizar
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window

Selecionar ${QUAL}
    ${LISTA}  Get List Items       id=function
    ${ID}     Get Index From List  ${LISTA}     ${QUAL}
    Select From List By Label      id=function  ${LISTA[${ID}]}

*** Test Cases ***
Cenário: Teste de Adição
    Abrir Navegador e maximizar
    Input Text                  id=number1  text=2
    Selecionar plus
    Input Text                  id=number2  text=2
    Click Button                id=calculate
    Wait Until Page Contains    Answer : 4

Cenário: Teste de Subtração
    Abrir Navegador e maximizar
    Input Text                  id=number1  text=5
    Selecionar minus
    Input Text                  id=number2  text=3
    Click Button                id=calculate
    Wait Until Page Contains    Answer : 2

Cenário: Teste de Multiplicação
    Abrir Navegador e maximizar
    Input Text                  id=number1  text=4
    Selecionar times
    Input Text                  id=number2  text=1
    Click Button                id=calculate
    Wait Until Page Contains    Answer : 4

Cenário: Teste de Divisão
    Abrir Navegador e maximizar
    Input Text                  id=number1  text=8
    Selecionar divide
    Input Text                  id=number2  text=2
    Click Button                id=calculate
    Wait Until Page Contains    Answer : 4


Cenário: Teste de Soma com numero Randomico
    Abrir Navegador e maximizar
${NUM}                          Evaluate    random.sample(range(1, 11), 2)    random
    ${SOMA}                     Evaluate    ${NUM}[0]+${NUM}[1]
    Input Text                  id=number1  text=${NUM}[0]
    Selecionar plus
    Input Text                  id=number2  text=${NUM}[1]
    Click Button                id=calculate
    Wait Until Page Contains    Answer : ${SOMA}