package kopo.poly.service;

import kopo.poly.model.*;
import kopo.poly.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

//스프링이 컴포넌트 스캔을 통해서 Bean에 등록을 해줌. IoC를 해준다
@Service
public class BoardService {

	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private ProductBoardRepository productBoardRepository;
	
	@Autowired
	private ReplyRepository replyRepository;
	
	@Autowired
	private ProductReplyRepository productReplyRepository;
	
	@Autowired
	private FavoriteRepository favoriteRepository;
	
	@Autowired
	private ProductReplyReplyRepository productReplyReplyRepository;
	
	@Autowired
	private FavoriteJimRepository favoriteJimRepository;


	//글쓰기
	@Transactional
	public void writeboard(Board board){ // title, content
		board.setCount(0);
		boardRepository.save(board);
	}

	//상품글쓰기
	@Transactional
	public void ProductWrite(ProductBoard productBoard){ // title, content
		productBoard.setCount(0);
		productBoardRepository.save(productBoard);
	}
	

	//글상세보기
	@Transactional(readOnly = true)
	public Board boarddetail(int id) {
		return boardRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("글 상세보기 실패:아이디를 찾을 수 없습니다.");
		});
	}

	//글삭제하기
	@Transactional
	public void boarddelete(int id) {
		boardRepository.deleteById(id);
	}

	//글수정하기
	@Transactional
	public void boardupdate(int id, Board requestBoard) {
		Board board = boardRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("글 찾기 실패 : 아이디를 찾을 수 없습니다.");
		}); // 영속화 완료
		board.setTitle(requestBoard.getTitle());
		board.setContent(requestBoard.getContent());
		// 해당 함수로 종료시에 트랜잭션이 (Service가 종료될 때) 트랜잭션이 종료됩니다. 이때 더티체킹 - 자동 업데이트가 됨.db flush
	}

	//댓글쓰기
	@Transactional
	public void replywrite(int boardid, Reply requestReply) {
		Board board = boardRepository.findById(boardid).orElseThrow(()->{
			return new IllegalArgumentException("댓글 쓰기 실패 : 게시글 id를 찾을 수 없습니다.");
		}); 
		
	
		requestReply.setBoard(board);
		
		replyRepository.save(requestReply);
	}

	//댓글삭제
	@Transactional
	public void replydelte(int replyid) {
		replyRepository.deleteById(replyid);
	}
//	==============================제품===============================


	//제품검색
	@Transactional(readOnly = true)
	public Page<ProductBoard> ProductListSearch(String search, Pageable pageable) {
		return productBoardRepository.findProductBoardByTitleContains(search, pageable);
	}

	//즐겨찾기 목록
	public List<FavoriteJim> FavoriteList(){
		return favoriteJimRepository.findAll();
	}

	//즐겨찾기목록2
	@Transactional(readOnly = true)
	public Page<FavoriteJim> FavoriteList2(Pageable Productpageable) {
		return favoriteJimRepository.findAll(Productpageable);
	}

	//제품목록2
	public List<ProductBoard> ProductList2(){
		return productBoardRepository.findAll();
	}

	//제품목록3
	@Transactional(readOnly = true)
	public Page<ProductBoard> ProductList3(Pageable Productpageable2) {
		return productBoardRepository.findAll(Productpageable2);
	}

	//제품글상세보기
	@Transactional(readOnly = true)
	public ProductBoard Productdetail(int id) {
		return productBoardRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("글 상세보기 실패:아이디를 찾을 수 없습니다.");
		});
	}
	
	
	
	//제품글삭제하기
	@Transactional
	public void Productdelte(int id) {
		productBoardRepository.deleteById(id);
	}

	//제품글수정하기
	@Transactional
	public void Productupdate(int id, ProductBoard productrequestBoard) {
		ProductBoard productboard = productBoardRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("글 찾기 실패 : 아이디를 찾을 수 없습니다.");
		}); // 영속화 완료
		productboard.setTitle(productrequestBoard.getTitle());
		productboard.setAdminname(productrequestBoard.getAdminname());
		productboard.setImg1(productrequestBoard.getImg1());
		productboard.setImg2(productrequestBoard.getImg2());
		productboard.setImg3(productrequestBoard.getImg3());
		productboard.setImg4(productrequestBoard.getImg4());
		productboard.setFee(productrequestBoard.getFee());
		productboard.setType1(productrequestBoard.getType1());
		productboard.setType2(productrequestBoard.getType2());
		productboard.setPrice(productrequestBoard.getPrice());
		productboard.setInfo(productrequestBoard.getInfo());
		productboard.setUsername(productrequestBoard.getUsername());
		productboard.setDiscount(productrequestBoard.getDiscount());
		productboard.setDiscountpercentage(productrequestBoard.getDiscountpercentage());
		productboard.setContent(productrequestBoard.getContent());
		productboard.setMcount(productrequestBoard.getMcount());
		
		// 해당 함수로 종료시에 트랜잭션이 (Service가 종료될 때) 트랜잭션이 종료됩니다. 이때 더티체킹 - 자동 업데이트가 됨.db flush
	}
	//제품재고수수정
	@Transactional
	public void ProductCountUpdate(int id, ProductBoard productrequestBoard) {
		ProductBoard productboard = productBoardRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("글 찾기 실패 : 아이디를 찾을 수 없습니다.");
		}); // 영속화 완료
		productboard.setMcount(productrequestBoard.getMcount());
		
		// 해당 함수로 종료시에 트랜잭션이 (Service가 종료될 때) 트랜잭션이 종료됩니다. 이때 더티체킹 - 자동 업데이트가 됨.db flush
	}
	
	
	
	//제품댓글쓰기
	@Transactional
	public void Productreply(int productboardid, ProductReply productrequestReply) {
		ProductBoard productboard = productBoardRepository.findById(productboardid).orElseThrow(()->{
			return new IllegalArgumentException("댓글 쓰기 실패 : 제품게시글 id를 찾을 수 없습니다.");
		}); 
		
	
		productrequestReply.setProductboard(productboard);
		
		productReplyRepository.save(productrequestReply);
	}
	//제품댓글삭제
	@Transactional
	public void Productrepltdelete(int productreplyid) {
		productReplyRepository.deleteById(productreplyid);
	}
	//제품댓글삭제2
	@Transactional
	public void Productrepltdelete2(int productreplyreplyid) {
		productReplyReplyRepository.deleteById(productreplyreplyid);
	}
	
