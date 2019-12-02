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

import org.apache.commons.lang3.StringUtils;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
import com.kh.styleblending.board.model.vo.Search;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;

	// 업로드된 파일이 저장될 위치
	private final String PATH = "C:/finalSpringlocal/finalProject/StyleBlending/src/main/webapp/resources/bImgUploadFiles/";

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@RequestMapping("blist.do")
	public ModelAndView boardList(ModelAndView mv, HttpServletRequest request,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {

		/*
		 * HashMap<String, Object> map = new HashMap<String, Object>();
		 * map.put("type",type); map.put("search", search);
		 */

		int listCount = bService.getListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<Board> list = bService.selectList(pi);

		// System.out.println(list);
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/list");

		return mv;

	}

	@RequestMapping("bsearch.do")
	public ModelAndView searchList(ModelAndView mv, HttpServletRequest request,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {

		String type = request.getParameter("type");
		String search = request.getParameter("search");

		// logger.info(type);
		// logger.info(search);

		Search sc = new Search();
		if (type.equals("title")) {
			sc.setTitle(search);

		} else if (type.equals("writer")) {
			sc.setWriter(search);

		} else {
			sc.setContent(search);
		}
		// logger.info("sc : " + sc);

		int listCount = bService.getSearchListCount(sc);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<Board> list = bService.SearchselectList(pi, sc);
		// logger.info("list : " + list);
		// System.out.println(list);
		mv.addObject("pi", pi).addObject("list", list).addObject("sc", sc).addObject("search", search)
				.addObject("type", type).setViewName("board/list");

		return mv;

	}
	
	@RequestMapping("fbsearch.do")
	public ModelAndView fbsearchList(ModelAndView mv, HttpServletRequest request,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {

		String type = request.getParameter("type");
		String search = request.getParameter("search");

		// logger.info(type);
		// logger.info(search);

		Search sc = new Search();
		if (type.equals("title")) {
			sc.setTitle(search);

		} else if (type.equals("writer")) {
			sc.setWriter(search);

		} else {
			sc.setContent(search);
		}
		// logger.info("sc : " + sc);

		int listCount = bService.getfbSearchListCount(sc);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<FashionBoard> list = bService.SearchfselectList(pi, sc);
		// logger.info("list : " + list);
		// System.out.println(list);
		mv.addObject("pi", pi).addObject("list", list).addObject("sc", sc).addObject("search", search)
				.addObject("type", type).setViewName("board/fashionList");

		return mv;

	}
	
	

	@RequestMapping("fblist.do")
	public ModelAndView fashionBoardList(ModelAndView mv, 
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {

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
	public String insertBoard(Board b,FashionBoard fb ,Image i ,ModelAndView mv
									,HttpServletRequest request, HttpServletResponse response,
									@RequestParam(value="bcategory", defaultValue = "") String bcategory,
									Model model, MultipartFile upload, MultipartHttpServletRequest multifile) throws IOException {
		
		//int bno = Integer.parseInt(request.getParameter("bno"));
		
		/*
		 * if(!upload.getOriginalFilename().equals("")) {
		 * 
		 * MultipartFile file = multifile.getFile("upload"); String renameFileName =
		 * imageUpload(request, response, multifile, i);
		 * i.setOriginalImg(upload.getOriginalFilename());
		 * i.setRenameImg(renameFileName); }
		 */
			
		if (bcategory.equals("freeboard")) {
			int result1 = bService.insertBoard(b);
			/*
			 * int result2 = bService.insertbImgFile(i); i.setType("1");
			 */

			if (result1 > 0) {
				return "redirect:blist.do";
			} else {
				model.addAttribute("msg", "게시판 작성 실패");
				return "common/errorPage";
			}

		} else if (bcategory.equals("fashionboard")) {
			int result3 = bService.insertfBoard(fb);
			/*
			 * int result4 = bService.insertfImgFile(i); i.setType("2");
			 */

			if (result3 > 0) {
				return "redirect:fblist.do";
			} else {
				model.addAttribute("msg", "게시판 작성 실패");
				return "common/errorPage";
			}
		}
			
		return null;	 
	}
		


	@RequestMapping(value="imageUpload.do", method=RequestMethod.POST)
	   public String imageUpload(HttpServletRequest request, HttpServletResponse response,
	                           MultipartHttpServletRequest multiFile, Image i) throws IOException {
	      
	      
	      JsonObject json = new JsonObject();
	      PrintWriter printWriter = null;
	      OutputStream out = null;
	      MultipartFile file = multiFile.getFile("upload");
	      
	      String root = request.getSession().getServletContext().getRealPath("resources");
	       
	      String savePath = root + "/bImgUploadFiles";
	      
	      if(file != null) {
	         
	         if(file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
	            
	            String originalImg = file.getOriginalFilename();
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	            String renameImg = sdf.format(new Date(System.currentTimeMillis())) + "." + originalImg.substring(originalImg.lastIndexOf(".")+1);
	            
	            try {
	               
	               byte[] bytes = file.getBytes();
	               
	               File uploadFile = new File(savePath);
	               																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																			
	               if(!uploadFile.exists()) {
	                  uploadFile.mkdir();
	               }
	               
	               out = new FileOutputStream(new File(savePath + "/" + renameImg));
	               
	               out.write(bytes);
	               
	               out.flush();
	               
	               printWriter = response.getWriter();
	               response.setContentType("text/html; charset=utf-8");
	               String fileUrl = "resources/bImgUploadFiles/" + renameImg;
	               
	               json.addProperty("uploaded", 1);
	               json.addProperty("fileName", renameImg);
	               json.addProperty("url", fileUrl);
	               
	               i.setOriginalImg(originalImg);
	               
	               response.setContentType("application/json; charset=UTF-8");
	               printWriter.println(json);
	               
	               printWriter.flush();
	               
	            } catch (IOException e) {

	            	e.printStackTrace();
	            } finally {
	               if(out != null){
	                        out.close();
	                    }
	                    if(printWriter != null){
	                        printWriter.close();
	                    }
	            }
	         }
	      }
	      
	      return null;
	   }
	

	@RequestMapping("bdetail.do")
	public ModelAndView boardDetail(int bno, ModelAndView mv) {

		// Member loginUser = (Member)session.getAttribute("loginUser");

		Board b = bService.selectBoard(bno);

		if (b != null) {
			mv.addObject("b", b).setViewName("board/listDetail");
		} else {
			mv.addObject("msg", "게시판 조회 실패").setViewName("common/errorPage");
		}

		return mv;
	}
	
	@RequestMapping("fbdetail.do")
	public ModelAndView fboardDetail(int fbno, ModelAndView mv) {

		// Member loginUser = (Member)session.getAttribute("loginUser");

		FashionBoard fb = bService.selectfBoard(fbno);

		if (fb != null) {
			mv.addObject("fb", fb).setViewName("board/fashionDetail");
		} else {
			mv.addObject("msg", "게시판 조회 실패").setViewName("common/errorPage");
		}

		return mv;
	}

	
	

	@RequestMapping("bdelete.do")
	public String boardDelete(int bno, HttpServletRequest request) {

		int result = bService.deleteBoard(bno);

		if (result > 0) {
			return "redirect:blist.do";
		} else {
			return "common/errorPage";
		}

	}
	
	@RequestMapping("fbdelete.do")
	public String FboardDelete(int fbno, HttpServletRequest request) {

		int result = bService.FbdeleteBoard(fbno);

		if (result > 0) {
			return "redirect:fblist.do";
		} else {
			return "common/errorPage";
		}

	}

	// 업로드 파일삭제
	public void deleteFile(String renameImg, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");

		String uploadPath = root + "/" + "/bImgUploadFiles";

		File f = new File(uploadPath + "/" + renameImg);

		if (f.exists()) {
			f.delete();
		}
	}

	@RequestMapping("bupateView.do")
	public ModelAndView boardUpdateView(int bno, ModelAndView mv) {

		Board b = bService.selectUpdateBoard(bno);
		mv.addObject("b", b).setViewName("board/listWriteUpdateForm");

		return mv;

	}

	@RequestMapping("fbupateView.do")
	public ModelAndView FboardUpdateView(int fbno, ModelAndView mv) {

		FashionBoard fb = bService.selectUpdatefBoard(fbno);
		mv.addObject("fb", fb).setViewName("board/fbWriteUpdateForm");

		return mv;

	}

	
	@RequestMapping("bupdate.do")
	public ModelAndView boardUpdate(Board b, HttpServletRequest request, ModelAndView mv, MultipartFile upload) {


		int result = bService.updateBoard(b);
		System.out.println("update : " + b);

		if (result > 0) {
			mv.addObject("bno", b.getBno()).setViewName("redirect:bdetail.do");

		} else {
			mv.addObject("msg", "게시판 수정 실패").setViewName("common/errorPage");
		}

		return mv;
	}

	@RequestMapping("fbupdate.do")
	public ModelAndView boardUpdate(FashionBoard fb, HttpServletRequest request, ModelAndView mv, MultipartFile upload) {



		int result = bService.updatefBoard(fb);
		System.out.println("fbupdate : " + fb);

		if (result > 0) {
			mv.addObject("fbno", fb.getFbno()).setViewName("redirect:fbdetail.do");

		} else {
			mv.addObject("msg", "게시판 수정 실패").setViewName("common/errorPage");
		}

		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "replyList.do", produces = "application/json; charset=UTF-8")
	public String replyList(int bno) {

		ArrayList<BoardReply> list = bService.selectBoardReplyList(bno);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		return gson.toJson(list);

	}

	@ResponseBody
	@RequestMapping("rinsert.do")
	public String insertReply(BoardReply r) {

		int result = bService.insertBoardReply(r);

		// System.out.println("result : " + result);

		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}

	}

	@ResponseBody
	@RequestMapping("rupdate.do")
	public String updateReply(int brno, String content) {

		int result = bService.updateBoardReply(brno, content);
		// System.out.println("rupdate : " + result);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	@ResponseBody
	@RequestMapping("rdelete.do")
	public String deleteReply(int brno, HttpServletResponse response) throws IOException {
		System.out.println(brno);

		int result1 = bService.deleteBoardReply(brno);

		if (result1 > 0) {
			return "success";
		} else {
			return "fail";
		}

	}

	// 추천 추가
	@ResponseBody
	@RequestMapping("binsertLike.do")
	public String insertBoardLike(int bno, int mno) {

		int result1 = bService.insertBoardLike(bno, mno);
		int result2 = bService.blikeCheckUp(bno);

		if (result1 > 0 && result2 > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 추천 제거
	@ResponseBody
	@RequestMapping("bdeleteLike.do")
	public String deleteBoardLike(int bno, int mno) {

		int result1 = bService.deleteBoardLike(bno, mno);
		int result2 = bService.blikeCheckDown(bno);

		if (result1 > 0 && result2 > 0) {
			return "success";
		} else {
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
	public ModelAndView insertbDeclare(Declare d, ModelAndView mv) {

		int mno = d.getBno();

		int result = bService.insertbDeclare(d);
		// System.out.println(d);
		if (result > 0) {
			mv.addObject("msg", "게시물을 신고하였습니다.").setViewName("board/listDetail");
			// System.out.println(result);
		} else {
			mv.addObject("msg", "게시물 신고를 실패하였습니다.").setViewName("common/error");
		}

		return mv;
	}

}
