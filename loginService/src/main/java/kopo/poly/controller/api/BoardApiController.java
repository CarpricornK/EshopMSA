package kopo.poly.controller.api;

import kopo.poly.dto.ResponseDto;
import kopo.poly.model.*;
import kopo.poly.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RestController
public class BoardApiController {

	@Autowired
	private BoardService boardService;
	
	@PostMapping("/api/board")
	public ResponseDto<Integer> save(@RequestBody Board board) { 
		boardService.writeboard(board);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
    @DeleteMapping("/api/board/{id}")
	public ResponseDto<Integer> deleteById(@PathVariable int id){
		boardService.boarddelete(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
    
    @PutMapping("/api/board/{id}")
    public ResponseDto<Integer> update(@PathVariable int id, @RequestBody Board board){
    	boardService.boardupdate(id,board);
       return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
    }
    // 데이터 받을 때 컨트롤러에서 dto를 만들어서 받는게 좋다.
    // dto 사용하지 않은 이유는 소규모 프로젝트라 이렇게함
    @PostMapping("/api/board/{boardid}/reply")
	public ResponseDto<Integer> replySave(@PathVariable int boardid, @RequestBody Reply reply) { 
    	boardService.replywrite( boardid, reply);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
   
    @DeleteMapping("/api/board/{boardid}/reply/{replyid}")
	public ResponseDto<Integer> replySave(@PathVariable int replyid) { 
    	boardService.replydelte(replyid);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
    
}
    
    //============================== 제품 =================================
	
	@PostMapping("/api/productboard")
	public ResponseDto<Integer> productsave(@RequestBody ProductBoard productBoard) { 
		boardService.ProductWrite(productBoard);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
    
	
	
	 @DeleteMapping("/api/productboard/{id}")
		public ResponseDto<Integer> productdeleteById(@PathVariable int id){
			boardService.Productdelte(id);
			return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
		
		}
	    
	    @PutMapping("/api/productboard/{id}")
	    public ResponseDto<Integer> productupdate(@PathVariable int id, @RequestBody ProductBoard productboard){
	    	boardService.Productupdate(id,productboard);
	       return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	    }
	    
	    @PutMapping("/api/productboardcount/{id}")
	    public ResponseDto<Integer> productupdatecount(@PathVariable int id, @RequestBody ProductBoard productboard){
	    	boardService.ProductCountUp(id,productboard);
	       return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	    }
	    
	    @PutMapping("/api/productboardcount/{productboardid}/count/{productboardcount}")
	  		public ResponseDto<Integer> productcount(@PathVariable int productboardid, @RequestBody ProductBoard productboard) { 
	  	    	boardService.ProductCountUp2(productboardid, productboard);
	  			return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	  	}
	    
	
	    
	    // 데이터 받을 때 컨트롤러에서 dto를 만들어서 받는게 좋다.
	    // dto 사용하지 않은 이유는 소규모 프로젝트라 이렇게함
	    @PostMapping("/api/productboard/{productboardid}/reply")
		public ResponseDto<Integer> productreplySave(@PathVariable int productboardid, @RequestBody ProductReply reply) { 
	    	boardService.Productreply( productboardid, reply);
			return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
		}
	   
	    @DeleteMapping("/api/productboard/{productboardid}/productreply/{productreplyid}")
		public ResponseDto<Integer> productreplySave(@PathVariable int productreplyid) { 
	    	boardService.Productrepltdelete(productreplyid);
			return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	    
	    @DeleteMapping("/api/replyproductboard/{productboardid}/replyreply/{productreplyreplyid}")
		public ResponseDto<Integer> productreplyreplySave(@PathVariable int productreplyreplyid) { 
	    	boardService.Productrepltdelete2(productreplyreplyid);
			return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	    
		@PostMapping("/api/productboard/favorite")
		public ResponseDto<Integer> favoritesave(@RequestBody Favorite favorite) { 
			boardService.CartSave(favorite);
			return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
		}
		
	    @PostMapping("/api/productboardjim")
			public ResponseDto<Integer> favoritejim(@RequestBody FavoriteJim favoriteJim) { 
				boardService.ProductFavorite(favoriteJim);
				return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
			}
	    
	    @DeleteMapping("/api/productboardjim/{fid}")
		public ResponseDto<Integer> favoritejimu(@PathVariable int fid){
			boardService.ProductFavoritedelete(fid);
			return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
		
		}
		
// ===================== 대답글 ====================
		@PostMapping("/api/replyproductboard/{productboardid}/replyreply")
		public ResponseDto<Integer> productreplyreplySave(@PathVariable int productboardid, @RequestBody ProductReplyReply ReplyReply) { 
			boardService.Rereply(productboardid, ReplyReply);
			return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
		}
	    
		
		  
		    @PutMapping("/api/favoriteid/{favoriteid}/favoritedelivery/{favoritedelivery}")
		  		public ResponseDto<Integer> deliveryupdate(@PathVariable int favoriteid, @RequestBody Favorite favorite) { 
		  	    	boardService.Dval(favoriteid, favorite);
		  			return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
		  	}
		    
		    @PutMapping("/api/productboardmc/{id}")
		    public ResponseDto<Integer> favoritemupdate(@PathVariable int id, @RequestBody ProductBoard productboard){
		    	System.out.println("oK:"+id);
		       boardService.ProductCountUpdate(id,productboard);
		       return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
		    }

//"/search/rboard/"+data.search, 비동기 검색



}