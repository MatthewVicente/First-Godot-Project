# First-Godot-Project
Este projeto foi inspirado no primeiro tutorial de Godot do Brackeys e será utilizado para aprendizado da Engine e lançamento do primeiro jogo.


Conectar com server
    ssh -i {./path-to-key-pairs} ec2-user@{dns-address}

Rodar servidor dedicado em segundo plano
    {path-to-sh-file} &

Matar processo do servidor dedicado
    ps -A | grep {sh-file-name}
    kill {process-id}