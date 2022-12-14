package kopo.poly.repository;

import kopo.poly.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

// DAO
// 자동으로 bean등록이 된다.
// @Repository // 생략 가능하다.
public interface UserRepository extends JpaRepository<User, Integer>{
//  JPA Naming 쿼리
//  SELECT * FROM user WHERE username = ?1 AND password = ?2;
	
//	@Query(value="SELECT * FROM user WHERE username = ?1 AND password = ?2", nativeQuery = true)
//	User login(String username, String password);
	
	Optional<User> findByUsername(String username);


}