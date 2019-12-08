package com.spring.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/main")
public class main {

    @RequestMapping(value = {"/main", "/main.do"}, method = RequestMethod.GET)
    public ModelAndView openTilesView(ModelAndView mv) throws Exception {
        mv.setViewName("/main/main");  //타일즈 view => 일반 view

        return mv;
    }
}
