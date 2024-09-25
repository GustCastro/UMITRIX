let botaoIrParaCima = document.getElementById("btn_cima");

window.onscroll = function() {mostrarBotao()};

function mostrarBotao() {
    botaoIrParaCima.style.display = "none";
    
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        botaoIrParaCima.style.display = "block";
    }
}

function irParaCima() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}