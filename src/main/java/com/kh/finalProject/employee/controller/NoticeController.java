package com.kh.finalProject.employee.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.employee.model.service.NoticeService;
import com.kh.finalProject.employee.model.vo.NoticeAttachment;
import com.kh.finalProject.employee.model.vo.NoticeVo;
import com.kh.finalProject.professor.common.PageFactory;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	    //공지사항  조회
	    @RequestMapping(value="/notice.hd")
	    public String noticeList(Model model, HttpServletRequest req, 
	    		@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage
	    		) throws Exception{
	        int numPerPage = 5;         
	        
	        List<NoticeVo> list = service.selectNoticeList(cPage, numPerPage);
	        for(NoticeVo n : list) {
	        	n.setRegDate(n.getRegDate().substring(0, 10));
	        }
	        int totalData = service.countNoticeList();
			model.addAttribute("list", list);
			model.addAttribute("totalCount", totalData);
			model.addAttribute("pageBar",
					PageFactory.getPageBar(totalData, cPage, numPerPage, req.getContextPath()+"/notice.hd"));

	        return "employee/notice";
	    }
	    
	    
	    //공지사항 작성 창 전환용
	    @RequestMapping(value="/notice/noticeForm.hd")
	    public String writeNoticeForm() throws Exception{
	    	return "employee/noticeForm";
	    }
	    
	    //공지등록
	    @RequestMapping(value="/notice/insertNotice.hd")
	    public String write(@ModelAttribute("noticeVo") NoticeVo noticeVo, Model model, MultipartFile[] upFile, HttpServletRequest req) throws Exception{
        	String msg = "";
	        String loc = "/notice.hd";
	        //----다중 파일업로드 처리-----
	        
			ModelAndView mv = new ModelAndView();
			String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/NoticeFile");
			
			List<NoticeAttachment> list = new ArrayList<NoticeAttachment>();
					
			File dir = new File(saveDir);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			for(MultipartFile f : upFile) {
				if(!f.isEmpty()) {
					String oriFileName = f.getOriginalFilename();
					String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
					int random = (int)(Math.random()*1000);
					String reName = sdf.format(System.currentTimeMillis())+"_"+random+ext;
					
					f.transferTo(new File(saveDir+"/"+reName));
					NoticeAttachment na = new NoticeAttachment();
					na.setOriFileName(oriFileName);
					na.setReFileName(reName);
					
					list.add(na);
				}
				
			}
			
			try {
				service.insertNotice(noticeVo,list);
				msg = "등록 성공";
			} catch(RuntimeException e) {
				e.printStackTrace();
				msg = "등록 실패";
			}
			
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
			
	        return "common/msg";
	    }
	    
	    //게시글 조회
	    @RequestMapping(value="/notice/viewNoticeDetail.hd")
	    public ModelAndView viewForm(@ModelAttribute("noticeVo") NoticeVo noticeVo,  Model model, HttpServletRequest req, HttpServletResponse res) {
	    	int noticeNo = noticeVo.getBoardNo();
	    	ModelAndView mv = new ModelAndView();
	    	
	    	//쿠키값
	        Cookie[] cookies = req.getCookies();
	        String boardCookieVal = "";
	        boolean hasRead = false;
	        
	        if(cookies != null) {
	           for(Cookie c : cookies) {
	              String name = c.getName();
	              String value = c.getValue();
	              if("boardCookie".equals(name)) {
	                 boardCookieVal = value; //이전값 보관
	                 if(value.contains("|"+noticeVo.getBoardNo()+"|")) {
	                    hasRead = true;
	                    break;
	                 }
	              }
	           }
	        }   
	              
	        //안읽었을때 쿠키에 조회수 추가
	        //현재 profBoardNo에 기록
	        if(!hasRead) {
	           Cookie c = new Cookie("boardCookie",boardCookieVal+"|"+noticeVo.getBoardNo()+"|");
	           c.setMaxAge(-1); //로그아웃시 삭제됨
	           res.addCookie(c);
	        }
	        try {
	           mv.addObject("noticeVo",service.viewNoticeDetail(noticeNo,hasRead));
	           mv.addObject("noticeAttachment",service.selectNoticeAttachment(noticeVo.getBoardNo()));
	        }catch(RuntimeException e) {
	           e.printStackTrace();
	        }
	        
	        mv.setViewName("employee/detailNotice");
	        return mv;
	    }
	    
	    //게시글 수정
	    @RequestMapping(value="/notice/updatenotice.hd")
	    public String updateNotice(@ModelAttribute("noticeVo") NoticeVo noticeVo, Model model) throws Exception{
	        
	            
	           int result =  service.updateNotice(noticeVo);
	            
	        
	        return "redirect:/notice/noticeList.hd";
	        
	    }
	    
	    //게시글 삭제
	    @RequestMapping("/notice/delete.hd")
	    public String deleteNotice(@ModelAttribute("noticeVo") NoticeVo noticeVo , Model model) {
	    	
	    	int result = service.deleteNotice(noticeVo);
	    	
	    	return "";
	    }
	    
	  //파일 다운로드용
	    @RequestMapping("/notice/fileDownLoad.hd")
	    public void fileDownload(String oName, String rName, HttpServletRequest req, HttpServletResponse res) {
	       BufferedInputStream bis = null;
	       ServletOutputStream sos = null;
	       
	       String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/NoticeFile");
	       
	       File downFile = new File(saveDir+"/"+rName);
	       
	       try {
	          FileInputStream fis = new FileInputStream(downFile);
	          bis = new BufferedInputStream(fis);
	          
	          sos = res.getOutputStream();
	          String resFileName = "";
	          
	          boolean isMSIE = req.getHeader("user-agent").indexOf("MSIE")!=-1 || req.getHeader("user-agent").indexOf("Trident")!=-1;
	          
	          if(isMSIE) {
	             resFileName = URLEncoder.encode(oName, "UTF-8");
	             resFileName = resFileName.replaceAll("\\+", "%20");
	          }else {
	             resFileName = new String(oName.getBytes("UTF-8"),"ISO-8859-1");
	          }
	          res.setContentType("application/octet-stream;charset=utf-8");
	          res.addHeader("Content-Disposition", "attachment;filename=\""+resFileName+"\"");
	          
	          res.setContentLength((int)downFile.length());
	          int read = 0;
	          
	          while((read=bis.read())!=-1) {
	             sos.write(read);
	          }
	       }catch(Exception e) {
	          e.printStackTrace();
	       }finally {
	          try {
	             sos.close();
	             bis.close();
	          }catch(IOException e) {
	             e.printStackTrace();
	          }
	       }
	       
	    }
	
		
	
}
