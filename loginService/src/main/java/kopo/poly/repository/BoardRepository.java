package kopo.poly.repository;

import kopo.poly.model.Board;
import org.springframework.data.jpa.repository.JpaRepository;


public interface BoardRepository extends JpaRepository<Board, Integer>{

}