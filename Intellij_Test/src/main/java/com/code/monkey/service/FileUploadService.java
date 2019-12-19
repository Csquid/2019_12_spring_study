package com.code.monkey.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

@Service
public class FileUploadService {
  // 리눅스 기준으로 파일 경로를 작성 ( 루트 경로인 /으로 시작한다. )
  // 윈도우라면 workspace의 드라이브를 파악하여 JVM이 알아서 처리해준다.
  // 따라서 workspace가 C드라이브에 있다면 C드라이브에 upload 폴더를 생성해 놓아야 한다.
  private static final String SAVE_PATH = "/upload";
  private static final String PREFIX_URL = "/upload/";

  public String restore(MultipartFile multipartFile) {
    String url = null;

    try {
      // 파일 정보
      UUID uuid = UUID.randomUUID();
      String originFilename = multipartFile.getOriginalFilename();
      //확장자 이름을 확인시켜준다.
      String originalName = originFilename.substring(0, originFilename.lastIndexOf("."));
      String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
      String savedPath = calcPath();
      Long size = multipartFile.getSize();

      // 서버에서 저장 할 파일 이름
      String saveFileName = uuid + "_" + originalName + "_" + genSaveFileName(extName);

      System.out.println("originFilename : " + originFilename);
      //extension: 확장자
      System.out.println("extensionName : " + extName);
      System.out.println("size : " + size);
      System.out.println("saveFileName : " + saveFileName);

      writeFile(multipartFile, savedPath, saveFileName);

      url = PREFIX_URL + savedPath + File.separator + saveFileName;
    }
    catch (IOException e) {
      // 원래라면 RuntimeException 을 상속받은 예외가 처리되어야 하지만
      // 편의상 RuntimeException을 던진다.
      // throw new FileUploadException();
      throw new RuntimeException(e);
    }
    return url;
  }


  // 현재 시간을 기준으로 파일 이름 생성
  private String genSaveFileName(String extName) {
    String fileName = "";

    Calendar calendar = Calendar.getInstance();
    fileName += calendar.get(Calendar.YEAR);
    fileName += calendar.get(Calendar.MONTH);
    fileName += calendar.get(Calendar.DATE);
    fileName += calendar.get(Calendar.HOUR);
    fileName += calendar.get(Calendar.MINUTE);
    fileName += calendar.get(Calendar.SECOND);
    fileName += calendar.get(Calendar.MILLISECOND);
    fileName += extName;

    return fileName;
  }

  private static String calcPath() {
    Calendar cal = Calendar.getInstance();
    // File.separator : 디렉토리 구분자(\\)
    String ImgUpload = File.separator;
//		System.out.println(ImgUpload);
    // 연도, ex) \\2017
    String yearPath = ImgUpload + File.separator + cal.get(Calendar.YEAR);
    // 월, ex) \\2017\\03
    String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
    // 디렉토리 생성 메서드 호출
    makeDir(FileUploadService.SAVE_PATH, ImgUpload, yearPath, monthPath);
    return monthPath;
  }

  // 디렉토리 생성
  private static void makeDir(String uploadPath, String... paths) {

    //디렉토리가 존재하면
    if (new File(uploadPath + paths[paths.length - 1]).exists()){
      return;
    }
    // 디렉토리가 존재하지 않으면
    for (String path : paths) {
      File dirPath = new File(uploadPath + path);
      // 디렉토리가 존재하지 않으면
      if (!dirPath.exists()) {
        dirPath.mkdir(); //디렉토리 생성
      }
    }
  }

  // 파일을 실제로 write 하는 메서드
  private boolean writeFile(MultipartFile multipartFile, String dirPath, String saveFileName) throws IOException {
    boolean result = false;

    byte[] data = multipartFile.getBytes();
    FileOutputStream fos = new FileOutputStream(SAVE_PATH + dirPath + "/" + saveFileName);
    System.out.println("file-path: " + (SAVE_PATH + dirPath + "/" + saveFileName));
    fos.write(data);
    fos.close();

    return result;
  }
}