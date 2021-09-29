*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${input_primeiroNome}   //input[@ng-model="FirstName"]
${input_ultimoNome}     //input[@ng-model="LastName"]
${textarea_endereco}    //textarea[@ng-model="Adress"]
${input_email}      //input[@ng-model="EmailAdress"]
${input_telefone}   //input[@ng-model="Phone"]
${input_genero}     //input[@value="FeMale"]
${input_hobbie2}    //input[@id="checkbox2"]
${input_hobbie3}    //input[@id="checkbox3"]
${div_lingua}       //div[@id="msdd"]
${div_lingua1}      //a[contains(text(),"Portuguese")]
${div_lingua2}      //a[contains(text(),"Italian")]
${select_skills}    //select[@id="Skills"]
${select_country}   //select[@id="countries"]
${select_selecionarPais}      //select[@id="country"]
${select_anoAniversario}    //select[@id="yearbox"]
${select_mesAniversario}    //select[@ng-model="monthbox"]
${select_diaAniversario}    //select[@id="daybox"]
${input_senha}      //input[@id="firstpassword"]
${input_confirmarSenha}     //input[@id="secondpassword"]
${input_foto}   //input[@id="imagesrc"]
${botao_salvar}     //button[@id="submitbtn"]
${botao_limpar}     //button[@id="Button1"]

${FILE}     D:\\Thalina\\Documents\\Estudos\\Robot\\eye.png

*** Keywords ***
Dado que eu acesse o Automation Demo Site
    Open Browser   http://demo.automationtesting.in/Register.html       googlechrome

Quando eu preencho os dados pessoais
    Wait Until Element Is Visible   ${input_primeiroNome}         
    Input Text      ${input_primeiroNome}       Natália
    Wait Until Element Is Visible   ${input_ultimoNome}    
    Input Text      ${input_ultimoNome}     Bernardes       
    Wait Until Element Is Visible       ${input_email}  
    Input Text      ${input_email}      nnatalianairbernardes@morada.com.br
    Wait Until Element Is Visible       ${input_telefone}   
    Input Text      ${input_telefone}   8527986710
    Click Element       ${div_lingua}
    Sleep       2s
    Click Element       ${div_lingua1}
    Sleep       2s
    Click Element       ${div_lingua}
    Sleep       2s       
    Click Element       ${div_lingua2}
    Sleep       2s
    Wait Until Element Is Visible       ${select_skills}
    Select From List By Value     ${select_skills}    APIs     
    Wait Until Element Is Visible       ${input_hobbie2}
    Select Checkbox     ${input_hobbie2}  
    Wait Until Element Is Visible       ${input_hobbie3}
    Select Checkbox     ${input_hobbie3}
    Wait Until Element Is Visible       ${select_anoAniversario}   
    Select From List By Value   ${select_anoAniversario}    1952
    Wait Until Element Is Visible       ${select_mesAniversario}
    Select From List By Value   ${select_mesAniversario}    January
    Wait Until Element Is Visible       ${select_diaAniversario}
    Select From List By Value   ${select_diaAniversario}    16
    Wait Until Element Is Visible       ${input_genero}
    Click Element       ${input_genero}           

E os dados de endereço
    Wait Until Element Is Visible   ${textarea_endereco}     
    Input Text      ${textarea_endereco}        Rua C, 483, Araturi, Caucaia - CE 
    Wait Until Element Is Visible   ${select_selecionarPais}    
    Select From List By Value     ${select_selecionarPais}      India    

E envio o arquivo de foto
    Wait Until Element Is Visible   ${input_foto}   
    Choose File     ${input_foto}       ${FILE}            

E preencho os dados de senha
    Wait Until Element Is Visible       ${input_senha}     
    Input Password      ${input_senha}      Un(P3p-M        
    Wait Until Element Is Visible       ${input_confirmarSenha}     
    Input Password      ${input_confirmarSenha}      Un(P3p-M  

E clico no botão salvar
    Wait Until Element Is Visible       ${botao_salvar}  
    Click Button    ${botao_salvar}

Então eu me cadastro
    Wait Until Element Is Visible       ${select_country}   
    Element Should Not Be Visible       ${select_country}       

*** Test Cases ***
Cenário 1: Cadastro
    Dado que eu acesse o Automation Demo Site
    Quando eu preencho os dados pessoais
    E os dados de endereço
    E envio o arquivo de foto
    E preencho os dados de senha
    E clico no botão salvar
    Então eu me cadastro