package com.code.monkey.controller;

import com.code.monkey.vo.MemberVO;
import com.code.monkey.service.MemberService;
import lombok.AllArgsConstructor;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/member/**")
public class MemberController {
  private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

  MemberService memberService;

  @ResponseBody
  @RequestMapping(value = "/login", method = RequestMethod.POST)
  public String login(@RequestBody MemberVO vo, HttpServletRequest request) {
    logger.info("Member Controller");
    logger.info("Vo Data: " + vo.toString());

    HttpSession session = request.getSession();

    MemberVO tempObject = memberService.searchMemberID(vo);
    JSONObject jsonObject = new JSONObject();

    if (tempObject != null) {
      if (vo.getPw().equals(tempObject.getPw())) {
        jsonObject.put("alias", tempObject.getAlias());
        jsonObject.put("signal", "success");

        session.setAttribute("userInfo", tempObject);
        //jsonObject.put("userInfo", session.getAttribute("userInfo"));
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

  @ResponseBody
  @RequestMapping(value = "/register/create", method = RequestMethod.POST)
  public String registerMember(@RequestBody MemberVO vo) {
    JSONObject jsonObject = new JSONObject();

    //아이디 검색
    MemberVO checkOverlapID = memberService.searchMemberID(vo);
    //닉네임 검색
    MemberVO checkOverlapAlias = memberService.searchMemberAlias(vo);

    jsonObject.put("overlap_id", false);
    jsonObject.put("overlap_alias", false);

    //만약 id, name 데이터 검색에서 데이터가 존재: 데이터가 중복된다.
    if (checkOverlapID != null || checkOverlapAlias != null) {
      jsonObject.put("signal", "fail");
      jsonObject.put("overlap", true);
      if (checkOverlapID != null) {
        jsonObject.put("overlap_id", true);
      }
      if (checkOverlapAlias != null) {
        jsonObject.put("overlap_alias", true);
      }

      return jsonObject.toString();
    } else {
      jsonObject.put("overlap", false);
    }

    int checkResult = memberService.insertMember(vo);

    logger.info("checkResult: " + checkResult);

    //회원가입이 되었을때 checkResult는 양수를 반환
    //회원가입이 되지 않았을때 checkResult는 음수를 반환
    if (checkResult > 0) {            //register success
      jsonObject.put("signal", "success");
    } else {                  //register fail
      jsonObject.put("signal", "fail");
    }

    return jsonObject.toString();
  }

  @ResponseBody
  @RequestMapping(value = "/register/overlap/id", method = RequestMethod.POST)
  public String overlapCheckID(@RequestBody MemberVO vo) {
    JSONObject jsonObject = new JSONObject();
    MemberVO checkOverlapIdVo = memberService.searchMemberID(vo);

    if(checkOverlapIdVo == null) {
      jsonObject.put("signal", "success");
    } else {
      jsonObject.put("signal", "fail");
    }

    return jsonObject.toString();
  }

  @ResponseBody
  @RequestMapping(value = "/register/overlap/alias", method = RequestMethod.POST)
  public String overlapCheckAlias(@RequestBody MemberVO vo) {
    JSONObject jsonObject = new JSONObject();
    MemberVO checkOverlapAliasVo = memberService.searchMemberAlias(vo);

    if(checkOverlapAliasVo == null) {
      jsonObject.put("signal", "success");
    } else {
      jsonObject.put("signal", "fail");
    }

    return jsonObject.toString();
  }

  @GetMapping(value = "/logout")
  public String logoutUser(Model model, HttpServletRequest request) {
    HttpSession session = request.getSession();

    model.addAttribute("page", "home");
    //세션 삭제
    session.removeAttribute("userInfo");
    return "index";
  }

  @RequestMapping(value = "/getMemberAll", method = RequestMethod.GET)
  public String getMembers(Model model) {
    List<MemberVO> nMemberObj = memberService.selectMembers();

    if (nMemberObj != null) {
      logger.info("Data: " + nMemberObj.toString());
    } else {
      logger.info("Data is Null");
    }

    return "index";
  }
}
