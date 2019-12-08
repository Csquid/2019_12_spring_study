package com.code.monkey.controller;

import com.code.monkey.vo.MemberVO;
import com.code.monkey.service.MemberService;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping(value="/user/**")
public class MemberController {
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    MemberService memberService;

    @RequestMapping(value="/", method = RequestMethod.GET)
    public String index(Model model, @RequestBody MemberVO udo, HttpServletRequest request) {
        logger.info("UserController /user/login");
        logger.info(udo.toString());

        return "index";
    }

    @RequestMapping(value="/getUserInfo", method = RequestMethod.GET)
    public String getMember(Model model) {
        MemberVO nMemberObj = memberService.selectMember("lake0019");

        if(nMemberObj != null) {
            logger.info("Data: " + nMemberObj.toString());
        } else {
            logger.info("Data is Null");
        }

        return "index";
    }
    @RequestMapping(value="/getMemberAll", method = RequestMethod.GET)
    public String getMembers(Model model) {
        List<MemberVO> nMemberObj = memberService.selectMembers();

        if(nMemberObj != null) {
            logger.info("Data: " + nMemberObj.toString());
        } else {
            logger.info("Data is Null");
        }

        return "index";
    }
}
