package com.example.idea.Controller;

import com.example.idea.Entity.Relative;
import com.example.idea.Entity.User;
import com.example.idea.Repo.RelativeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class MainController {


    @Autowired
    private RelativeRepository relativeRepository;


    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Relative> relatives;

        if (filter != null && !filter.isEmpty()) {
            relatives = relativeRepository.findByName(filter);
        } else {
            relatives = relativeRepository.findAll();
        }

        model.addAttribute("relatives", relatives);
        model.addAttribute("filter", filter);

        return "main";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String name, @RequestParam String phone,
            Model model
    ){
        Relative relative = new Relative(name, phone, user);

        relativeRepository.save(relative);


        Iterable<Relative> relatives = relativeRepository.findAll();

        model.addAttribute("relatives", relatives);

        return "main";
    }


}

