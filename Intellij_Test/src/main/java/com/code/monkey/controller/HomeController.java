package com.code.monkey.controller;

import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Locale;

@Controller
@AllArgsConstructor
public class HomeController {
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @RequestMapping(value= "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
        logger.info("Welcome home! The Client Locale is {}", locale);
        model.addAttribute("page", "home");

        return "index";
    }

    @RequestMapping(value="/test", method = RequestMethod.GET)
    public String test(Locale locale, Model model) {
        logger.info("Welcome Test! The Client Locale is {}", locale);
        model.addAttribute("page", "test");

        return "index";
    }
    @RequestMapping(value="/sub1_Tab", method = RequestMethod.GET)
    public String sub1(Locale locale, Model model) {
        logger.info("Welcome Sub1_Tab! The Client Locale is {}", locale);
        model.addAttribute("page", "sub1_Tab");

        return "index";
    }
    @RequestMapping(value="/member/register", method = RequestMethod.GET)
    public String register(Model model) {
        logger.info("Welcome Register!");
        model.addAttribute("page", "register");

        return "index";
    }
}
