package kopo.poly.controller;

import kopo.poly.dto.ResponseDto;
import kopo.poly.model.ProductBoard;
import kopo.poly.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductBoardController {
	
	@Autowired
	private BoardService boardService;

	@GetMapping({ "", "/" })
	public String index(Model Productmodel, @RequestParam(required = false, defaultValue = "") String search,
	@PageableDefault(size = 9, sort = "id", direction = Sort.Direction.DESC) Pageable Productpageable){



	Productmodel.addAttribute("productboards", boardService.ProductListSearch(search, Productpageable));


	Productmodel.addAttribute("productboards3", boardService.ProductList3(Productpageable));
	Productmodel.addAttribute("productboards2",boardService.ProductList2());
	Productmodel.addAttribute("productboards4",boardService.FavoriteList());

	return "productpageindex";

}


	
	@GetMapping("/productboard/{id}")
	public String findById(@PathVariable int id, Model Productmodel, @PageableDefault(size = 6, sort = "id", direction = Sort.Direction.DESC) Pageable rpageable) {
		Productmodel.addAttribute("productboard", boardService.Productdetail(id));
		Productmodel.addAttribute("productboards2",boardService.ProductList2());
		Productmodel.addAttribute("favorites2",boardService.CartList2());
		Productmodel.addAttribute("productboarda",boardService.FavoriteList2(rpageable));
		Productmodel.addAttribute("productrreply", boardService.Replylist(rpageable));
		Productmodel.addAttribute("productreply", boardService.Replylist2(rpageable));
		return "board/productdetail";

	}
	

	@GetMapping("/productboard/{id}/updateForm")
	public String updateForm(@PathVariable int id, Model Productmodel) {
		Productmodel.addAttribute("productboard", boardService.Productdetail(id));
		return "board/productupdateForm";
	}
	

}
