package com.code.monkey.controller;

import com.code.monkey.service.MemberService;
import com.code.monkey.vo.MemberVO;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/move/**")
public class MovePageController {
  private static final Logger logger = LoggerFactory.getLogger(MovePageController.class);

  MemberService memberService;
  @RequestMapping(value="/member/register", method = RequestMethod.GET)
  public String Register(Model model) {
    logger.info("Welcome Register!");
    model.addAttribute("page", "register");

    return "index";
  }

  @RequestMapping(value="/member/profile", method = RequestMethod.GET)
  public String MyProfile(Model model, HttpServletRequest request) {
    logger.info("Welcome Profile!");
    model.addAttribute("page", "myProfile");
    model.addAttribute("member_detail", "view");
    HttpSession session = request.getSession();
    //유저의 정보를 들고 가야한다 왜냐면 유저의 상세보기 이기때문에.
    MemberVO vo = (MemberVO) session.getAttribute("userInfo");

    logger.info("어떤 정보를 가지고 있니? " + vo);

    return "index";
  }
  @RequestMapping(value="/member/profile/modify", method = RequestMethod.GET)
  public String MyProfileModify(Model model, HttpServletRequest request) {
    model.addAttribute("page", "myProfile");
    model.addAttribute("member_detail", "modify");

    HttpSession session = request.getSession();
    //유저의 정보를 들고 가야한다 왜냐면 유저의 상세보기 이기때문에.
    MemberVO vo = (MemberVO) session.getAttribute("userInfo");

    logger.info("어떤 정보를 가지고 있니? " + vo);

    return "index";
  }
}
