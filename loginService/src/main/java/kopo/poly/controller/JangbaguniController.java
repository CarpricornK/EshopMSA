package kopo.poly.controller;

import kopo.poly.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class JangbaguniController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping({ "", "/productfavorite" })
	public String index(Model jamodel,
			@PageableDefault(size = 1000, sort = "id", direction = Sort.Direction.DESC) Pageable favoriteProductpageable) {
		jamodel.addAttribute("favorites", boardService.CartList(favoriteProductpageable));
		jamodel.addAttribute("favorites2",boardService.CartList2());
		jamodel.addAttribute("productboards2",boardService.ProductList2());
		return "productfavorite";
}
	

}
