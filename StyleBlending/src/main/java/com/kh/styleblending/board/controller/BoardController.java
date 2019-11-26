package com.kh.styleblending.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.kh.styleblending.board.model.service.BoardService;
import com.kh.styleblending.board.model.vo.Board;
import com.kh.styleblending.board.model.vo.BoardReply;
import com.kh.styleblending.board.model.vo.Declare;
import com.kh.styleblending.board.model.vo.FashionBoard;
import com.kh.styleblending.board.model.vo.Image;
import com.kh.styleblending.board.model.vo.PageInfo;
import com.kh.styleblending.board.model.vo.Pagination;
import com.kh.styleblending.member.model.vo.Member;

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
	public String insertBoard(Board b , HttpServletRequest request, Model model, 
								MultipartFile upload) {
							
//		if(!upload.getOriginalFilename().equals("")) {
//		
//		String renameFileName = saveFile(upload, request);
//		
//		i.setOriginalImg(upload.getOriginalFilename());
//		i.setRenameImg(renameFileName);
//		
//	}
		
		
		int result = bService.insertBoard(b);
		//System.out.println(result);
		
		
		if(result > 0) {
			
			return "redirect:blist.do";
			
		}else {
			model.addAttribute("msg","게시판 작성 실패");
			return "common/errorPage";
		}
		
	}
	
	
	public String saveFile(MultipartFile upload, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/bImgUploadFiles";
		
		File folder = new File(savePath);
		
		if(folder.exists()) {
			folder.mkdirs(); 
		}
		
		String originFileName = upload.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "." 
								+ originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		
		String renamePath = savePath + "/" + renameFileName;
		
		try {
			upload.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
	
	// ckeditor 이미지 업로드
	@RequestMapping(value = "imageUpload.do", method = RequestMethod.POST)
	public String imageUpload(HttpServletRequest request, HttpServletResponse response,
							MultipartFile upload) {
		//System.out.println("dd");
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
	public ModelAndView boardDetail (int bno,ModelAndView mv) {
	
		//Member loginUser = (Member)session.getAttribute("loginUser");
		
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
		
		//Board b = bService.selectUpdateBoard(bno);
		
//		if(b.getRenameImg() != null) {		// 어떻게 보내야하지
//		
//		deleteFile(b.getRenameImg(), request);
//}
		
		int result = bService.deleteBoard(bno);
		
		if(result > 0) {
			return "redirect:blist.do";
		}else {
			return "common/errorPage";
		}
		
	}
	
	
	// 업로드 파일삭제
	public void deleteFile(String renameFileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String uploadPath = root + "/" + "/bImgUploadFiles";
		
		File f = new File(uploadPath + "/" + renameFileName);
		
		if(f.exists()) {
			f.delete();	
		}
	}
		
	
	@RequestMapping("bupateView.do")
	public ModelAndView boardUpdateView(int bno, ModelAndView mv) {
		
		Board b = bService.selectUpdateBoard(bno);
		mv.addObject("b",b).setViewName("board/listWriteUpdateForm");
		
		return mv;
		
	}
	
	
	@RequestMapping("bupdate.do")
	public ModelAndView boardUpdate(Board b , HttpServletRequest request, ModelAndView mv,
							   MultipartFile upload) {
		
//			if(!upload.getOriginalFilename().equals("")) {
//				
//				if(i.getOriginalImg() != null) {
//					deleteFile(i.getRenameImg(), request);
//				}
//			}
//			
//			String renameFileName = saveFile(upload, request);
//			
//			i.setRenameImg(renameFileName);
//			i.setOriginalImg(upload.getOriginalFilename());
		
		int result = bService.updateBoard(b);
		System.out.println("update : " + b);
		
		if(result > 0 ) {
			mv.addObject("bno", b.getBno()).setViewName("redirect:bdetail.do");
			
		}else {
			mv.addObject("msg","게시판 수정 실패").setViewName("common/errorPage");
		}
		
		
		
		return mv;	
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="replyList.do", produces="application/json; charset=UTF-8")
	public String replyList(int bno) {
		
		ArrayList<BoardReply> list = bService.selectBoardReplyList(bno);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(list);
		
	}
	
	
	@ResponseBody
	@RequestMapping("rinsert.do")
	public String insertReply(BoardReply r) {
			
		int result = bService.insertBoardReply(r);
		
		//System.out.println("result : " + result);
		
		if(result > 0 ) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	// 추천 추가
	@ResponseBody
	@RequestMapping("binsertLike.do")
	public String insertBoardLike(int bno, int mno) {
		
		int result1 = bService.insertBoardLike(bno, mno);
		int result2 = bService.blikeCheckUp(bno);
		
		if(result1 > 0 && result2 > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	

	
	// 추천 제거
	@ResponseBody
	@RequestMapping("bdeleteLike.do")
	public String deleteBoardLike(int bno, int mno) {
		
		int result1 = bService.deleteBoardLike(bno, mno);
		int result2 = bService.blikeCheckDown(bno);
		
		if(result1 > 0 && result2 > 0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	
	@ResponseBody
	@RequestMapping("blikeCount.do")
	public String selectBoardLikeCnt(int bno) {
		String result = Integer.toString(bService.selectBoardLikeCnt(bno));
		
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping("blikeCheck.do")
	public String selectBoardLikeCheck(int bno, int mno) {
		
		String result = Integer.toString(bService.selectBoardLikeCheck(bno, mno));
			
		System.out.println("resultCon : " + result);
		
		return result;
	}
	
	
	// 신고
	@RequestMapping("insertbDeclare.do")
	public ModelAndView insertbDeclare(Declare d , ModelAndView mv) {
		
		int mno = d.getBno();
		
		int result = bService.insertbDeclare(d);
		
		if(result > 0 ) {
			mv.addObject("msg", "게시물을 신고하였습니다.").setViewName("redirect:listDetail.do?="+ mno);
		}else {
			mv.addObject("msg", "게시물 신고를 실패하였습니다.").setViewName("common/error");
		}
		
		return mv;
	}
	
	
}
