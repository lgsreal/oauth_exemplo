package br.com.fiap.oauth_exemplo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PagesController {
    @GetMapping("/")
    public String home() {
        return "Página inicial pública";
    }

    @GetMapping("/logado")
    public String logado() {
        return "Página privada apenas para usuários logados";
    }
}
