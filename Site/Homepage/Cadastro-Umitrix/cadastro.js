function gerarSenha() {
    const caracteres =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+";
    let senha = "";
    const tamanhoSenha = 12; // Defina o tamanho desejado para a senha

    for (let i = 0; i < tamanhoSenha; i++) {
      const indice = Math.floor(Math.random() * caracteres.length);
      senha += caracteres[indice];
    }

    // Exibe a senha sugerida no span
    document.getElementById(
      "senhaSugerida"
    ).textContent = `Senha sugerida: ${senha}`;
}

function cadastrar() {
    const email = Email.value;
    const razaoSocial = RazaoSocial.value;
    const cnpj = CNPJ.value;
    const representante = RepresentanteLegal.value;
    const telefone = Telefone.value;
    const senha = Senha.value;
    const senhaRepetido = RepetirSenha.value;
    const cidade = Cidade.value;
    const rua = Rua.value;
    const numero = Numero.value;
    const cep = CEP.value;

    if (email.indexOf("@") == -1) {
        alert("Erro no Email: falta de @")
    } else if (email.indexOf(".com") == -1) {
        alert("Erro no Email: falta de '.com'")
    } else if (email == '') {
        alert("Erro no Email: preencha o campo")
    } else if (razaoSocial == '') {
        alert("Erro na Razão Social: preencha o campo")
    } else if (cnpj.length < 15) {
        alert("Erro no CNPJ: falta de números")
        // Ver direitinho depois  
    } else if (representante == '') {
        alert("Erro nos Representantes: preencha o campo")
    } else if (telefone.length == 12) {
        alert("Erro no Telefone: Telefone incorreto")
    } else if (senha.length < 12) {
        alert("Erro na senha: Insira mais de 12 caracteres")
    } else if (senha.indexOf("@") == -1 &&
               senha.indexOf("!") == -1 &&
               senha.indexOf("#") == -1 &&
               senha.indexOf("%") == -1 &&
               senha.indexOf("$") == -1 &&
               senha.indexOf("&") == -1 &&
               senha.indexOf("*") == -1 &&
               senha.indexOf("(") == -1 &&
               senha.indexOf(")") == -1 &&
               senha.indexOf("_") == -1 &&
               senha.indexOf("+") == -1 &&
               senha.indexOf("^") == -1 &&
               senha.indexOf("1") == -1 &&
               senha.indexOf("2") == -1 &&
               senha.indexOf("3") == -1 &&
               senha.indexOf("4") == -1 &&
               senha.indexOf("5") == -1 &&
               senha.indexOf("6") == -1 &&
               senha.indexOf("7") == -1 &&
               senha.indexOf("8") == -1 &&
               senha.indexOf("9") == -1 &&
               senha.indexOf("0") == -1) {
         alert("Erro na senha: Falta de caracter especial e número")
    }
     else if (senha != senhaRepetido) {
        alert("Erro na Senha: senhas não correspondentes")
    } else if (cidade == '') {
        alert("Erro na Cidade: preencha o campo")
    } else if (rua == '') {
        alert("Erro na Rua: preencha o campo")
    } else if (numero == '') {
        alert("Erro no Número: preencha o campo")
    } else if (cep == '') {
        alert("Erro no Cep: preencha o campo")
    } else if (cep.length != 9) {
        alert("Erro no Cep: preencha o dado corretamente")
    } else {
        alert("Tudo de boa")
    }
    

    
    
    console.log(email.indexOf("@"))

}