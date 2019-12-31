package com.code.monkey.controller;

import com.code.monkey.util.FileUploadUtils;
import com.code.monkey.vo.ProfileImageVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Controller
public class FileUploadController {
  @Autowired
  FileUploadUtils fileUploadService;

  private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);

  @RequestMapping("/form")
  public String form() {
    return "form";
  }

  @RequestMapping("/upload_test")
  public String upload(Model model, @RequestParam("email") String email,
                       @RequestParam("file1") MultipartFile file) {

    //String url = fileUploadService.setProfileVO(file);
    //model.addAttribute("url", url);
    model.addAttribute("page", "result");
    return "index";
  }

  @RequestMapping(value = "/imageProfileUpload", method = RequestMethod.POST)
  public String imageProfileUpload(Model model, @RequestParam("file") MultipartFile file, HttpServletRequest request) {
    ProfileImageVO vo = new ProfileImageVO();

    logger.info("data: " + file);
    //String originalFileName = file.getOriginalFilename();

    return null;
  }

  @ResponseBody
  @RequestMapping(value = "/makeProfileVO", method = RequestMethod.POST)
  public ProfileImageVO makeProfileVO(Model model, @RequestParam("file") MultipartFile file, HttpServletRequest request) {
    ProfileImageVO vo = fileUploadService.setProfileVO(file);

    if(vo != null) {
      logger.info("setData: " + vo);
    }
    return null;
  }
}