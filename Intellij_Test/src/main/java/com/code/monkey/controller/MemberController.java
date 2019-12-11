package com.code.monkey.controller;

import com.code.monkey.vo.MemberVO;
import com.code.monkey.service.MemberService;
import lombok.AllArgsConstructor;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping(value="/member/**")
public class MemberController {
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    MemberService memberService;

    @RequestMapping(value="/", method = RequestMethod.GET)
    public String index(Model model, @RequestBody MemberVO udo, HttpServletRequest request) {
        logger.info("UserController /user/login");
        logger.info(udo.toString());

        return "index";
    }

    @ResponseBody
    @RequestMapping(value="/login", method = RequestMethod.POST)
    public String login(Model model, @RequestBody MemberVO vo, HttpServletRequest request) {
        logger.info("Member Controller");
        logger.info("Vo Data: " + vo.toString());

        HttpSession session = request.getSession();

        logger.info("Break 1");
        MemberVO tempObject = memberService.searchMemberID(vo);
        JSONObject jsonObject = new JSONObject();

        logger.info("Break 2");
        if(tempObject != null) {
            if(vo.getPw().equals(tempObject.getPw())) {
                jsonObject.put("alias", tempObject.getAlias());
                jsonObject.put("signal", "success");

                session.setAttribute("userInfo", tempObject);
                jsonObject.put("userInfo", session.getAttribute("userInfo"));
                return jsonObject.toString();
            } else {
                jsonObject.put("detail", "Wrong Password");
                jsonObject.put("signal", "fail");

                return jsonObject.toString();
            }
        } else {
            jsonObject.put("detail", "Wrong ID or Empty Account");
            jsonObject.put("signal", "fail");

            return jsonObject.toString();
        }
    }

    @RequestMapping(value="/getUserInfo", method = RequestMethod.GET)
    public String getMember(Model model) {
        //MemberVO nMemberObj = memberService.searchMember("");

        /*
        if(nMemberObj != null) {
            logger.info("Data: " + nMemberObj.toString());
        } else {
            logger.info("Data is Null");
        }
        */
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
