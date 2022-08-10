package com.kh.campervalley.cs.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.campervalley.common.CamperValleyUtils;
import com.kh.campervalley.cs.model.dto.Notice;
import com.kh.campervalley.cs.model.dto.NoticeAttach;
import com.kh.campervalley.cs.model.dto.NoticeExt;
import com.kh.campervalley.cs.model.service.CsService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/cs")
@Slf4j
public class CsController {
	
	@Autowired
	private CsService csService;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@GetMapping("/noticeList")
	public ModelAndView noticeList(ModelAndView mav, HttpServletRequest request) {
		try {
			List<NoticeExt> list = csService.selectNoticeList();
			log.debug("list = {}", list);
			mav.addObject("list", list);
			
			mav.setViewName("cs/noticeList");
		} catch (Exception e) {
			log.error("공지사항 조회 오류", e);
		}
		
		return mav;
	}
	
	@GetMapping("/noticeEnroll")
	public void noticeEnroll() {}

	@PostMapping("/noticeEnroll")
	public String noticeEnroll(NoticeExt notice, @RequestParam("upFile") MultipartFile[] upFiles, RedirectAttributes redirectAttr) throws Exception {
		try {
		log.debug("notice = {}", notice);
		
		String saveDirectory = application.getRealPath("/resources/upload/cs");
		
		for(MultipartFile upFile : upFiles) {
			if (upFile.getSize() > 0) {
				
				String originalFilename = upFile.getOriginalFilename();
				String renamedFilename = CamperValleyUtils.getRenamedFilename(originalFilename);
				log.debug("renamedFilename = {}", renamedFilename);
				
				File destFile = new File(saveDirectory, renamedFilename);
				upFile.transferTo(destFile);
				
				NoticeAttach attach = new NoticeAttach();
				attach.setOriginalFilename(originalFilename);
				attach.setRenamedFilename(renamedFilename);
				notice.addAttachment(attach);
			}
		}
			
			int result = csService.noticeInsert(notice);
			redirectAttr.addFlashAttribute("msg", "게시글이 등록되었습니다.");
		} catch (IOException e) {
			log.error("첨부파일 저장 오류", e);
			throw e; 
		} catch (Exception e) {
			log.error("게시글 등록 오류", e);
			throw e;
		}
		
		return "redirect:/cs/noticeList";
	}

	@GetMapping("/noticeUpdate")
	public void noticeUpdate() {}

	@GetMapping("/noticeDetail")
	public ModelAndView noticeDetail(@RequestParam int noticeNo, ModelAndView mav) {
		try {
			NoticeExt notice = csService.selectOneNotice(noticeNo);
			log.debug("notice = {}", notice);
			mav.addObject("notice", notice);
			
			mav.setViewName("cs/noticeDetail");
		} catch (Exception e) {
			log.error("공지사항 조회 오류", e);
			throw e;
		}
		return mav;
	}

	@GetMapping("/faq")
	public ModelAndView faq(ModelAndView mav,
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String searchKeyword,
			@RequestParam(defaultValue = "1") int cPage,
			HttpServletRequest request) {
		try {
			int numPerPage = 7;
			int offset = (cPage - 1) * numPerPage;
			
			Map<String, Object> map = new HashMap<>();
			map.put("searchType", searchType);
			map.put("searchKeyword", searchKeyword);
			map.put("numPerPage", numPerPage);
			map.put("offset", offset);
			
			List<Notice> list = csService.selectFaqList(map);
			int totalContent = csService.selectTotalFaqList(map);
			log.debug("list = {}", list);
			
			String url = request.getRequestURI();
			String pagebar = CamperValleyUtils.getPagebar(cPage, numPerPage, totalContent, url);
			log.debug("map = {}" + map);
			
			mav.addObject("list", list);
			mav.addObject("map", map);
			mav.addObject("pagebar", pagebar);
			
		} catch (Exception e) {
			log.error("faq 조회 오류", e);
		}
		return mav;
	}
	
	@PostMapping("/faqDelete")
	public String faqDelete(@RequestParam int noticeNo, Notice notice, RedirectAttributes redirectAttr) {
		try {
			int result = csService.faqDelete(noticeNo);
			redirectAttr.addFlashAttribute("msg", "게시글이 삭제되었습니다.");
		} catch (Exception e) {
			log.error("FAQ 삭제 오류", e);
		}
		return "redirect:/cs/faq";
	}
	
	@GetMapping("/faqEnroll")
	public void faqEnroll() {}
	
	@PostMapping("/faqEnroll")
	public String faqEnroll(Notice notice, RedirectAttributes redirectAttr) {
		try {
			log.debug("notiec = {}", notice);
			
			int result = csService.faqInsert(notice);
			log.debug("result = {}", result);
			
			redirectAttr.addFlashAttribute("msg", "게시글이 등록되었습니다.");
		} catch (Exception e) {
			log.error("FAQ 등록 오류", e);
		}
		return "redirect:/cs/faq";
	}
	
	@GetMapping("/faqUpdate")
	public String faqUpdate(@RequestParam int noticeNo, Model model) {
		try {
			Notice notice = csService.selectOneFaq(noticeNo);
			log.debug("notice = {}", notice);
			model.addAttribute("notice", notice);
		} catch (Exception e) {
			log.error("FAQ 수정 오류", e);
		}
		return "cs/faqUpdate";
	}
	
	@PostMapping("/faqUpdate")
	public String faqUpdate(Notice notice, RedirectAttributes redirectAttr) {
		int result = csService.faqUpdate(notice);
		redirectAttr.addFlashAttribute("msg", "게시글이 수정되었습니다.");
		return "redirect:/cs/faq";
	}

}
