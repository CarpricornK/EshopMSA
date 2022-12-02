package kopo.poly.repository;

import kopo.poly.model.ProductBoard;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;


public interface ProductBoardRepository extends JpaRepository<ProductBoard, Integer>{

    Page<ProductBoard> findProductBoardByTitleContains(String search, Pageable pageable);
}