//	==============================장바구니===============================
	//장바구니
	@Transactional
	public void CartSave(Favorite favorite){
		favoriteRepository.save(favorite);
	}

	//장바구니목록
	@Transactional(readOnly = true)
	public Page<Favorite> CartList(Pageable favorite) {
		return favoriteRepository.findAll(favorite);
	}

	//장바구니목록2
	public List<Favorite> CartList2(){
		return favoriteRepository.findAll();
	}

// =========== 대답글 ============
	//대답글
	@Transactional
	public void Rereply(int productboardid, ProductReplyReply ReplyReply){
		ProductBoard rproductboard = productBoardRepository.findById(productboardid).orElseThrow(()->{
			return new IllegalArgumentException("댓글 쓰기 실패 : 제품게시글 id를 찾을 수 없습니다.");
		}); 
		
	
		ReplyReply.setProductboard(rproductboard);
		
		productReplyReplyRepository.save(ReplyReply);
	}

	
	//댓글글목록
	@Transactional(readOnly = true)
	public Page<ProductReplyReply> Replylist(Pageable rpageable) {
		return productReplyReplyRepository.findAll(rpageable);
	}
	//댓글글목록2
	@Transactional(readOnly = true)
	public Page<ProductReply> Replylist2(Pageable rrpageable) {
		return productReplyRepository.findAll(rrpageable);
	}
	//상품즐겨찾기
	@Transactional
	public void ProductFavorite(FavoriteJim favoriteJim){ // title, content
		favoriteJimRepository.save(favoriteJim);
	}
	//상품즐겨찾기삭제
	@Transactional
	public void ProductFavoritedelete(int fid) {
		favoriteJimRepository.deleteById(fid);
	}
	//제품글조회수증가
	@Transactional
	public void ProductCountUp(int id, ProductBoard productrequestBoard) {
		ProductBoard productboard = productBoardRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("글 찾기 실패 : 아이디를 찾을 수 없습니다.");
		}); // 영속화 완료
		productboard.setCount(productrequestBoard.getCount());
		
	}
	
	//제품글조회수증가2
	@Transactional
	public void ProductCountUp2(int productboardid,ProductBoard productrequestBoard) {
		ProductBoard productboard = productBoardRepository.findById(productboardid).orElseThrow(() -> {
			return new IllegalArgumentException("글 찾기 실패 : 아이디를 찾을 수 없습니다.");
		}); // 영속화 완료
		productboard.setCount(productrequestBoard.getCount());
	}
	//배송여부
	@Transactional
	public void Dval(int favoriteid, Favorite favoriterequestBoard) {
		Favorite favorite = favoriteRepository.findById(favoriteid).orElseThrow(() -> {
			return new IllegalArgumentException("글 찾기 실패 : 아이디를 찾을 수 없습니다.");
		}); // 영속화 완료
		favorite.setDelivery(favoriterequestBoard.getDelivery());
		
	}
}
