package com.kh.styleblending.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.kh.styleblending.board.model.service.BoardService;
import com.kh.styleblending.board.model.vo.Board;
import com.kh.styleblending.board.model.vo.FashionBoard;
import com.kh.styleblending.board.model.vo.PageInfo;
import com.kh.styleblending.board.model.vo.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	
	// 업로드된 파일이 저장될 위치 
	private final String PATH = "C:/finalSpringlocal/finalProject/StyleBlending/src/main/webapp/resources/bImgUploadFiles/";
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping("blist.do")
	public ModelAndView boardList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int listCount = bService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bService.selectList(pi);
		
		//System.out.println(list);
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/list");
		
		return mv;
		
	}
	
	@RequestMapping("fblist.do")
	public ModelAndView fashionBoardList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int listCount = bService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<FashionBoard> list = bService.fashionSelectList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/fashionList");
		
		return mv;
		
	}
	
	@RequestMapping("binsertForm.do")
	public String insertBoardForm() {
		
		return "board/listDetailWrite";
	}
	
	
	@RequestMapping("binsert.do")
	public String insertBoard(Board b , HttpServletRequest request, Model model) {
								//System.out.println(b);
		
		
		int result = bService.insertBoard(b);
		//System.out.println(result);
		
		
		if(result > 0) {
			
			return "redirect:blist.do";
			
		}else {
			model.addAttribute("msg","게시판 작성 실패");
			return "common/errorPage";
		}
		
	}
	
	
	
	// ckeditor 이미지 업로드
	@RequestMapping(value = "imageUpload.do", method = RequestMethod.POST)
	public String imageUpload(HttpServletRequest request, HttpServletResponse response,
							MultipartFile upload) {
		System.out.println("dd");
		JsonObject json = new JsonObject();
		OutputStream out = null;
		PrintWriter printWriter = null;

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		try {

			// CKEDITOR에서 업로드된 파일의 이름을 참조

			String fileName = upload.getOriginalFilename();
			//System.out.println("fileName:"+fileName);
			// CKEDITOR에서 업로드된 파일을 byte 배열로 참조

			byte[] bytes = upload.getBytes(); /* 이미지 포함 모든 데이터는 바이트 */

			// 실제 업로드 될 톰캣서버의 물리적 경로

			HttpSession session = request.getSession();

			String root_path = session.getServletContext().getRealPath("resources");

			// 실서버 톰캣 스왑시 주석변경

			String uploadPath = root_path + "/" + "bImgUploadFiles/" + fileName; 

			//System.out.println("uplaodPath:"+uploadPath);

			// 출력스트객체 생성(파일생성)

			out = new FileOutputStream(new File(uploadPath)); /* 빈폴더 생성 */

			// 업로드된 파일의 바이트배열을 출력스트림에 사용.

			out.write(bytes); /* 실제 파일에대한 정보를 담고있음 */

			out.flush();

			String callback = request.getParameter("CKEditorFuncNum");

			printWriter = response.getWriter(); /// responese 서버측에서 클라이언트로 정보를 보내고자 할때 그역활을 담당하는 객체...

			// CKEDITOR에 업로드 된 서버측의 파일경로를 반환하는 목적

			String fileUrl = "resources/bImgUploadFiles"+ "/" + fileName; 

			//System.out.println("왜 찍어야?"+fileUrl);

//			printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
//
//					+ callback
//
//					+ ",'"
//
//					+ fileUrl
//
//					+ "','이미지를 업로드 하였습니다.'"
//
//					+ ")</script>");

			 json.addProperty("uploaded", 1);
             json.addProperty("fileName", fileName);
             json.addProperty("url", fileUrl);
             
             response.setContentType("application/json; charset=UTF-8");
             printWriter.println(json);
			
			printWriter.flush();

		} catch (IOException e) {

			e.printStackTrace();

		} finally {

			try {

				if (out != null) {
					out.close();
				}

				if (printWriter != null) {
					printWriter.close();
					
				}

			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return null;
	}
 
	
	@RequestMapping("bdetail.do")
	public ModelAndView boardDetail (int bno, ModelAndView mv) {
	
		Board b = bService.selectBoard(bno);
		
		if(b != null) {
			mv.addObject("b", b).setViewName("board/listDetail");
		}else {
			mv.addObject("msg","게시판 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	@RequestMapping("bdelete.do")
	public String boardDelete(int bno,HttpServletRequest request) {
		
		Board b = bService.selectUpdateBoard(bno);
		
		int result = bService.deleteBoard(bno);
		
		if(result > 0) {
			return "redirect:blist.do";
		}else {
			return "common/errorPage";
		}
		
	}
	
	
}
