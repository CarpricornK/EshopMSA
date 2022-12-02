package kopo.poly.controller;

import kopo.poly.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@GetMapping("/board/{id}")
	public String findById(@PathVariable int id, Model model) {
		model.addAttribute("board", boardService.boarddetail(id));
		return "board/detail";

	}

	@GetMapping("/board/{id}/updateForm")
	public String updateForm(@PathVariable int id, Model model) {
		model.addAttribute("board", boardService.boarddetail(id));
		return "board/updateForm";
	}

// USER 권한이 필요
	@GetMapping("/board/saveForm")
	public String saveForm() {
		return "board/saveForm";
	}
	
	@GetMapping("/board/ProductsaveForm")
	public String ProductsaveForm() {
		return "board/ProductsaveForm";
	}
	
	@GetMapping("/board/productdetail")
	public String productdetail() {
		return "board/productdetail";
	}
	
	
}
