package com.code.monkey.controller;

import com.code.monkey.service.FileUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {
  @Autowired
  FileUploadService fileUploadService;

  @RequestMapping( "/form" )
  public String form() {
    return "form";
  }

  @RequestMapping( "/upload_test" )
  public String upload( Model model, @RequestParam("email") String email,
                        @RequestParam("file1") MultipartFile file) {

    String url = fileUploadService.restore(file);
    model.addAttribute("url", url);
    model.addAttribute("page", "result");
    return "index";
  }
}